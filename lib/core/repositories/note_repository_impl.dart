import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/api_endpoints.dart';
import 'package:notetakingapp/core/network/dio_service.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final DioService _dioService;

  NoteRepositoryImpl({
    required DioService dioService,
  }) : _dioService = dioService;

  @override
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.notes,
      );

      if (response.data?['success'] == true) {
        final notesData = response.data!['data'] as List<dynamic>;
        final notes = notesData
            .map(
              (noteJson) =>
                  NoteModel.fromJson(noteJson as Map<String, dynamic>),
            )
            .toList();
        return right(notes);
      } else {
        return left(
          (response.data?['errorMessage'] as String?) ??
              'Failed to fetch notes',
        );
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } on Exception catch (e) {
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> getNoteById(String noteId) async {
    try {
      final response = await _dioService.dio.get<Map<String, dynamic>>(
        ApiEndpoints.noteById(noteId),
      );

      if (response.data?['success'] == true) {
        final note = NoteModel.fromJson(
          response.data!['data'] as Map<String, dynamic>,
        );
        return right(note);
      } else {
        return left(
          (response.data?['errorMessage'] as String?) ??
              'Failed to fetch note',
        );
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
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
      final response = await _dioService.dio.post<Map<String, dynamic>>(
        ApiEndpoints.notes,
        data: {
          'title': title,
          'content': content,
        },
      );

      if (response.data?['success'] == true) {
        final note = NoteModel.fromJson(
          response.data!['data'] as Map<String, dynamic>,
        );
        return right(note);
      } else {
        return left(
          (response.data?['errorMessage'] as String?) ??
              'Failed to create note',
        );
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } on Exception catch (e) {
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
      final response = await _dioService.dio.put<Map<String, dynamic>>(
        ApiEndpoints.noteById(noteId),
        data: {
          'title': title,
          'content': content,
        },
      );

      if (response.data?['success'] == true) {
        final note = NoteModel.fromJson(
          response.data!['data'] as Map<String, dynamic>,
        );
        return right(note);
      } else {
        return left(
          (response.data?['errorMessage'] as String?) ??
              'Failed to update note',
        );
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } on Exception catch (e) {
      return left('An unexpected error occurred: $e');
    }
  }

  @override
  Future<Either<String, Unit>> deleteNote(String noteId) async {
    try {
      final response = await _dioService.dio.delete<Map<String, dynamic>>(
        ApiEndpoints.noteById(noteId),
      );

      if (response.data?['success'] == true) {
        return right(unit);
      } else {
        return left(
          (response.data?['errorMessage'] as String?) ??
              'Failed to delete note',
        );
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } on Exception catch (e) {
      return left('An unexpected error occurred: $e');
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
