// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_edit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteEditEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEditEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditEvent()';
}


}

/// @nodoc
class $NoteEditEventCopyWith<$Res>  {
$NoteEditEventCopyWith(NoteEditEvent _, $Res Function(NoteEditEvent) __);
}


/// Adds pattern-matching-related methods to [NoteEditEvent].
extension NoteEditEventPatterns on NoteEditEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadNote value)?  loadNote,TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _ContentChanged value)?  contentChanged,TResult Function( _SubmitPressed value)?  submitPressed,TResult Function( _DeletePressed value)?  deletePressed,TResult Function( _ConfirmDelete value)?  confirmDelete,TResult Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadNote() when loadNote != null:
return loadNote(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that);case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadNote value)  loadNote,required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _ContentChanged value)  contentChanged,required TResult Function( _SubmitPressed value)  submitPressed,required TResult Function( _DeletePressed value)  deletePressed,required TResult Function( _ConfirmDelete value)  confirmDelete,required TResult Function( _ClearSingleTimeEvent value)  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _LoadNote():
return loadNote(_that);case _TitleChanged():
return titleChanged(_that);case _ContentChanged():
return contentChanged(_that);case _SubmitPressed():
return submitPressed(_that);case _DeletePressed():
return deletePressed(_that);case _ConfirmDelete():
return confirmDelete(_that);case _ClearSingleTimeEvent():
return clearSingleTimeEvent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadNote value)?  loadNote,TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _ContentChanged value)?  contentChanged,TResult? Function( _SubmitPressed value)?  submitPressed,TResult? Function( _DeletePressed value)?  deletePressed,TResult? Function( _ConfirmDelete value)?  confirmDelete,TResult? Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _LoadNote() when loadNote != null:
return loadNote(_that);case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _DeletePressed() when deletePressed != null:
return deletePressed(_that);case _ConfirmDelete() when confirmDelete != null:
return confirmDelete(_that);case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String noteId)?  loadNote,TResult Function( String title)?  titleChanged,TResult Function( String content)?  contentChanged,TResult Function()?  submitPressed,TResult Function()?  deletePressed,TResult Function()?  confirmDelete,TResult Function()?  clearSingleTimeEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadNote() when loadNote != null:
return loadNote(_that.noteId);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _ContentChanged() when contentChanged != null:
return contentChanged(_that.content);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _DeletePressed() when deletePressed != null:
return deletePressed();case _ConfirmDelete() when confirmDelete != null:
return confirmDelete();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String noteId)  loadNote,required TResult Function( String title)  titleChanged,required TResult Function( String content)  contentChanged,required TResult Function()  submitPressed,required TResult Function()  deletePressed,required TResult Function()  confirmDelete,required TResult Function()  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _LoadNote():
return loadNote(_that.noteId);case _TitleChanged():
return titleChanged(_that.title);case _ContentChanged():
return contentChanged(_that.content);case _SubmitPressed():
return submitPressed();case _DeletePressed():
return deletePressed();case _ConfirmDelete():
return confirmDelete();case _ClearSingleTimeEvent():
return clearSingleTimeEvent();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String noteId)?  loadNote,TResult? Function( String title)?  titleChanged,TResult? Function( String content)?  contentChanged,TResult? Function()?  submitPressed,TResult? Function()?  deletePressed,TResult? Function()?  confirmDelete,TResult? Function()?  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _LoadNote() when loadNote != null:
return loadNote(_that.noteId);case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _ContentChanged() when contentChanged != null:
return contentChanged(_that.content);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _DeletePressed() when deletePressed != null:
return deletePressed();case _ConfirmDelete() when confirmDelete != null:
return confirmDelete();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent();case _:
  return null;

}
}

}

/// @nodoc


class _LoadNote implements NoteEditEvent {
  const _LoadNote(this.noteId);
  

 final  String noteId;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadNoteCopyWith<_LoadNote> get copyWith => __$LoadNoteCopyWithImpl<_LoadNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNote&&(identical(other.noteId, noteId) || other.noteId == noteId));
}


@override
int get hashCode => Object.hash(runtimeType,noteId);

@override
String toString() {
  return 'NoteEditEvent.loadNote(noteId: $noteId)';
}


}

/// @nodoc
abstract mixin class _$LoadNoteCopyWith<$Res> implements $NoteEditEventCopyWith<$Res> {
  factory _$LoadNoteCopyWith(_LoadNote value, $Res Function(_LoadNote) _then) = __$LoadNoteCopyWithImpl;
@useResult
$Res call({
 String noteId
});




}
/// @nodoc
class __$LoadNoteCopyWithImpl<$Res>
    implements _$LoadNoteCopyWith<$Res> {
  __$LoadNoteCopyWithImpl(this._self, this._then);

  final _LoadNote _self;
  final $Res Function(_LoadNote) _then;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? noteId = null,}) {
  return _then(_LoadNote(
null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TitleChanged implements NoteEditEvent {
  const _TitleChanged(this.title);
  

 final  String title;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleChangedCopyWith<_TitleChanged> get copyWith => __$TitleChangedCopyWithImpl<_TitleChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleChanged&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'NoteEditEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $NoteEditEventCopyWith<$Res> {
  factory _$TitleChangedCopyWith(_TitleChanged value, $Res Function(_TitleChanged) _then) = __$TitleChangedCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$TitleChangedCopyWithImpl<$Res>
    implements _$TitleChangedCopyWith<$Res> {
  __$TitleChangedCopyWithImpl(this._self, this._then);

  final _TitleChanged _self;
  final $Res Function(_TitleChanged) _then;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ContentChanged implements NoteEditEvent {
  const _ContentChanged(this.content);
  

 final  String content;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentChangedCopyWith<_ContentChanged> get copyWith => __$ContentChangedCopyWithImpl<_ContentChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentChanged&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'NoteEditEvent.contentChanged(content: $content)';
}


}

/// @nodoc
abstract mixin class _$ContentChangedCopyWith<$Res> implements $NoteEditEventCopyWith<$Res> {
  factory _$ContentChangedCopyWith(_ContentChanged value, $Res Function(_ContentChanged) _then) = __$ContentChangedCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class __$ContentChangedCopyWithImpl<$Res>
    implements _$ContentChangedCopyWith<$Res> {
  __$ContentChangedCopyWithImpl(this._self, this._then);

  final _ContentChanged _self;
  final $Res Function(_ContentChanged) _then;

/// Create a copy of NoteEditEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_ContentChanged(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitPressed implements NoteEditEvent {
  const _SubmitPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditEvent.submitPressed()';
}


}




/// @nodoc


class _DeletePressed implements NoteEditEvent {
  const _DeletePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditEvent.deletePressed()';
}


}




/// @nodoc


class _ConfirmDelete implements NoteEditEvent {
  const _ConfirmDelete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmDelete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditEvent.confirmDelete()';
}


}




/// @nodoc


class _ClearSingleTimeEvent implements NoteEditEvent {
  const _ClearSingleTimeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditEvent.clearSingleTimeEvent()';
}


}




// dart format on
