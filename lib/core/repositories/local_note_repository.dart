import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/services/local_note_service.dart';

class LocalNoteRepository {
  LocalNoteRepository(this._localNoteService);
  
  final LocalNoteService _localNoteService;
  
  // CRUD operations
  Future<Either<String, List<NoteModel>>> getAllNotes() async {
    try {
      print('📱 LocalNoteRepository: Getting all notes from local storage...');
      final notes = await _localNoteService.getAllNotes();
      print('📱 LocalNoteRepository: Found ${notes.length} local notes');
      return right(notes);
    } catch (e) {
      print('❌ LocalNoteRepository: Error getting local notes: $e');
      return left('Failed to get local notes: $e');
    }
  }
  
  Future<Either<String, NoteModel?>> getNoteById(String id) async {
    try {
      print('📱 LocalNoteRepository: Getting note by ID: $id');
      final note = await _localNoteService.getNoteById(id);
      return right(note);
    } catch (e) {
      print('❌ LocalNoteRepository: Error getting local note: $e');
      return left('Failed to get local note: $e');
    }
  }
  
  Future<Either<String, void>> saveNote(NoteModel note) async {
    try {
      print('📱 LocalNoteRepository: Saving note: ${note.title}');
      await _localNoteService.saveNote(note);
      print('✅ LocalNoteRepository: Note saved successfully');
      return right(null);
    } catch (e) {
      print('❌ LocalNoteRepository: Error saving note: $e');
      return left('Failed to save note: $e');
    }
  }
  
  Future<Either<String, void>> deleteNote(String id) async {
    try {
      print('📱 LocalNoteRepository: Deleting note: $id');
      await _localNoteService.deleteNote(id);
      print('✅ LocalNoteRepository: Note deleted successfully');
      return right(null);
    } catch (e) {
      print('❌ LocalNoteRepository: Error deleting note: $e');
      return left('Failed to delete note: $e');
    }
  }
  
  // Sync operations
  Future<Either<String, List<NoteModel>>> getPendingNotes() async {
    try {
      print('📱 LocalNoteRepository: Getting pending notes...');
      final notes = await _localNoteService.getPendingNotes();
      print('📱 LocalNoteRepository: Found ${notes.length} pending notes');
      return right(notes);
    } catch (e) {
      print('❌ LocalNoteRepository: Error getting pending notes: $e');
      return left('Failed to get pending notes: $e');
    }
  }
  
  Future<Either<String, void>> markAsSynced(String id) async {
    try {
      print('📱 LocalNoteRepository: Marking note as synced: $id');
      await _localNoteService.markAsSynced(id);
      print('✅ LocalNoteRepository: Note marked as synced');
      return right(null);
    } catch (e) {
      print('❌ LocalNoteRepository: Error marking note as synced: $e');
      return left('Failed to mark note as synced: $e');
    }
  }
  
  Future<Either<String, DateTime?>> getLastSyncTime() async {
    try {
      print('📱 LocalNoteRepository: Getting last sync time...');
      final lastSync = await _localNoteService.getLastSyncTime();
      return right(lastSync);
    } catch (e) {
      print('❌ LocalNoteRepository: Error getting last sync time: $e');
      return left('Failed to get last sync time: $e');
    }
  }
  
  Future<Either<String, List<NoteModel>>> getNotesModifiedAfter(DateTime lastSync) async {
    try {
      print('📱 LocalNoteRepository: Getting notes modified after: $lastSync');
      final notes = await _localNoteService.getNotesModifiedAfter(lastSync);
      print('📱 LocalNoteRepository: Found ${notes.length} modified notes');
      return right(notes);
    } catch (e) {
      print('❌ LocalNoteRepository: Error getting modified notes: $e');
      return left('Failed to get modified notes: $e');
    }
  }
}
