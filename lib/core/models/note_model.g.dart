// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: specify_nonobvious_property_types, document_ignores, unnecessary_null_checks

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => _NoteModel(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  ownerUid: json['owner_uid'] as String?,
  isFavorite: json['is_favorite'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  syncStatus:
      $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
      SyncStatus.pending,
  lastSyncedAt: json['lastSyncedAt'] == null
      ? null
      : DateTime.parse(json['lastSyncedAt'] as String),
);

Map<String, dynamic> _$NoteModelToJson(_NoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'owner_uid': instance.ownerUid,
      'is_favorite': instance.isFavorite,
      'tags': instance.tags,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'lastSyncedAt': instance.lastSyncedAt?.toIso8601String(),
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.synced: 'synced',
};
