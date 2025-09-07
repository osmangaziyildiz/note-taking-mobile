import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:notetakingapp/core/models/note_model.dart';

part 'database.g.dart';

// String list converter for tags
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}

// Enum converter for SyncStatus
class EnumNameConverter<T extends Enum> extends TypeConverter<T, String> {
  const EnumNameConverter(this.enumValues);
  final List<T> enumValues;

  @override
  T fromSql(String fromDb) {
    return enumValues.firstWhere((e) => e.name == fromDb);
  }

  @override
  String toSql(T value) {
    return value.name;
  }
}

// Notes table
class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get ownerUid => text().nullable()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  TextColumn get tags => text().map(const StringListConverter())();
  TextColumn get syncStatus => text().map(const EnumNameConverter(SyncStatus.values))();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'notes.db'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
  
  // Get all notes
  Future<List<Note>> getAllNotes() => select(notes).get();
  
  // Get note by id
  Future<Note?> getNoteById(String id) async {
    final query = select(notes)..where((tbl) => tbl.id.equals(id));
    return await query.getSingleOrNull();
  }
  
  // Insert or update note
  Future<void> saveNote(Note note) async {
    await into(notes).insertOnConflictUpdate(note);
  }
  
  // Delete note
  Future<void> deleteNote(String id) async {
    await (delete(notes)..where((tbl) => tbl.id.equals(id))).go();
  }
  
  // Get pending notes
  Future<List<Note>> getPendingNotes() async {
    final query = select(notes)..where((tbl) => tbl.syncStatus.equals(SyncStatus.pending.name));
    return query.get();
  }
  
  // Mark note as synced
  Future<void> markAsSynced(String id) async {
    await (update(notes)..where((tbl) => tbl.id.equals(id)))
        .write(NotesCompanion(
          syncStatus: const Value(SyncStatus.synced),
          lastSyncedAt: Value(DateTime.now()),
        ));
  }
  
  // Get last sync time
  Future<DateTime?> getLastSyncTime() async {
    final query = select(notes)
      ..where((tbl) => tbl.lastSyncedAt.isNotNull())
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.lastSyncedAt)])
      ..limit(1);
    
    final result = await query.getSingleOrNull();
    return result?.lastSyncedAt;
  }
  
  // Get notes modified after last sync
  Future<List<Note>> getNotesModifiedAfter(DateTime lastSync) async {
    final query = select(notes)..where((tbl) => tbl.updatedAt.isBiggerThanValue(lastSync));
    return await query.get();
  }
}
