import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/api_endpoints.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/network/dio_service.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/core/services/local_note_service.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';
import 'package:uuid/uuid.dart';

class NoteRepositoryImpl implements NoteRepository {

  NoteRepositoryImpl({
    required DioService dioService,
    required LocalNoteService localNoteService,
    required ConnectionService connectionService,
    required AuthRepository authRepository,
  }) : _dioService = dioService,
       _localNoteService = localNoteService,
       _connectionService = connectionService,
       _authRepository = authRepository;
       
  final DioService _dioService;
  final LocalNoteService _localNoteService;
  final ConnectionService _connectionService;
  final AuthRepository _authRepository;

  @override
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      print('🔄 getAllNotes: Starting...');
      
      // Önce local'den notları al
      final localNotes = await _localNoteService.getAllNotes();
      print('📱 getAllNotes: Found ${localNotes.length} local notes');
      
      // Internet bağlantısı varsa server'dan sync et
      if (_connectionService.isConnected) {
        print('🌐 getAllNotes: Internet connected, syncing with server...');
        try {
          final response = await _dioService.dio.get<Map<String, dynamic>>(
            ApiEndpoints.notes,
          );

          if (response.data?['success'] == true) {
            final notesData = response.data!['data'] as List<dynamic>;
            final serverNotes = notesData
                .map(
                  (noteJson) =>
                      NoteModel.fromJson(noteJson as Map<String, dynamic>),
                )
                .toList();
            
            print('📡 getAllNotes: Received ${serverNotes.length} notes from server');
            
            // Server notlarını local'e kaydet (conflict resolution ile)
            for (final serverNote in serverNotes) {
              final localNote = await _localNoteService.getNoteById(serverNote.id);
              
              if (localNote != null) {
                // Conflict resolution: Local daha güncelse local'i koru
                if (localNote.updatedAt.isAfter(serverNote.updatedAt)) {
                  print('🔄 getAllNotes: Local note is newer, keeping local version: ${localNote.title}');
                  // Local notu server'a gönder (background'da)
                  _syncLocalNoteToServer(localNote);
                } else {
                  print('🔄 getAllNotes: Server note is newer, updating local: ${serverNote.title}');
                  await _localNoteService.saveNote(serverNote);
                }
              } else {
                // Local'de yoksa server'dan geleni kaydet
                print('🔄 getAllNotes: New note from server, saving: ${serverNote.title}');
                await _localNoteService.saveNote(serverNote);
              }
            }
            
            // Local'deki pending notları server'a gönder
            final pendingNotes = await _localNoteService.getPendingNotes();
            print('🔄 getAllNotes: Found ${pendingNotes.length} pending notes to sync');
            for (final pendingNote in pendingNotes) {
              print('🔄 getAllNotes: Syncing pending note: ${pendingNote.title}');
              await _syncLocalNoteToServer(pendingNote);
            }
            
            // Güncellenmiş local notları döndür
            final updatedNotes = await _localNoteService.getAllNotes();
            print('✅ getAllNotes: Sync completed, returning ${updatedNotes.length} notes');
            return right(updatedNotes);
          } else {
            print('❌ getAllNotes: Server returned error: ${response.data?['errorMessage']}');
          }
        } catch (e) {
          // Server hatası durumunda local notları döndür
          print('⚠️ getAllNotes: Server sync failed, using local notes: $e');
        }
      } else {
        print('📱 getAllNotes: No internet connection, using local notes only');
      }
      
      // Offline durumda veya server hatası durumunda local notları döndür
      print('📱 getAllNotes: Returning ${localNotes.length} local notes');
      return right(localNotes);
    } on Exception catch (e) {
      print('❌ getAllNotes: Unexpected error: $e');
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> getNoteById(String noteId) async {
    try {
      // Önce local'den notu al
      final localNote = await _localNoteService.getNoteById(noteId);
      if (localNote != null) {
        print('📱 getNoteById: Found note in local database');
        return right(localNote);
      }

      // Local'de yoksa server'dan al
      if (_connectionService.isConnected) {
        print('🌐 getNoteById: Internet connected, fetching from server...');
        try {
          final response = await _dioService.dio.get<Map<String, dynamic>>(
            ApiEndpoints.noteById(noteId),
          );

          if (response.data?['success'] == true) {
            final note = NoteModel.fromJson(
              response.data!['data'] as Map<String, dynamic>,
            );
            // Server'dan gelen notu local'e kaydet
            await _localNoteService.saveNote(note);
            print('✅ getNoteById: Note fetched from server and saved locally');
            return right(note);
          } else {
            return left(
              (response.data?['errorMessage'] as String?) ??
                  'Failed to fetch note',
            );
          }
        } catch (e) {
          return left(_handleDioError(e as DioException));
        }
      } else {
        return left('Note not found and no internet connection');
      }
    } on Exception catch (e) {
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> createNote({
    required String title,
    required String content,
  }) async {
    try {
      print('🔄 createNote: Starting...');
      
      // UUID ile yeni not oluştur
        final note = NoteModel(
          id: const Uuid().v4(),
          title: title,
          content: content,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      
      print('📝 createNote: Created note with ID: ${note.id}');
      
      // Önce local'e kaydet
      await _localNoteService.saveNote(note);
      print('💾 createNote: Saved to local database');
      
      // Internet bağlantısı varsa server'a gönder
      if (_connectionService.isConnected) {
        print('🌐 createNote: Internet connected, sending to server...');
        try {
          final response = await _dioService.dio.post<Map<String, dynamic>>(
            ApiEndpoints.notes,
            data: {
              'id': note.id,
              'title': title,
              'content': content,
              'is_favorite': note.isFavorite,
              'tags': note.tags,
              'created_at': note.createdAt.toIso8601String(),
              'updated_at': note.updatedAt.toIso8601String(),
            },
          );

          if (response.data?['success'] == true) {
            print('📡 createNote: Server response successful');
            // Server'dan gelen notu local'e güncelle
            final updatedNote = note.copyWith(
              syncStatus: SyncStatus.synced,
              lastSyncedAt: DateTime.now(),
            );
            await _localNoteService.saveNote(updatedNote);
            print('✅ createNote: Note synced successfully');
            
            return right(updatedNote);
          } else {
            print('❌ createNote: Server returned error: ${response.data?['errorMessage']}');
          }
        } catch (e) {
          // Server hatası durumunda local notu döndür
          print('⚠️ createNote: Server create failed, using local note: $e');
        }
      } else {
        print('📱 createNote: No internet connection, using local note only');
      }
      
      // Offline durumda veya server hatası durumunda local notu döndür
      print('📱 createNote: Returning local note (ID: ${note.id})');
      return right(note);
    } on Exception catch (e) {
      print('❌ createNote: Unexpected error: $e');
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> updateNote({
    required String noteId,
    required String title,
    required String content,
  }) async {
    try {
      print('🔄 updateNote: Starting for note ID: $noteId');
      
      // Önce local'den mevcut notu al
      final existingNote = await _localNoteService.getNoteById(noteId);
      if (existingNote == null) {
        print('❌ updateNote: Note not found in local database');
        return left('Note not found');
      }
      
      print('📝 updateNote: Found existing note: ${existingNote.title}');
      
      // Local'de notu güncelle
      final updatedNote = existingNote.copyWith(
        title: title,
        content: content,
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _localNoteService.saveNote(updatedNote);
      print('💾 updateNote: Updated in local database');
      
      // Internet bağlantısı varsa server'a gönder
      if (_connectionService.isConnected) {
        print('🌐 updateNote: Internet connected, sending to server...');
        try {
          final response = await _dioService.dio.put<Map<String, dynamic>>(
            ApiEndpoints.noteById(noteId),
            data: {
              'id': noteId,
              'title': title,
              'content': content,
              'is_favorite': updatedNote.isFavorite,
              'tags': updatedNote.tags,
              'created_at': updatedNote.createdAt.toIso8601String(),
              'updated_at': updatedNote.updatedAt.toIso8601String(),
            },
          );

          if (response.data?['success'] == true) {
            print('📡 updateNote: Server response successful');
            // Server'dan gelen notu local'e güncelle
            final syncedNote = updatedNote.copyWith(
              syncStatus: SyncStatus.synced,
              lastSyncedAt: DateTime.now(),
            );
            await _localNoteService.saveNote(syncedNote);
            print('✅ updateNote: Note synced successfully');
            
            return right(syncedNote);
          } else {
            print('❌ updateNote: Server returned error: ${response.data?['errorMessage']}');
          }
        } catch (e) {
          // Server hatası durumunda local notu döndür
          print('⚠️ updateNote: Server update failed, using local note: $e');
        }
      } else {
        print('📱 updateNote: No internet connection, using local note only');
      }
      
      // Offline durumda veya server hatası durumunda local notu döndür
      print('📱 updateNote: Returning local note (ID: $noteId)');
      return right(updatedNote);
    } on Exception catch (e) {
      print('❌ updateNote: Unexpected error: $e');
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, Unit>> deleteNote(String noteId) async {
    try {
      print('🔄 deleteNote: Starting for note ID: $noteId');
      
      // Önce local'den notu sil
      await _localNoteService.deleteNote(noteId);
      print('💾 deleteNote: Deleted from local database');
      
      // Internet bağlantısı varsa server'dan da sil
      if (_connectionService.isConnected) {
        print('🌐 deleteNote: Internet connected, deleting from server...');
        try {
          final response = await _dioService.dio.delete<Map<String, dynamic>>(
            ApiEndpoints.noteById(noteId),
          );

          if (response.data?['success'] == true) {
            print('✅ deleteNote: Note deleted from server: $noteId');
            return right(unit);
          } else {
            print('⚠️ deleteNote: Server delete failed, but local delete successful: $noteId');
            return right(unit); // Local silme başarılı, server hatası önemsiz
          }
        } catch (e) {
          // Server hatası durumunda local silme başarılı sayılır
          print('⚠️ deleteNote: Server delete failed, but local delete successful: $e');
          return right(unit);
        }
      } else {
        print('📱 deleteNote: No internet connection, local delete only');
      }
      
      // Offline durumda sadece local silme yeterli
      print('✅ deleteNote: Note deleted locally (offline): $noteId');
      return right(unit);
    } on Exception catch (e) {
      print('❌ deleteNote: Unexpected error: $e');
      return left('An unexpected error occurred: $e');
    }
  }

  // Background sync method for local notes to server
  Future<void> _syncLocalNoteToServer(NoteModel localNote) async {
    try {
      print('🔄 _syncLocalNoteToServer: Syncing ${localNote.title} to server...');
      
      // Önce server'da not var mı kontrol et
      late final response;
      try {
        final checkResponse = await _dioService.dio.get<Map<String, dynamic>>(
          ApiEndpoints.noteById(localNote.id),
        );
        
        print('🔍 _syncLocalNoteToServer: Check response: ${checkResponse.data}');
        print('🔍 _syncLocalNoteToServer: Success value: ${checkResponse.data?['success']}');
        
        if (checkResponse.data?['success'] == true) {
          // Not var, PUT ile güncelle
          print('📝 _syncLocalNoteToServer: Note exists, updating...');
          response = await _dioService.dio.put<Map<String, dynamic>>(
            ApiEndpoints.noteById(localNote.id),
            data: {
              'id': localNote.id,
              'title': localNote.title,
              'content': localNote.content,
              'is_favorite': localNote.isFavorite,
              'tags': localNote.tags,
            },
          );
        } else {
          // Not yok, POST ile oluştur
          print('📝 _syncLocalNoteToServer: Note not found, creating...');
          response = await _dioService.dio.post<Map<String, dynamic>>(
            ApiEndpoints.notes,
            data: {
              'id': localNote.id,
              'title': localNote.title,
              'content': localNote.content,
              'is_favorite': localNote.isFavorite,
              'tags': localNote.tags,
              'created_at': localNote.createdAt.toIso8601String(),
              'updated_at': localNote.updatedAt.toIso8601String(),
            },
          );
        }
      } catch (e) {
        // 404 veya başka hata, POST ile oluştur
        print('📝 _syncLocalNoteToServer: Check failed (404 or other error), creating new note...');
        response = await _dioService.dio.post<Map<String, dynamic>>(
          ApiEndpoints.notes,
          data: {
            'id': localNote.id,
            'title': localNote.title,
            'content': localNote.content,
            'is_favorite': localNote.isFavorite,
            'tags': localNote.tags,
            'created_at': localNote.createdAt.toIso8601String(),
            'updated_at': localNote.updatedAt.toIso8601String(),
          },
        );
      }

      if (response.data?['success'] == true) {
        print('✅ _syncLocalNoteToServer: Successfully synced ${localNote.title} to server');
        // Local notu synced olarak işaretle
        final syncedNote = localNote.copyWith(
          syncStatus: SyncStatus.synced,
          lastSyncedAt: DateTime.now(),
        );
        await _localNoteService.saveNote(syncedNote);
      } else {
        print('❌ _syncLocalNoteToServer: Failed to sync ${localNote.title}: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('⚠️ _syncLocalNoteToServer: Error syncing ${localNote.title}: $e');
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['errorMessage'] ?? 'Server error';
        return 'Error $statusCode: $message';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'Connection error. Please check your internet connection.';
      case DioExceptionType.badCertificate:
        return 'Bad certificate. Please check your certificate.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred.';
    }
  }
}