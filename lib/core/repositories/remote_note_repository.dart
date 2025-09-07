import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/dio_service.dart';
import 'package:notetakingapp/core/network/api_endpoints.dart';

class RemoteNoteRepository {
  RemoteNoteRepository(this._dioService);
  
  final DioService _dioService;
  
  // CRUD operations
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      print('🌐 RemoteNoteRepository: Getting all notes from server...');
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.notes,
      );
      
      if (response.data?['success'] == true) {
        final List<dynamic> notesData = (response.data?['data'] as List<dynamic>?) ?? [];
        final notes = notesData
            .map((noteData) => NoteModel.fromJson(noteData as Map<String, dynamic>))
            .toList();
        print('🌐 RemoteNoteRepository: Received ${notes.length} notes from server');
        return right(notes);
      } else {
        print('❌ RemoteNoteRepository: Server returned error: ${response.data?['errorMessage']}');
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error getting notes from server: $e');
      return left('Failed to get notes from server: $e');
    }
  }
  
  Future<Either<String, NoteModel?>> getNoteById(String id) async {
    try {
      print('🌐 RemoteNoteRepository: Getting note by ID from server: $id');
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.noteById(id),
      );
      
      if (response.data?['success'] == true) {
        final note = NoteModel.fromJson(response.data?['data'] as Map<String, dynamic>);
        print('🌐 RemoteNoteRepository: Received note from server: ${note.title}');
        return right(note);
      } else {
        print('❌ RemoteNoteRepository: Server returned error: ${response.data?['errorMessage']}');
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error getting note from server: $e');
      return left('Failed to get note from server: $e');
    }
  }
  
  Future<Either<String, NoteModel>> createNote(NoteModel note) async {
    try {
      print('🌐 RemoteNoteRepository: Creating note on server: ${note.title}');
      final response = await _dioService.dio.post<Map<String, dynamic>>(
        ApiEndpoints.notes,
        data: {
          'id': note.id,
          'title': note.title,
          'content': note.content,
          'is_favorite': note.isFavorite,
          'tags': note.tags,
          'created_at': note.createdAt.toIso8601String(),
          'updated_at': note.updatedAt.toIso8601String(),
        },
      );
      
      if (response.data?['success'] == true) {
        final createdNote = NoteModel.fromJson(response.data?['data'] as Map<String, dynamic>);
        print('✅ RemoteNoteRepository: Note created successfully on server');
        return right(createdNote);
      } else {
        print('❌ RemoteNoteRepository: Server returned error: ${response.data?['errorMessage']}');
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error creating note on server: $e');
      return left('Failed to create note on server: $e');
    }
  }
  
  Future<Either<String, NoteModel>> updateNote(String id, NoteModel note) async {
    try {
      print('🌐 RemoteNoteRepository: Updating note on server: ${note.title}');
      final response = await _dioService.dio.put<Map<String, dynamic>>(
        ApiEndpoints.noteById(id),
        data: {
          'id': id,
          'title': note.title,
          'content': note.content,
          'is_favorite': note.isFavorite,
          'tags': note.tags,
          'created_at': note.createdAt.toIso8601String(),
          'updated_at': note.updatedAt.toIso8601String(),
        },
      );
      
      if (response.data?['success'] == true) {
        final updatedNote = NoteModel.fromJson(response.data?['data'] as Map<String, dynamic>);
        print('✅ RemoteNoteRepository: Note updated successfully on server');
        return right(updatedNote);
      } else {
        print('❌ RemoteNoteRepository: Server returned error: ${response.data?['errorMessage']}');
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error updating note on server: $e');
      return left('Failed to update note on server: $e');
    }
  }
  
  Future<Either<String, void>> deleteNote(String id) async {
    try {
      print('🌐 RemoteNoteRepository: Deleting note on server: $id');
      final response = await _dioService.dio.delete<Map<String, dynamic>>(
        ApiEndpoints.noteById(id),
      );
      
      if (response.data?['success'] == true) {
        print('✅ RemoteNoteRepository: Note deleted successfully on server');
        return right(null);
      } else {
        print('❌ RemoteNoteRepository: Server returned error: ${response.data?['errorMessage']}');
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error deleting note on server: $e');
      return left('Failed to delete note on server: $e');
    }
  }
  
  // Sync operations
  Future<Either<String, NoteModel>> syncNote(NoteModel note) async {
    try {
      print('🔄 RemoteNoteRepository: Syncing note to server: ${note.title}');
      
      // Önce server'da not var mı kontrol et
      try {
        final checkResponse = await _dioService.dio.get<Map<String, dynamic>>(
          ApiEndpoints.noteById(note.id),
        );
        
        if (checkResponse.data?['success'] == true) {
          // Not var, PUT ile güncelle
          print('📝 RemoteNoteRepository: Note exists, updating...');
          return await updateNote(note.id, note);
        } else {
          // Not yok, POST ile oluştur
          print('📝 RemoteNoteRepository: Note not found, creating...');
          return await createNote(note);
        }
      } catch (e) {
        // 404 veya başka hata, POST ile oluştur
        print('📝 RemoteNoteRepository: Check failed (404 or other error), creating new note...');
        return await createNote(note);
      }
    } catch (e) {
      print('❌ RemoteNoteRepository: Error syncing note: $e');
      return left('Failed to sync note: $e');
    }
  }
}
