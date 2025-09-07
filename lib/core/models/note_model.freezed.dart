// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NoteModel {

 String get id; String get title; String get content;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'owner_uid') String? get ownerUid;@JsonKey(name: 'is_favorite') bool get isFavorite; List<String> get tags;// Offline-first fields
 SyncStatus get syncStatus; DateTime? get lastSyncedAt;
/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteModelCopyWith<NoteModel> get copyWith => _$NoteModelCopyWithImpl<NoteModel>(this as NoteModel, _$identity);

  /// Serializes this NoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ownerUid, ownerUid) || other.ownerUid == ownerUid)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,createdAt,updatedAt,ownerUid,isFavorite,const DeepCollectionEquality().hash(tags),syncStatus,lastSyncedAt);

@override
String toString() {
  return 'NoteModel(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, ownerUid: $ownerUid, isFavorite: $isFavorite, tags: $tags, syncStatus: $syncStatus, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class $NoteModelCopyWith<$Res>  {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) _then) = _$NoteModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String content,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'owner_uid') String? ownerUid,@JsonKey(name: 'is_favorite') bool isFavorite, List<String> tags, SyncStatus syncStatus, DateTime? lastSyncedAt
});




}
/// @nodoc
class _$NoteModelCopyWithImpl<$Res>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._self, this._then);

  final NoteModel _self;
  final $Res Function(NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? ownerUid = freezed,Object? isFavorite = null,Object? tags = null,Object? syncStatus = null,Object? lastSyncedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,ownerUid: freezed == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteModel].
extension NoteModelPatterns on NoteModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteModel value)  $default,){
final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String content, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'owner_uid')  String? ownerUid, @JsonKey(name: 'is_favorite')  bool isFavorite,  List<String> tags,  SyncStatus syncStatus,  DateTime? lastSyncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.ownerUid,_that.isFavorite,_that.tags,_that.syncStatus,_that.lastSyncedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String content, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'owner_uid')  String? ownerUid, @JsonKey(name: 'is_favorite')  bool isFavorite,  List<String> tags,  SyncStatus syncStatus,  DateTime? lastSyncedAt)  $default,) {final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.ownerUid,_that.isFavorite,_that.tags,_that.syncStatus,_that.lastSyncedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String content, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'owner_uid')  String? ownerUid, @JsonKey(name: 'is_favorite')  bool isFavorite,  List<String> tags,  SyncStatus syncStatus,  DateTime? lastSyncedAt)?  $default,) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.createdAt,_that.updatedAt,_that.ownerUid,_that.isFavorite,_that.tags,_that.syncStatus,_that.lastSyncedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NoteModel implements NoteModel {
  const _NoteModel({required this.id, required this.title, required this.content, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'owner_uid') this.ownerUid, @JsonKey(name: 'is_favorite') this.isFavorite = false, final  List<String> tags = const [], this.syncStatus = SyncStatus.pending, this.lastSyncedAt}): _tags = tags;
  factory _NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String content;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'owner_uid') final  String? ownerUid;
@override@JsonKey(name: 'is_favorite') final  bool isFavorite;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

// Offline-first fields
@override@JsonKey() final  SyncStatus syncStatus;
@override final  DateTime? lastSyncedAt;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteModelCopyWith<_NoteModel> get copyWith => __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.ownerUid, ownerUid) || other.ownerUid == ownerUid)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,content,createdAt,updatedAt,ownerUid,isFavorite,const DeepCollectionEquality().hash(_tags),syncStatus,lastSyncedAt);

@override
String toString() {
  return 'NoteModel(id: $id, title: $title, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, ownerUid: $ownerUid, isFavorite: $isFavorite, tags: $tags, syncStatus: $syncStatus, lastSyncedAt: $lastSyncedAt)';
}


}

/// @nodoc
abstract mixin class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(_NoteModel value, $Res Function(_NoteModel) _then) = __$NoteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String content,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'owner_uid') String? ownerUid,@JsonKey(name: 'is_favorite') bool isFavorite, List<String> tags, SyncStatus syncStatus, DateTime? lastSyncedAt
});




}
/// @nodoc
class __$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(this._self, this._then);

  final _NoteModel _self;
  final $Res Function(_NoteModel) _then;

/// Create a copy of NoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? createdAt = null,Object? updatedAt = null,Object? ownerUid = freezed,Object? isFavorite = null,Object? tags = null,Object? syncStatus = null,Object? lastSyncedAt = freezed,}) {
  return _then(_NoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,ownerUid: freezed == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String?,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as SyncStatus,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
