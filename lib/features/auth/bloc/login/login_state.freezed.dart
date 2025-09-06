// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 String get email; String get password; bool get isLoading; bool get isEmailValid; bool get isPasswordValid; bool get isFormValid; LoginSingleTimeEvent? get singleTimeEvent; String? get emailError; String? get passwordError;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEmailValid, isEmailValid) || other.isEmailValid == isEmailValid)&&(identical(other.isPasswordValid, isPasswordValid) || other.isPasswordValid == isPasswordValid)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,isEmailValid,isPasswordValid,isFormValid,singleTimeEvent,emailError,passwordError);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, isLoading: $isLoading, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isFormValid: $isFormValid, singleTimeEvent: $singleTimeEvent, emailError: $emailError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 String email, String password, bool isLoading, bool isEmailValid, bool isPasswordValid, bool isFormValid, LoginSingleTimeEvent? singleTimeEvent, String? emailError, String? passwordError
});


$LoginSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? isLoading = null,Object? isEmailValid = null,Object? isPasswordValid = null,Object? isFormValid = null,Object? singleTimeEvent = freezed,Object? emailError = freezed,Object? passwordError = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEmailValid: null == isEmailValid ? _self.isEmailValid : isEmailValid // ignore: cast_nullable_to_non_nullable
as bool,isPasswordValid: null == isPasswordValid ? _self.isPasswordValid : isPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as LoginSingleTimeEvent?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $LoginSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  bool isLoading,  bool isEmailValid,  bool isPasswordValid,  bool isFormValid,  LoginSingleTimeEvent? singleTimeEvent,  String? emailError,  String? passwordError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.isLoading,_that.isEmailValid,_that.isPasswordValid,_that.isFormValid,_that.singleTimeEvent,_that.emailError,_that.passwordError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  bool isLoading,  bool isEmailValid,  bool isPasswordValid,  bool isFormValid,  LoginSingleTimeEvent? singleTimeEvent,  String? emailError,  String? passwordError)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.email,_that.password,_that.isLoading,_that.isEmailValid,_that.isPasswordValid,_that.isFormValid,_that.singleTimeEvent,_that.emailError,_that.passwordError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  bool isLoading,  bool isEmailValid,  bool isPasswordValid,  bool isFormValid,  LoginSingleTimeEvent? singleTimeEvent,  String? emailError,  String? passwordError)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.isLoading,_that.isEmailValid,_that.isPasswordValid,_that.isFormValid,_that.singleTimeEvent,_that.emailError,_that.passwordError);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.email = '', this.password = '', this.isLoading = false, this.isEmailValid = false, this.isPasswordValid = false, this.isFormValid = false, this.singleTimeEvent, this.emailError, this.passwordError});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isEmailValid;
@override@JsonKey() final  bool isPasswordValid;
@override@JsonKey() final  bool isFormValid;
@override final  LoginSingleTimeEvent? singleTimeEvent;
@override final  String? emailError;
@override final  String? passwordError;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEmailValid, isEmailValid) || other.isEmailValid == isEmailValid)&&(identical(other.isPasswordValid, isPasswordValid) || other.isPasswordValid == isPasswordValid)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,isLoading,isEmailValid,isPasswordValid,isFormValid,singleTimeEvent,emailError,passwordError);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, isLoading: $isLoading, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isFormValid: $isFormValid, singleTimeEvent: $singleTimeEvent, emailError: $emailError, passwordError: $passwordError)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, bool isLoading, bool isEmailValid, bool isPasswordValid, bool isFormValid, LoginSingleTimeEvent? singleTimeEvent, String? emailError, String? passwordError
});


@override $LoginSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? isLoading = null,Object? isEmailValid = null,Object? isPasswordValid = null,Object? isFormValid = null,Object? singleTimeEvent = freezed,Object? emailError = freezed,Object? passwordError = freezed,}) {
  return _then(_LoginState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEmailValid: null == isEmailValid ? _self.isEmailValid : isEmailValid // ignore: cast_nullable_to_non_nullable
as bool,isPasswordValid: null == isPasswordValid ? _self.isPasswordValid : isPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as LoginSingleTimeEvent?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $LoginSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}

/// @nodoc
mixin _$LoginSingleTimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginSingleTimeEvent()';
}


}

/// @nodoc
class $LoginSingleTimeEventCopyWith<$Res>  {
$LoginSingleTimeEventCopyWith(LoginSingleTimeEvent _, $Res Function(LoginSingleTimeEvent) __);
}


/// Adds pattern-matching-related methods to [LoginSingleTimeEvent].
extension LoginSingleTimeEventPatterns on LoginSingleTimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NavigateToHome value)?  navigateToHome,TResult Function( _ShowErrorDialog value)?  showErrorDialog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NavigateToHome value)  navigateToHome,required TResult Function( _ShowErrorDialog value)  showErrorDialog,}){
final _that = this;
switch (_that) {
case _NavigateToHome():
return navigateToHome(_that);case _ShowErrorDialog():
return showErrorDialog(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NavigateToHome value)?  navigateToHome,TResult? Function( _ShowErrorDialog value)?  showErrorDialog,}){
final _that = this;
switch (_that) {
case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateToHome,TResult Function( String message)?  showErrorDialog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateToHome,required TResult Function( String message)  showErrorDialog,}) {final _that = this;
switch (_that) {
case _NavigateToHome():
return navigateToHome();case _ShowErrorDialog():
return showErrorDialog(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateToHome,TResult? Function( String message)?  showErrorDialog,}) {final _that = this;
switch (_that) {
case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NavigateToHome implements LoginSingleTimeEvent {
  const _NavigateToHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginSingleTimeEvent.navigateToHome()';
}


}




/// @nodoc


class _ShowErrorDialog implements LoginSingleTimeEvent {
  const _ShowErrorDialog(this.message);
  

 final  String message;

/// Create a copy of LoginSingleTimeEvent
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
  return 'LoginSingleTimeEvent.showErrorDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorDialogCopyWith<$Res> implements $LoginSingleTimeEventCopyWith<$Res> {
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

/// Create a copy of LoginSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowErrorDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
