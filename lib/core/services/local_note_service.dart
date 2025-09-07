import 'package:notetakingapp/core/database/database.dart';
import 'package:notetakingapp/core/models/note_model.dart';

class LocalNoteService {
  
  LocalNoteService(this._database);
  
  final AppDatabase _database;
  
  // CRUD operations
  Future<List<NoteModel>> getAllNotes() async {
    final notes = await _database.getAllNotes();
    return notes.map((note) => _noteFromDrift(note)).toList();
  }
  
  Future<NoteModel?> getNoteById(String id) async {
    final note = await _database.getNoteById(id);
    return note != null ? _noteFromDrift(note) : null;
  }
  
  Future<void> saveNote(NoteModel note) async {
    await _database.saveNote(_noteToDrift(note));
  }
  
  Future<void> deleteNote(String id) async {
    await _database.deleteNote(id);
  }
  
  // Sync operations
  Future<List<NoteModel>> getPendingNotes() async {
    final notes = await _database.getPendingNotes();
    return notes.map((note) => _noteFromDrift(note)).toList();
  }
  
  Future<void> markAsSynced(String id) async {
    await _database.markAsSynced(id);
  }
  
  // Last sync operations
  Future<DateTime?> getLastSyncTime() async {
    return  _database.getLastSyncTime();
  }
  
  Future<void> updateLastSyncTime(DateTime syncTime) async {
    // Bu metod için ayrı bir tablo oluşturabiliriz veya
    // tüm synced notların lastSyncedAt'ini güncelleyebiliriz
    // Şimdilik basit tutuyoruz
  }
  
  Future<List<NoteModel>> getNotesModifiedAfter(DateTime lastSync) async {
    final notes = await _database.getNotesModifiedAfter(lastSync);
    return notes.map((note) => _noteFromDrift(note)).toList();
  }

  // Helper methods to convert between NoteModel and Drift Note
  NoteModel _noteFromDrift(Note note) {
    return NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
      ownerUid: note.ownerUid,
      isFavorite: note.isFavorite,
      tags: note.tags,
      syncStatus: note.syncStatus,
      lastSyncedAt: note.lastSyncedAt,
    );
  }

  Note _noteToDrift(NoteModel note) {
    return Note(
      id: note.id,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
      ownerUid: note.ownerUid,
      isFavorite: note.isFavorite,
      tags: note.tags,
      syncStatus: note.syncStatus,
      lastSyncedAt: note.lastSyncedAt,
    );
  }
}
