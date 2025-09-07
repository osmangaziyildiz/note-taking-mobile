import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/services/local_note_service.dart';

class LocalNoteRepository {
  LocalNoteRepository(this._localNoteService);
  
  final LocalNoteService _localNoteService;
  
  // CRUD operations
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {

      final notes = await _localNoteService.getAllNotes();
      return right(notes);
    } on Exception catch (e) {
      return left('Failed to get local notes: $e');
    }
  }
  
  Future<Either<String, NoteModel?>> getNoteById(String id) async {
    try {
      final note = await _localNoteService.getNoteById(id);
      return right(note);
    } on Exception catch (e) {
      return left('Failed to get local note: $e');
    }
  }
  
  Future<Either<String, void>> saveNote(NoteModel note) async {
    try {
      await _localNoteService.saveNote(note);
      return right(null);
    } on Exception catch (e) {
      return left('Failed to save note: $e');
    }
  }
  
  Future<Either<String, void>> deleteNote(String id) async {
    try { 
      await _localNoteService.deleteNote(id);
      return right(null);
    } on Exception catch (e) {
      return left('Failed to delete note: $e');
    }
  }
  
  // Sync operations
  Future<Either<String, List<NoteModel>>> getPendingNotes() async {
    try {
      final notes = await _localNoteService.getPendingNotes();
      return right(notes);
    } on Exception catch (e) {
      return left('Failed to get pending notes: $e');
    }
  }
  
  Future<Either<String, void>> markAsSynced(String id) async {
    try {
      await _localNoteService.markAsSynced(id);
      return right(null);
    } on Exception catch (e) {
      return left('Failed to mark note as synced: $e');
    }
  }
  
  Future<Either<String, DateTime?>> getLastSyncTime() async {
    try {
      final lastSync = await _localNoteService.getLastSyncTime();
      return right(lastSync);
    } on Exception catch (e) {
      return left('Failed to get last sync time: $e');
    }
  }
  
  Future<Either<String, List<NoteModel>>> getNotesModifiedAfter(DateTime lastSync) async {
    try {
      final notes = await _localNoteService.getNotesModifiedAfter(lastSync);
      return right(notes);
    } on Exception catch (e) {
      return left('Failed to get modified notes: $e');
    }
  }
}
