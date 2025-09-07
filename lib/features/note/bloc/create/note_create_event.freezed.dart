// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_create_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteCreateEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteCreateEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateEvent()';
}


}

/// @nodoc
class $NoteCreateEventCopyWith<$Res>  {
$NoteCreateEventCopyWith(NoteCreateEvent _, $Res Function(NoteCreateEvent) __);
}


/// Adds pattern-matching-related methods to [NoteCreateEvent].
extension NoteCreateEventPatterns on NoteCreateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TitleChanged value)?  titleChanged,TResult Function( _ContentChanged value)?  contentChanged,TResult Function( _SubmitPressed value)?  submitPressed,TResult Function( _ClearForm value)?  clearForm,TResult Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _ClearForm() when clearForm != null:
return clearForm(_that);case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TitleChanged value)  titleChanged,required TResult Function( _ContentChanged value)  contentChanged,required TResult Function( _SubmitPressed value)  submitPressed,required TResult Function( _ClearForm value)  clearForm,required TResult Function( _ClearSingleTimeEvent value)  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _TitleChanged():
return titleChanged(_that);case _ContentChanged():
return contentChanged(_that);case _SubmitPressed():
return submitPressed(_that);case _ClearForm():
return clearForm(_that);case _ClearSingleTimeEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TitleChanged value)?  titleChanged,TResult? Function( _ContentChanged value)?  contentChanged,TResult? Function( _SubmitPressed value)?  submitPressed,TResult? Function( _ClearForm value)?  clearForm,TResult? Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that);case _ContentChanged() when contentChanged != null:
return contentChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _ClearForm() when clearForm != null:
return clearForm(_that);case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title)?  titleChanged,TResult Function( String content)?  contentChanged,TResult Function()?  submitPressed,TResult Function()?  clearForm,TResult Function()?  clearSingleTimeEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _ContentChanged() when contentChanged != null:
return contentChanged(_that.content);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _ClearForm() when clearForm != null:
return clearForm();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title)  titleChanged,required TResult Function( String content)  contentChanged,required TResult Function()  submitPressed,required TResult Function()  clearForm,required TResult Function()  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _TitleChanged():
return titleChanged(_that.title);case _ContentChanged():
return contentChanged(_that.content);case _SubmitPressed():
return submitPressed();case _ClearForm():
return clearForm();case _ClearSingleTimeEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title)?  titleChanged,TResult? Function( String content)?  contentChanged,TResult? Function()?  submitPressed,TResult? Function()?  clearForm,TResult? Function()?  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _TitleChanged() when titleChanged != null:
return titleChanged(_that.title);case _ContentChanged() when contentChanged != null:
return contentChanged(_that.content);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _ClearForm() when clearForm != null:
return clearForm();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent();case _:
  return null;

}
}

}

/// @nodoc


class _TitleChanged implements NoteCreateEvent {
  const _TitleChanged(this.title);
  

 final  String title;

/// Create a copy of NoteCreateEvent
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
  return 'NoteCreateEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedCopyWith<$Res> implements $NoteCreateEventCopyWith<$Res> {
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

/// Create a copy of NoteCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChanged(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ContentChanged implements NoteCreateEvent {
  const _ContentChanged(this.content);
  

 final  String content;

/// Create a copy of NoteCreateEvent
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
  return 'NoteCreateEvent.contentChanged(content: $content)';
}


}

/// @nodoc
abstract mixin class _$ContentChangedCopyWith<$Res> implements $NoteCreateEventCopyWith<$Res> {
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

/// Create a copy of NoteCreateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_ContentChanged(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitPressed implements NoteCreateEvent {
  const _SubmitPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateEvent.submitPressed()';
}


}




/// @nodoc


class _ClearForm implements NoteCreateEvent {
  const _ClearForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateEvent.clearForm()';
}


}




/// @nodoc


class _ClearSingleTimeEvent implements NoteCreateEvent {
  const _ClearSingleTimeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateEvent.clearSingleTimeEvent()';
}


}




// dart format on
