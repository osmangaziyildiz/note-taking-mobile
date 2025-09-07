import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/api_endpoints.dart';
import 'package:notetakingapp/core/network/dio_service.dart';

class RemoteNoteRepository {
  RemoteNoteRepository(this._dioService);

  final DioService _dioService;

  // CRUD operations
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.notes,
      );

      if (response.data?['success'] == true) {
        final notesData = (response.data?['data'] as List<dynamic>?) ?? [];
        final notes = notesData
            .map(
              (noteData) =>
                  NoteModel.fromJson(noteData as Map<String, dynamic>),
            )
            .toList();
        return right(notes);
      } else {
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } on Exception catch (e) {
      return left('Failed to get notes from server: $e');
    }
  }

  Future<Either<String, NoteModel?>> getNoteById(String id) async {
    try {
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.noteById(id),
      );

      if (response.data?['success'] == true) {
        final note = NoteModel.fromJson(
          response.data?['data'] as Map<String, dynamic>,
        );
        return right(note);
      } else {
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } on Exception catch (e) {
      return left('Failed to get note from server: $e');
    }
  }

  Future<Either<String, NoteModel>> createNote(NoteModel note) async {
    try {
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
        final createdNote = NoteModel.fromJson(
          response.data?['data'] as Map<String, dynamic>,
        );
        return right(createdNote);
      } else {
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } on Exception catch (e) {
      return left('Failed to create note on server: $e');
    }
  }

  Future<Either<String, NoteModel>> updateNote(
    String id,
    NoteModel note,
  ) async {
    try {
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
        final updatedNote = NoteModel.fromJson(
          response.data?['data'] as Map<String, dynamic>,
        );
        return right(updatedNote);
      } else {
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } on Exception catch (e) {
      return left('Failed to update note on server: $e');
    }
  }

  Future<Either<String, void>> deleteNote(String id) async {
    try {
      final response = await _dioService.dio.delete<Map<String, dynamic>>(
        ApiEndpoints.noteById(id),
      );

      if (response.data?['success'] == true) {
        return right(null);
      } else {
        return left('Server error: ${response.data?['errorMessage']}');
      }
    } on Exception catch (e) {
      return left('Failed to delete note on server: $e');
    }
  }

  // Sync operations
  Future<Either<String, NoteModel>> syncNote(NoteModel note) async {
    try {
      // First check if note exists on server
      try {
        final checkResponse = await _dioService.dio.get<Map<String, dynamic>>(
          ApiEndpoints.noteById(note.id),
        );

        if (checkResponse.data?['success'] == true) {
          // Note found, update it
          return await updateNote(note.id, note);
        } else {
          // Not not found, create new note
          return await createNote(note);
        }
      } on Exception catch (_) {
        // 404 or other error, create new note
        return await createNote(note);
      }
    } on Exception catch (e) {
      return left('Failed to sync note: $e');
    }
  }
}
