import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';

abstract class NoteRepository {
  Future<Either<String, List<NoteModel>>> getAllNotes();
  
  Future<Either<String, NoteModel>> getNoteById(String noteId);
  
  Future<Either<String, NoteModel>> createNote({
    required String title,
    required String content,
  });
  
  Future<Either<String, NoteModel>> updateNote({
    required String noteId,
    required String title,
    required String content,
  });
  
  Future<Either<String, Unit>> deleteNote(String noteId);
}
