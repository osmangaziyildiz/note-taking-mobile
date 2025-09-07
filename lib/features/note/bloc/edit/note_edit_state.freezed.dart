// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteEditState {

 NoteModel? get note; String get title; String get content; bool get isLoading; bool get isDeleting; String? get error; bool get isSuccess; NoteEditSingleTimeEvent? get singleTimeEvent;
/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteEditStateCopyWith<NoteEditState> get copyWith => _$NoteEditStateCopyWithImpl<NoteEditState>(this as NoteEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEditState&&(identical(other.note, note) || other.note == note)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,note,title,content,isLoading,isDeleting,error,isSuccess,singleTimeEvent);

@override
String toString() {
  return 'NoteEditState(note: $note, title: $title, content: $content, isLoading: $isLoading, isDeleting: $isDeleting, error: $error, isSuccess: $isSuccess, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class $NoteEditStateCopyWith<$Res>  {
  factory $NoteEditStateCopyWith(NoteEditState value, $Res Function(NoteEditState) _then) = _$NoteEditStateCopyWithImpl;
@useResult
$Res call({
 NoteModel? note, String title, String content, bool isLoading, bool isDeleting, String? error, bool isSuccess, NoteEditSingleTimeEvent? singleTimeEvent
});


$NoteModelCopyWith<$Res>? get note;$NoteEditSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class _$NoteEditStateCopyWithImpl<$Res>
    implements $NoteEditStateCopyWith<$Res> {
  _$NoteEditStateCopyWithImpl(this._self, this._then);

  final NoteEditState _self;
  final $Res Function(NoteEditState) _then;

/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? note = freezed,Object? title = null,Object? content = null,Object? isLoading = null,Object? isDeleting = null,Object? error = freezed,Object? isSuccess = null,Object? singleTimeEvent = freezed,}) {
  return _then(_self.copyWith(
note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as NoteEditSingleTimeEvent?,
  ));
}
/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteModelCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $NoteModelCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteEditSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $NoteEditSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteEditState].
extension NoteEditStatePatterns on NoteEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteEditState value)  $default,){
final _that = this;
switch (_that) {
case _NoteEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteEditState value)?  $default,){
final _that = this;
switch (_that) {
case _NoteEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NoteModel? note,  String title,  String content,  bool isLoading,  bool isDeleting,  String? error,  bool isSuccess,  NoteEditSingleTimeEvent? singleTimeEvent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteEditState() when $default != null:
return $default(_that.note,_that.title,_that.content,_that.isLoading,_that.isDeleting,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NoteModel? note,  String title,  String content,  bool isLoading,  bool isDeleting,  String? error,  bool isSuccess,  NoteEditSingleTimeEvent? singleTimeEvent)  $default,) {final _that = this;
switch (_that) {
case _NoteEditState():
return $default(_that.note,_that.title,_that.content,_that.isLoading,_that.isDeleting,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NoteModel? note,  String title,  String content,  bool isLoading,  bool isDeleting,  String? error,  bool isSuccess,  NoteEditSingleTimeEvent? singleTimeEvent)?  $default,) {final _that = this;
switch (_that) {
case _NoteEditState() when $default != null:
return $default(_that.note,_that.title,_that.content,_that.isLoading,_that.isDeleting,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
  return null;

}
}

}

/// @nodoc


class _NoteEditState implements NoteEditState {
  const _NoteEditState({this.note, this.title = '', this.content = '', this.isLoading = false, this.isDeleting = false, this.error, this.isSuccess = false, this.singleTimeEvent});
  

@override final  NoteModel? note;
@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isDeleting;
@override final  String? error;
@override@JsonKey() final  bool isSuccess;
@override final  NoteEditSingleTimeEvent? singleTimeEvent;

/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteEditStateCopyWith<_NoteEditState> get copyWith => __$NoteEditStateCopyWithImpl<_NoteEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteEditState&&(identical(other.note, note) || other.note == note)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,note,title,content,isLoading,isDeleting,error,isSuccess,singleTimeEvent);

@override
String toString() {
  return 'NoteEditState(note: $note, title: $title, content: $content, isLoading: $isLoading, isDeleting: $isDeleting, error: $error, isSuccess: $isSuccess, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class _$NoteEditStateCopyWith<$Res> implements $NoteEditStateCopyWith<$Res> {
  factory _$NoteEditStateCopyWith(_NoteEditState value, $Res Function(_NoteEditState) _then) = __$NoteEditStateCopyWithImpl;
@override @useResult
$Res call({
 NoteModel? note, String title, String content, bool isLoading, bool isDeleting, String? error, bool isSuccess, NoteEditSingleTimeEvent? singleTimeEvent
});


@override $NoteModelCopyWith<$Res>? get note;@override $NoteEditSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class __$NoteEditStateCopyWithImpl<$Res>
    implements _$NoteEditStateCopyWith<$Res> {
  __$NoteEditStateCopyWithImpl(this._self, this._then);

  final _NoteEditState _self;
  final $Res Function(_NoteEditState) _then;

/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? note = freezed,Object? title = null,Object? content = null,Object? isLoading = null,Object? isDeleting = null,Object? error = freezed,Object? isSuccess = null,Object? singleTimeEvent = freezed,}) {
  return _then(_NoteEditState(
note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteModel?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as NoteEditSingleTimeEvent?,
  ));
}

/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteModelCopyWith<$Res>? get note {
    if (_self.note == null) {
    return null;
  }

  return $NoteModelCopyWith<$Res>(_self.note!, (value) {
    return _then(_self.copyWith(note: value));
  });
}/// Create a copy of NoteEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteEditSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $NoteEditSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}

/// @nodoc
mixin _$NoteEditSingleTimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteEditSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditSingleTimeEvent()';
}


}

/// @nodoc
class $NoteEditSingleTimeEventCopyWith<$Res>  {
$NoteEditSingleTimeEventCopyWith(NoteEditSingleTimeEvent _, $Res Function(NoteEditSingleTimeEvent) __);
}


/// Adds pattern-matching-related methods to [NoteEditSingleTimeEvent].
extension NoteEditSingleTimeEventPatterns on NoteEditSingleTimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowErrorDialog value)?  showErrorDialog,TResult Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult Function( _NavigateToHome value)?  navigateToHome,TResult Function( _ShowDeleteConfirmation value)?  showDeleteConfirmation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _ShowDeleteConfirmation() when showDeleteConfirmation != null:
return showDeleteConfirmation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowErrorDialog value)  showErrorDialog,required TResult Function( _ShowSuccessDialog value)  showSuccessDialog,required TResult Function( _NavigateToHome value)  navigateToHome,required TResult Function( _ShowDeleteConfirmation value)  showDeleteConfirmation,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that);case _ShowSuccessDialog():
return showSuccessDialog(_that);case _NavigateToHome():
return navigateToHome(_that);case _ShowDeleteConfirmation():
return showDeleteConfirmation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowErrorDialog value)?  showErrorDialog,TResult? Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult? Function( _NavigateToHome value)?  navigateToHome,TResult? Function( _ShowDeleteConfirmation value)?  showDeleteConfirmation,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _ShowDeleteConfirmation() when showDeleteConfirmation != null:
return showDeleteConfirmation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showErrorDialog,TResult Function( String message)?  showSuccessDialog,TResult Function()?  navigateToHome,TResult Function()?  showDeleteConfirmation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _ShowDeleteConfirmation() when showDeleteConfirmation != null:
return showDeleteConfirmation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showErrorDialog,required TResult Function( String message)  showSuccessDialog,required TResult Function()  navigateToHome,required TResult Function()  showDeleteConfirmation,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that.message);case _ShowSuccessDialog():
return showSuccessDialog(_that.message);case _NavigateToHome():
return navigateToHome();case _ShowDeleteConfirmation():
return showDeleteConfirmation();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showErrorDialog,TResult? Function( String message)?  showSuccessDialog,TResult? Function()?  navigateToHome,TResult? Function()?  showDeleteConfirmation,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _ShowDeleteConfirmation() when showDeleteConfirmation != null:
return showDeleteConfirmation();case _:
  return null;

}
}

}

/// @nodoc


class _ShowErrorDialog implements NoteEditSingleTimeEvent {
  const _ShowErrorDialog(this.message);
  

 final  String message;

/// Create a copy of NoteEditSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowErrorDialogCopyWith<_ShowErrorDialog> get copyWith => __$ShowErrorDialogCopyWithImpl<_ShowErrorDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowErrorDialog&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NoteEditSingleTimeEvent.showErrorDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorDialogCopyWith<$Res> implements $NoteEditSingleTimeEventCopyWith<$Res> {
  factory _$ShowErrorDialogCopyWith(_ShowErrorDialog value, $Res Function(_ShowErrorDialog) _then) = __$ShowErrorDialogCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ShowErrorDialogCopyWithImpl<$Res>
    implements _$ShowErrorDialogCopyWith<$Res> {
  __$ShowErrorDialogCopyWithImpl(this._self, this._then);

  final _ShowErrorDialog _self;
  final $Res Function(_ShowErrorDialog) _then;

/// Create a copy of NoteEditSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowErrorDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ShowSuccessDialog implements NoteEditSingleTimeEvent {
  const _ShowSuccessDialog(this.message);
  

 final  String message;

/// Create a copy of NoteEditSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowSuccessDialogCopyWith<_ShowSuccessDialog> get copyWith => __$ShowSuccessDialogCopyWithImpl<_ShowSuccessDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowSuccessDialog&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NoteEditSingleTimeEvent.showSuccessDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowSuccessDialogCopyWith<$Res> implements $NoteEditSingleTimeEventCopyWith<$Res> {
  factory _$ShowSuccessDialogCopyWith(_ShowSuccessDialog value, $Res Function(_ShowSuccessDialog) _then) = __$ShowSuccessDialogCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ShowSuccessDialogCopyWithImpl<$Res>
    implements _$ShowSuccessDialogCopyWith<$Res> {
  __$ShowSuccessDialogCopyWithImpl(this._self, this._then);

  final _ShowSuccessDialog _self;
  final $Res Function(_ShowSuccessDialog) _then;

/// Create a copy of NoteEditSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowSuccessDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NavigateToHome implements NoteEditSingleTimeEvent {
  const _NavigateToHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditSingleTimeEvent.navigateToHome()';
}


}




/// @nodoc


class _ShowDeleteConfirmation implements NoteEditSingleTimeEvent {
  const _ShowDeleteConfirmation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowDeleteConfirmation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteEditSingleTimeEvent.showDeleteConfirmation()';
}


}




// dart format on
