import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_model.freezed.dart';
part 'note_model.g.dart';

// SyncStatus enum for offline-first functionality
enum SyncStatus {
  pending,
  synced,
}

@freezed
abstract class NoteModel with _$NoteModel {
  const factory NoteModel({
    required String id,
    required String title,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'owner_uid') String? ownerUid,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
    @Default([]) List<String> tags,
    // Offline-first fields
    @Default(SyncStatus.pending) SyncStatus syncStatus,
    DateTime? lastSyncedAt,
  }) = _NoteModel;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);
}
