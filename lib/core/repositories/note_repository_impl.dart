import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/core/network/connection_service.dart';
import 'package:notetakingapp/core/repositories/local_note_repository.dart';
import 'package:notetakingapp/core/repositories/note_repository.dart';
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
      // First, get notes from local
      final localResult = await _localNoteRepository.getAllNotes();
      if (localResult.isLeft()) {
        return left(localResult.getLeft().getOrElse(() => 'Unknown error'));
      }

      final localNotes = localResult.getOrElse((error) => []);

      // If internet connection exists, sync with server
      if (_connectionService.isConnected) {
        // Get notes from server
        final remoteResult = await _remoteNoteRepository.getAllNotes();
        if (remoteResult.isRight()) {
          final serverNotes = remoteResult.getOrElse((error) => []);

          // Conflict resolution - Last write wins
          final mergedNotes = _mergeNotes(localNotes, serverNotes);

          // Sync pending notes
          await _syncPendingNotes();

          return right(mergedNotes);
        } else {}
      } else {}

      return right(localNotes);
    } on Exception catch (e) {
      return left('Failed to get notes: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> getNoteById(String id) async {
    try {
      // First, get note from local
      final localResult = await _localNoteRepository.getNoteById(id);
      if (localResult.isRight()) {
        final localNote = localResult.getOrElse((error) => null);
        if (localNote != null) {
          return right(localNote);
        }
      }

      // If internet connection exists, get from server
      if (_connectionService.isConnected) {
        final remoteResult = await _remoteNoteRepository.getNoteById(id);
        if (remoteResult.isRight()) {
          final serverNote = remoteResult.getOrElse((error) => null);
          if (serverNote != null) {
            await _localNoteRepository.saveNote(serverNote);
            return right(serverNote);
          }
        }
      }

      return left('Note not found');
    } on Exception catch (e) {
      return left('Failed to get note: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> createNote({
    required String title,
    required String content,
  }) async {
    try {
      // Get current user
      final currentUserResult = await _authRepository.getCurrentUser();
      if (currentUserResult.isLeft()) {
        return left('User not authenticated');
      }

      final currentUser = currentUserResult.getOrElse((error) => null);
      if (currentUser == null) {
        return left('User not found');
      }

      // Create new note with UUID
      final note = NoteModel(
        id: const Uuid().v4(),
        title: title,
        content: content,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        ownerUid: currentUser.id,
      );

      // Save to local
      final saveResult = await _localNoteRepository.saveNote(note);
      if (saveResult.isLeft()) {
        return left(saveResult.getLeft().getOrElse(() => 'Unknown error'));
      }

      // If internet connection exists, send to server
      if (_connectionService.isConnected) {
        final syncResult = await _remoteNoteRepository.syncNote(note);
        if (syncResult.isRight()) {
          final syncedNote = syncResult.getOrElse((error) => note);
          // Update local
          await _localNoteRepository.saveNote(syncedNote);
          return right(syncedNote);
        } else {}
      } else {}

      return right(note);
    } on Exception catch (e) {
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
      // Get note from local
      final localResult = await _localNoteRepository.getNoteById(noteId);
      if (localResult.isLeft()) {
        return left('Note not found locally');
      }

      final existingNote = localResult.getOrElse((error) => null);
      if (existingNote == null) {
        return left('Note not found');
      }

      // Update note
      final updatedNote = existingNote.copyWith(
        title: title,
        content: content,
        updatedAt: DateTime.now(),
      );

      // Update local
      final saveResult = await _localNoteRepository.saveNote(updatedNote);
      if (saveResult.isLeft()) {
        return left(saveResult.getLeft().getOrElse(() => 'Unknown error'));
      }

      // If internet connection exists, send to server
      if (_connectionService.isConnected) {
        final syncResult = await _remoteNoteRepository.syncNote(updatedNote);
        if (syncResult.isRight()) {
          final syncedNote = syncResult.getOrElse((error) => updatedNote);
          // Update local
          await _localNoteRepository.saveNote(syncedNote);
          return right(syncedNote);
        } else {}
      } else {}

      return right(updatedNote);
    } on Exception catch (e) {
      return left('Failed to update note: $e');
    }
  }

  @override
  Future<Either<String, Unit>> deleteNote(String id) async {
    try {
      // Delete from local
      final deleteResult = await _localNoteRepository.deleteNote(id);
      if (deleteResult.isLeft()) {
        return left(deleteResult.getLeft().getOrElse(() => 'Unknown error'));
      }

      // If internet connection exists, delete from server
      if (_connectionService.isConnected) {
        await _remoteNoteRepository.deleteNote(id);
      }

      return right(unit);
    } on Exception catch (e) {
      return left('Failed to delete note: $e');
    }
  }

  @override
  Future<Either<String, NoteModel>> toggleNoteFavorite(String noteId) async {
    try {
      // Get note from local
      final localResult = await _localNoteRepository.getNoteById(noteId);
      if (localResult.isLeft()) {
        return left('Note not found locally');
      }

      final existingNote = localResult.getOrElse((error) => null);
      if (existingNote == null) {
        return left('Note not found');
      }

      // Toggle favorite status
      final updatedNote = existingNote.copyWith(
        isFavorite: !existingNote.isFavorite,
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending, // Mark as pending for sync
      );

      // Update local
      final saveResult = await _localNoteRepository.saveNote(updatedNote);
      if (saveResult.isLeft()) {
        return left(saveResult.getLeft().getOrElse(() => 'Unknown error'));
      }

      // If internet connection exists, send to server
      if (_connectionService.isConnected) {
        final favoriteResult = await _remoteNoteRepository.toggleNoteFavorite(
          noteId, 
          updatedNote.isFavorite,
        );
        if (favoriteResult.isRight()) {
          final syncedNote = favoriteResult.getOrElse((error) => updatedNote);
          // Update local with synced version
          await _localNoteRepository.saveNote(syncedNote);
          return right(syncedNote);
        } else {}
      } else {}
      return right(updatedNote);
    } on Exception catch (e) {
      return left('Failed to toggle note favorite: $e');
    }
  }

  // Helper methods
  List<NoteModel> _mergeNotes(
    List<NoteModel> localNotes,
    List<NoteModel> serverNotes,
  ) {
    final mergedMap = <String, NoteModel>{};

    // Add local notes
    for (final note in localNotes) {
      mergedMap[note.id] = note;
    }

    // Add/update server notes (conflict resolution)
    for (final serverNote in serverNotes) {
      final localNote = mergedMap[serverNote.id];
      if (localNote == null) {
        // Has server note, but not in local - DELETE (offline-first)
        _deleteFromServer(serverNote.id);
      } else {
        // Has both - last write wins
        if (serverNote.updatedAt.isAfter(localNote.updatedAt)) {
          // Server more recent
          mergedMap[serverNote.id] = serverNote;
        } else {
          // Local more recent - sync to server
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

      for (final note in pendingNotes) {
        await _syncLocalNoteToServer(note);
      }
    }
  }

  Future<void> _syncLocalNoteToServer(NoteModel localNote) async {
    try {
      final syncResult = await _remoteNoteRepository.syncNote(localNote);
      if (syncResult.isRight()) {
        final syncedNote = syncResult.getOrElse((error) => localNote);
        // Update local
        await _localNoteRepository.saveNote(syncedNote);
        // Update last synced metadata
        final markRes = await _localNoteRepository.markAsSynced(syncedNote.id);
        if (markRes.isLeft()) {}
      } else {}
    } on Exception catch (e) {
      debugPrint('⚠️ : Error syncing ${localNote.title}: $e');
    }
  }

  Future<void> _deleteFromServer(String noteId) async {
    try {
      await _remoteNoteRepository.deleteNote(noteId);
    } on Exception catch (e) {
      debugPrint('⚠️ : Error deleting note from server: $e');
    }
  }
}
