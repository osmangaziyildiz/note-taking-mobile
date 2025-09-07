// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadNotes value)?  loadNotes,TResult Function( _RemoveNote value)?  removeNote,TResult Function( _AddNote value)?  addNote,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that);case _RemoveNote() when removeNote != null:
return removeNote(_that);case _AddNote() when addNote != null:
return addNote(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadNotes value)  loadNotes,required TResult Function( _RemoveNote value)  removeNote,required TResult Function( _AddNote value)  addNote,}){
final _that = this;
switch (_that) {
case _LoadNotes():
return loadNotes(_that);case _RemoveNote():
return removeNote(_that);case _AddNote():
return addNote(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadNotes value)?  loadNotes,TResult? Function( _RemoveNote value)?  removeNote,TResult? Function( _AddNote value)?  addNote,}){
final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that);case _RemoveNote() when removeNote != null:
return removeNote(_that);case _AddNote() when addNote != null:
return addNote(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadNotes,TResult Function( String noteId)?  removeNote,TResult Function( NoteModel note)?  addNote,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes();case _RemoveNote() when removeNote != null:
return removeNote(_that.noteId);case _AddNote() when addNote != null:
return addNote(_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadNotes,required TResult Function( String noteId)  removeNote,required TResult Function( NoteModel note)  addNote,}) {final _that = this;
switch (_that) {
case _LoadNotes():
return loadNotes();case _RemoveNote():
return removeNote(_that.noteId);case _AddNote():
return addNote(_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadNotes,TResult? Function( String noteId)?  removeNote,TResult? Function( NoteModel note)?  addNote,}) {final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes();case _RemoveNote() when removeNote != null:
return removeNote(_that.noteId);case _AddNote() when addNote != null:
return addNote(_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _LoadNotes implements HomeEvent {
  const _LoadNotes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNotes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.loadNotes()';
}


}




/// @nodoc


class _RemoveNote implements HomeEvent {
  const _RemoveNote(this.noteId);
  

 final  String noteId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveNoteCopyWith<_RemoveNote> get copyWith => __$RemoveNoteCopyWithImpl<_RemoveNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveNote&&(identical(other.noteId, noteId) || other.noteId == noteId));
}


@override
int get hashCode => Object.hash(runtimeType,noteId);

@override
String toString() {
  return 'HomeEvent.removeNote(noteId: $noteId)';
}


}

/// @nodoc
abstract mixin class _$RemoveNoteCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$RemoveNoteCopyWith(_RemoveNote value, $Res Function(_RemoveNote) _then) = __$RemoveNoteCopyWithImpl;
@useResult
$Res call({
 String noteId
});




}
/// @nodoc
class __$RemoveNoteCopyWithImpl<$Res>
    implements _$RemoveNoteCopyWith<$Res> {
  __$RemoveNoteCopyWithImpl(this._self, this._then);

  final _RemoveNote _self;
  final $Res Function(_RemoveNote) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? noteId = null,}) {
  return _then(_RemoveNote(
null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddNote implements HomeEvent {
  const _AddNote(this.note);
  

 final  NoteModel note;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddNoteCopyWith<_AddNote> get copyWith => __$AddNoteCopyWithImpl<_AddNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'HomeEvent.addNote(note: $note)';
}


}

/// @nodoc
abstract mixin class _$AddNoteCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$AddNoteCopyWith(_AddNote value, $Res Function(_AddNote) _then) = __$AddNoteCopyWithImpl;
@useResult
$Res call({
 NoteModel note
});


$NoteModelCopyWith<$Res> get note;

}
/// @nodoc
class __$AddNoteCopyWithImpl<$Res>
    implements _$AddNoteCopyWith<$Res> {
  __$AddNoteCopyWithImpl(this._self, this._then);

  final _AddNote _self;
  final $Res Function(_AddNote) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_AddNote(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteModel,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteModelCopyWith<$Res> get note {
  
  return $NoteModelCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

// dart format on
