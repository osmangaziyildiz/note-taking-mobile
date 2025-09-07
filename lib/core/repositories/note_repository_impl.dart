import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
import 'package:notetakingapp/core/repositories/local_note_repository.dart';
import 'package:notetakingapp/core/repositories/remote_note_repository.dart';
import 'package:notetakingapp/features/auth/repositories/auth_repository.dart';
import 'package:uuid/uuid.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl({
    required LocalNoteRepository localNoteRepository,
    required RemoteNoteRepository remoteNoteRepository,
    required ConnectionService connectionService,
    required AuthRepository authRepository,
  }) : _localNoteRepository = localNoteRepository,
       _remoteNoteRepository = remoteNoteRepository,
       _connectionService = connectionService,
       _authRepository = authRepository;
       
  final LocalNoteRepository _localNoteRepository;
  final RemoteNoteRepository _remoteNoteRepository;
  final ConnectionService _connectionService;
  final AuthRepository _authRepository;

  @override
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      print('🔄 getAllNotes: Starting...');
      
      // Önce local'den notları al
      final localResult = await _localNoteRepository.getAllNotes();
      if (localResult.isLeft()) {
        return left(localResult.getLeft().getOrElse(() => 'Unknown error'));
      }
      
      final localNotes = localResult.getOrElse((error) => []);
      print('📱 getAllNotes: Found ${localNotes.length} local notes');
      // Debug dump of local notes
      for (final note in localNotes) {
        print('[LOCAL] id=${note.id} | title=${note.title} | updatedAt=${note.updatedAt.toIso8601String()} | syncStatus=${note.syncStatus.name} | lastSyncedAt=${note.lastSyncedAt?.toIso8601String()}');
      }
      
      // Internet bağlantısı varsa server'dan sync et
      if (_connectionService.isConnected) {
        print('🌐 getAllNotes: Internet connected, syncing with server...');
        
        // Server'dan notları al
        final remoteResult = await _remoteNoteRepository.getAllNotes();
        if (remoteResult.isRight()) {
          final serverNotes = remoteResult.getOrElse((error) => []);
          print('📡 getAllNotes: Received ${serverNotes.length} notes from server');
          
          // Conflict resolution - Last write wins
          final mergedNotes = _mergeNotes(localNotes, serverNotes);
          print('🔄 getAllNotes: Merged ${mergedNotes.length} notes');
          
          // Pending notları sync et
          await _syncPendingNotes();
          
          print('✅ getAllNotes: Sync completed, returning ${mergedNotes.length} notes');
          return right(mergedNotes);
        } else {
          print('⚠️ getAllNotes: Failed to get notes from server, using local notes');
        }
      } else {
        print('📱 getAllNotes: No internet connection, using local notes only');
      }
      
      return right(localNotes);
    } catch (e) {
      print('❌ getAllNotes: Error: $e');
      return left('Failed to get notes: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> getNoteById(String id) async {
    try {
      print('🔄 getNoteById: Getting note by ID: $id');
      
      // Önce local'den al
      final localResult = await _localNoteRepository.getNoteById(id);
      if (localResult.isRight()) {
        final localNote = localResult.getOrElse((error) => null);
        if (localNote != null) {
          print('📱 getNoteById: Found note in local storage');
          return right(localNote);
        }
      }
      
      // Internet bağlantısı varsa server'dan al
      if (_connectionService.isConnected) {
        print('🌐 getNoteById: Internet connected, getting from server...');
        final remoteResult = await _remoteNoteRepository.getNoteById(id);
        if (remoteResult.isRight()) {
          final serverNote = remoteResult.getOrElse((error) => null);
          if (serverNote != null) {
            print('📡 getNoteById: Found note on server, saving locally');
            await _localNoteRepository.saveNote(serverNote);
            return right(serverNote);
          }
        }
      }
      
      print('❌ getNoteById: Note not found');
      return left('Note not found');
    } catch (e) {
      print('❌ getNoteById: Error: $e');
      return left('Failed to get note: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> createNote({
    required String title,
    required String content,
  }) async {
    try {
      print('🔄 createNote: Starting...');
      
      // Current user'ı al
      final currentUserResult = await _authRepository.getCurrentUser();
      if (currentUserResult.isLeft()) {
        return left('User not authenticated');
      }
      
      final currentUser = currentUserResult.getOrElse((error) => null);
      if (currentUser == null) {
        return left('User not found');
      }
      
      // UUID ile yeni not oluştur
      final note = NoteModel(
        id: const Uuid().v4(),
        title: title,
        content: content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ownerUid: currentUser.id,
      );
      
      print('📝 createNote: Created note with ID: ${note.id}');
      
      // Önce local'e kaydet
      final saveResult = await _localNoteRepository.saveNote(note);
      if (saveResult.isLeft()) {
        return left(saveResult.getLeft().getOrElse(() => 'Unknown error'));
      }
      
      // Internet bağlantısı varsa server'a gönder
      if (_connectionService.isConnected) {
        print('🌐 createNote: Internet connected, sending to server...');
        final syncResult = await _remoteNoteRepository.syncNote(note);
        if (syncResult.isRight()) {
          final syncedNote = syncResult.getOrElse((error) => note);
          print('📡 createNote: Server response successful');
          // Local'i güncelle
          await _localNoteRepository.saveNote(syncedNote);
          return right(syncedNote);
        } else {
          print('⚠️ createNote: Failed to sync to server, keeping local only');
        }
      } else {
        print('📱 createNote: No internet connection, saved locally only');
      }
      
      return right(note);
    } catch (e) {
      print('❌ createNote: Error: $e');
      return left('Failed to create note: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> updateNote({
    required String noteId,
    required String title,
    required String content,
  }) async {
    try {
      print('🔄 updateNote: Starting...');
      
      // Local'den notu al
      final localResult = await _localNoteRepository.getNoteById(noteId);
      if (localResult.isLeft()) {
        return left('Note not found locally');
      }
      
      final existingNote = localResult.getOrElse((error) => null);
      if (existingNote == null) {
        return left('Note not found');
      }
      
      // Notu güncelle
      final updatedNote = existingNote.copyWith(
        title: title,
        content: content,
        updatedAt: DateTime.now(),
      );
      
      print('📝 updateNote: Updated note: ${updatedNote.title}');
      
      // Local'i güncelle
      final saveResult = await _localNoteRepository.saveNote(updatedNote);
      if (saveResult.isLeft()) {
        return left(saveResult.getLeft().getOrElse(() => 'Unknown error'));
      }
      
      // Internet bağlantısı varsa server'a gönder
      if (_connectionService.isConnected) {
        print('🌐 updateNote: Internet connected, sending to server...');
        final syncResult = await _remoteNoteRepository.syncNote(updatedNote);
        if (syncResult.isRight()) {
          final syncedNote = syncResult.getOrElse((error) => updatedNote);
          print('📡 updateNote: Server response successful');
          // Local'i güncelle
          await _localNoteRepository.saveNote(syncedNote);
          return right(syncedNote);
        } else {
          print('⚠️ updateNote: Failed to sync to server, keeping local only');
        }
      } else {
        print('📱 updateNote: No internet connection, updated locally only');
      }
      
      return right(updatedNote);
    } catch (e) {
      print('❌ updateNote: Error: $e');
      return left('Failed to update note: $e');
    }
  }

  @override
  Future<Either<String, Unit>> deleteNote(String id) async {
    try {
      print('🔄 deleteNote: Starting...');
      
      // Local'den sil
      final deleteResult = await _localNoteRepository.deleteNote(id);
      if (deleteResult.isLeft()) {
        return left(deleteResult.getLeft().getOrElse(() => 'Unknown error'));
      }
      
      // Internet bağlantısı varsa server'dan da sil
      if (_connectionService.isConnected) {
        print('🌐 deleteNote: Internet connected, deleting from server...');
        final remoteResult = await _remoteNoteRepository.deleteNote(id);
        if (remoteResult.isLeft()) {
          print('⚠️ deleteNote: Failed to delete from server, but deleted locally');
        } else {
          print('✅ deleteNote: Deleted from both local and server');
        }
      } else {
        print('📱 deleteNote: No internet connection, deleted locally only');
      }
      
      return right(unit);
    } catch (e) {
      print('❌ deleteNote: Error: $e');
      return left('Failed to delete note: $e');
    }
  }

  // Helper methods
  List<NoteModel> _mergeNotes(List<NoteModel> localNotes, List<NoteModel> serverNotes) {
    final Map<String, NoteModel> mergedMap = {};
    
    // Local notları ekle
    for (final note in localNotes) {
      mergedMap[note.id] = note;
    }
    
    // Server notlarını ekle/ güncelle (conflict resolution)
    for (final serverNote in serverNotes) {
      final localNote = mergedMap[serverNote.id];
      if (localNote == null) {
        // Server'da var, local'de yok - SİL (offline-first)
        print('🗑️ _mergeNotes: Server note not in local, deleting from server: ${serverNote.title}');
        _deleteFromServer(serverNote.id);
      } else {
        // Her ikisinde de var - last write wins
        if (serverNote.updatedAt.isAfter(localNote.updatedAt)) {
          // Server daha yeni
          mergedMap[serverNote.id] = serverNote;
          print('🔄 _mergeNotes: Server note is newer, updating local: ${serverNote.title}');
        } else {
          // Local daha yeni - server'a sync et
          print('🔄 _mergeNotes: Local note is newer, will sync to server: ${localNote.title}');
          _syncLocalNoteToServer(localNote);
        }
      }
    }
    
    return mergedMap.values.toList();
  }

  Future<void> _syncPendingNotes() async {
    final pendingResult = await _localNoteRepository.getPendingNotes();
    if (pendingResult.isRight()) {
      final pendingNotes = pendingResult.getOrElse((error) => []);
      print('🔄 _syncPendingNotes: Found ${pendingNotes.length} pending notes to sync');
      
      for (final note in pendingNotes) {
        print('🔄 _syncPendingNotes: Syncing pending note: ${note.title}');
        await _syncLocalNoteToServer(note);
      }
    }
  }

  Future<void> _syncLocalNoteToServer(NoteModel localNote) async {
    try {
      print('🔄 _syncLocalNoteToServer: Syncing ${localNote.title} to server...');
      
      final syncResult = await _remoteNoteRepository.syncNote(localNote);
      if (syncResult.isRight()) {
        final syncedNote = syncResult.getOrElse((error) => localNote);
        print('✅ _syncLocalNoteToServer: Successfully synced ${localNote.title} to server');
        // Local'i güncelle
        await _localNoteRepository.saveNote(syncedNote);
        // Last synced metadata'yı güncelle
        final markRes = await _localNoteRepository.markAsSynced(syncedNote.id);
        if (markRes.isLeft()) {
          print('⚠️ _syncLocalNoteToServer: markAsSynced failed: ${markRes.getLeft().getOrElse(() => 'Unknown error')}');
        }
      } else {
        print('⚠️ _syncLocalNoteToServer: Failed to sync ${localNote.title}: ${syncResult.getLeft()}');
      }
    } catch (e) {
      print('⚠️ _syncLocalNoteToServer: Error syncing ${localNote.title}: $e');
    }
  }

  Future<void> _deleteFromServer(String noteId) async {
    try {
      print('🗑️ _deleteFromServer: Deleting note from server: $noteId');
      await _remoteNoteRepository.deleteNote(noteId);
      print('✅ _deleteFromServer: Successfully deleted note from server');
    } catch (e) {
      print('⚠️ _deleteFromServer: Error deleting note from server: $e');
    }
  }
}