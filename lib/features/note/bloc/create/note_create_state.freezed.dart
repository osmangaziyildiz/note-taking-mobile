// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteCreateState {

 String get title; String get content; bool get isLoading; String? get error; bool get isSuccess; NoteCreateSingleTimeEvent? get singleTimeEvent;
/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteCreateStateCopyWith<NoteCreateState> get copyWith => _$NoteCreateStateCopyWithImpl<NoteCreateState>(this as NoteCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteCreateState&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,isLoading,error,isSuccess,singleTimeEvent);

@override
String toString() {
  return 'NoteCreateState(title: $title, content: $content, isLoading: $isLoading, error: $error, isSuccess: $isSuccess, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class $NoteCreateStateCopyWith<$Res>  {
  factory $NoteCreateStateCopyWith(NoteCreateState value, $Res Function(NoteCreateState) _then) = _$NoteCreateStateCopyWithImpl;
@useResult
$Res call({
 String title, String content, bool isLoading, String? error, bool isSuccess, NoteCreateSingleTimeEvent? singleTimeEvent
});


$NoteCreateSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class _$NoteCreateStateCopyWithImpl<$Res>
    implements $NoteCreateStateCopyWith<$Res> {
  _$NoteCreateStateCopyWithImpl(this._self, this._then);

  final NoteCreateState _self;
  final $Res Function(NoteCreateState) _then;

/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,Object? singleTimeEvent = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as NoteCreateSingleTimeEvent?,
  ));
}
/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCreateSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $NoteCreateSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}


/// Adds pattern-matching-related methods to [NoteCreateState].
extension NoteCreateStatePatterns on NoteCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteCreateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteCreateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteCreateState value)  $default,){
final _that = this;
switch (_that) {
case _NoteCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteCreateState value)?  $default,){
final _that = this;
switch (_that) {
case _NoteCreateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content,  bool isLoading,  String? error,  bool isSuccess,  NoteCreateSingleTimeEvent? singleTimeEvent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteCreateState() when $default != null:
return $default(_that.title,_that.content,_that.isLoading,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content,  bool isLoading,  String? error,  bool isSuccess,  NoteCreateSingleTimeEvent? singleTimeEvent)  $default,) {final _that = this;
switch (_that) {
case _NoteCreateState():
return $default(_that.title,_that.content,_that.isLoading,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content,  bool isLoading,  String? error,  bool isSuccess,  NoteCreateSingleTimeEvent? singleTimeEvent)?  $default,) {final _that = this;
switch (_that) {
case _NoteCreateState() when $default != null:
return $default(_that.title,_that.content,_that.isLoading,_that.error,_that.isSuccess,_that.singleTimeEvent);case _:
  return null;

}
}

}

/// @nodoc


class _NoteCreateState implements NoteCreateState {
  const _NoteCreateState({this.title = '', this.content = '', this.isLoading = false, this.error, this.isSuccess = false, this.singleTimeEvent});
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String content;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isSuccess;
@override final  NoteCreateSingleTimeEvent? singleTimeEvent;

/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteCreateStateCopyWith<_NoteCreateState> get copyWith => __$NoteCreateStateCopyWithImpl<_NoteCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteCreateState&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,title,content,isLoading,error,isSuccess,singleTimeEvent);

@override
String toString() {
  return 'NoteCreateState(title: $title, content: $content, isLoading: $isLoading, error: $error, isSuccess: $isSuccess, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class _$NoteCreateStateCopyWith<$Res> implements $NoteCreateStateCopyWith<$Res> {
  factory _$NoteCreateStateCopyWith(_NoteCreateState value, $Res Function(_NoteCreateState) _then) = __$NoteCreateStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String content, bool isLoading, String? error, bool isSuccess, NoteCreateSingleTimeEvent? singleTimeEvent
});


@override $NoteCreateSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class __$NoteCreateStateCopyWithImpl<$Res>
    implements _$NoteCreateStateCopyWith<$Res> {
  __$NoteCreateStateCopyWithImpl(this._self, this._then);

  final _NoteCreateState _self;
  final $Res Function(_NoteCreateState) _then;

/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,Object? isLoading = null,Object? error = freezed,Object? isSuccess = null,Object? singleTimeEvent = freezed,}) {
  return _then(_NoteCreateState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as NoteCreateSingleTimeEvent?,
  ));
}

/// Create a copy of NoteCreateState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteCreateSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $NoteCreateSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}

/// @nodoc
mixin _$NoteCreateSingleTimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteCreateSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateSingleTimeEvent()';
}


}

/// @nodoc
class $NoteCreateSingleTimeEventCopyWith<$Res>  {
$NoteCreateSingleTimeEventCopyWith(NoteCreateSingleTimeEvent _, $Res Function(NoteCreateSingleTimeEvent) __);
}


/// Adds pattern-matching-related methods to [NoteCreateSingleTimeEvent].
extension NoteCreateSingleTimeEventPatterns on NoteCreateSingleTimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowErrorDialog value)?  showErrorDialog,TResult Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult Function( _NavigateToHome value)?  navigateToHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowErrorDialog value)  showErrorDialog,required TResult Function( _ShowSuccessDialog value)  showSuccessDialog,required TResult Function( _NavigateToHome value)  navigateToHome,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that);case _ShowSuccessDialog():
return showSuccessDialog(_that);case _NavigateToHome():
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowErrorDialog value)?  showErrorDialog,TResult? Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult? Function( _NavigateToHome value)?  navigateToHome,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showErrorDialog,TResult Function( String message)?  showSuccessDialog,TResult Function()?  navigateToHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showErrorDialog,required TResult Function( String message)  showSuccessDialog,required TResult Function()  navigateToHome,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that.message);case _ShowSuccessDialog():
return showSuccessDialog(_that.message);case _NavigateToHome():
return navigateToHome();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showErrorDialog,TResult? Function( String message)?  showSuccessDialog,TResult? Function()?  navigateToHome,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
  return null;

}
}

}

/// @nodoc


class _ShowErrorDialog implements NoteCreateSingleTimeEvent {
  const _ShowErrorDialog(this.message);
  

 final  String message;

/// Create a copy of NoteCreateSingleTimeEvent
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
  return 'NoteCreateSingleTimeEvent.showErrorDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorDialogCopyWith<$Res> implements $NoteCreateSingleTimeEventCopyWith<$Res> {
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

/// Create a copy of NoteCreateSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowErrorDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ShowSuccessDialog implements NoteCreateSingleTimeEvent {
  const _ShowSuccessDialog(this.message);
  

 final  String message;

/// Create a copy of NoteCreateSingleTimeEvent
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
  return 'NoteCreateSingleTimeEvent.showSuccessDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowSuccessDialogCopyWith<$Res> implements $NoteCreateSingleTimeEventCopyWith<$Res> {
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

/// Create a copy of NoteCreateSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowSuccessDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NavigateToHome implements NoteCreateSingleTimeEvent {
  const _NavigateToHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteCreateSingleTimeEvent.navigateToHome()';
}


}




// dart format on
