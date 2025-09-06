// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterState {

 String get name; String get email; String get password; String get confirmPassword; bool get isNameValid; bool get isEmailValid; bool get isPasswordValid; bool get isConfirmPasswordValid; bool get isFormValid; bool get isLoading; bool get isEmailVerificationSent; bool get isEmailVerified; String? get nameError; String? get emailError; String? get passwordError; String? get confirmPasswordError; RegisterSingleTimeEvent? get singleTimeEvent;
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterStateCopyWith<RegisterState> get copyWith => _$RegisterStateCopyWithImpl<RegisterState>(this as RegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isNameValid, isNameValid) || other.isNameValid == isNameValid)&&(identical(other.isEmailValid, isEmailValid) || other.isEmailValid == isEmailValid)&&(identical(other.isPasswordValid, isPasswordValid) || other.isPasswordValid == isPasswordValid)&&(identical(other.isConfirmPasswordValid, isConfirmPasswordValid) || other.isConfirmPasswordValid == isConfirmPasswordValid)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEmailVerificationSent, isEmailVerificationSent) || other.isEmailVerificationSent == isEmailVerificationSent)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword,isNameValid,isEmailValid,isPasswordValid,isConfirmPasswordValid,isFormValid,isLoading,isEmailVerificationSent,isEmailVerified,nameError,emailError,passwordError,confirmPasswordError,singleTimeEvent);

@override
String toString() {
  return 'RegisterState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isNameValid: $isNameValid, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid, isFormValid: $isFormValid, isLoading: $isLoading, isEmailVerificationSent: $isEmailVerificationSent, isEmailVerified: $isEmailVerified, nameError: $nameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res>  {
  factory $RegisterStateCopyWith(RegisterState value, $Res Function(RegisterState) _then) = _$RegisterStateCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password, String confirmPassword, bool isNameValid, bool isEmailValid, bool isPasswordValid, bool isConfirmPasswordValid, bool isFormValid, bool isLoading, bool isEmailVerificationSent, bool isEmailVerified, String? nameError, String? emailError, String? passwordError, String? confirmPasswordError, RegisterSingleTimeEvent? singleTimeEvent
});


$RegisterSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isNameValid = null,Object? isEmailValid = null,Object? isPasswordValid = null,Object? isConfirmPasswordValid = null,Object? isFormValid = null,Object? isLoading = null,Object? isEmailVerificationSent = null,Object? isEmailVerified = null,Object? nameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? singleTimeEvent = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isNameValid: null == isNameValid ? _self.isNameValid : isNameValid // ignore: cast_nullable_to_non_nullable
as bool,isEmailValid: null == isEmailValid ? _self.isEmailValid : isEmailValid // ignore: cast_nullable_to_non_nullable
as bool,isPasswordValid: null == isPasswordValid ? _self.isPasswordValid : isPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordValid: null == isConfirmPasswordValid ? _self.isConfirmPasswordValid : isConfirmPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerificationSent: null == isEmailVerificationSent ? _self.isEmailVerificationSent : isEmailVerificationSent // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as RegisterSingleTimeEvent?,
  ));
}
/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $RegisterSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterState].
extension RegisterStatePatterns on RegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterState value)  $default,){
final _that = this;
switch (_that) {
case _RegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  bool isNameValid,  bool isEmailValid,  bool isPasswordValid,  bool isConfirmPasswordValid,  bool isFormValid,  bool isLoading,  bool isEmailVerificationSent,  bool isEmailVerified,  String? nameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  RegisterSingleTimeEvent? singleTimeEvent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isNameValid,_that.isEmailValid,_that.isPasswordValid,_that.isConfirmPasswordValid,_that.isFormValid,_that.isLoading,_that.isEmailVerificationSent,_that.isEmailVerified,_that.nameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  bool isNameValid,  bool isEmailValid,  bool isPasswordValid,  bool isConfirmPasswordValid,  bool isFormValid,  bool isLoading,  bool isEmailVerificationSent,  bool isEmailVerified,  String? nameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  RegisterSingleTimeEvent? singleTimeEvent)  $default,) {final _that = this;
switch (_that) {
case _RegisterState():
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isNameValid,_that.isEmailValid,_that.isPasswordValid,_that.isConfirmPasswordValid,_that.isFormValid,_that.isLoading,_that.isEmailVerificationSent,_that.isEmailVerified,_that.nameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.singleTimeEvent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password,  String confirmPassword,  bool isNameValid,  bool isEmailValid,  bool isPasswordValid,  bool isConfirmPasswordValid,  bool isFormValid,  bool isLoading,  bool isEmailVerificationSent,  bool isEmailVerified,  String? nameError,  String? emailError,  String? passwordError,  String? confirmPasswordError,  RegisterSingleTimeEvent? singleTimeEvent)?  $default,) {final _that = this;
switch (_that) {
case _RegisterState() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isNameValid,_that.isEmailValid,_that.isPasswordValid,_that.isConfirmPasswordValid,_that.isFormValid,_that.isLoading,_that.isEmailVerificationSent,_that.isEmailVerified,_that.nameError,_that.emailError,_that.passwordError,_that.confirmPasswordError,_that.singleTimeEvent);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterState implements RegisterState {
  const _RegisterState({this.name = '', this.email = '', this.password = '', this.confirmPassword = '', this.isNameValid = true, this.isEmailValid = false, this.isPasswordValid = false, this.isConfirmPasswordValid = false, this.isFormValid = false, this.isLoading = false, this.isEmailVerificationSent = false, this.isEmailVerified = false, this.nameError, this.emailError, this.passwordError, this.confirmPasswordError, this.singleTimeEvent});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  bool isNameValid;
@override@JsonKey() final  bool isEmailValid;
@override@JsonKey() final  bool isPasswordValid;
@override@JsonKey() final  bool isConfirmPasswordValid;
@override@JsonKey() final  bool isFormValid;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isEmailVerificationSent;
@override@JsonKey() final  bool isEmailVerified;
@override final  String? nameError;
@override final  String? emailError;
@override final  String? passwordError;
@override final  String? confirmPasswordError;
@override final  RegisterSingleTimeEvent? singleTimeEvent;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterStateCopyWith<_RegisterState> get copyWith => __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isNameValid, isNameValid) || other.isNameValid == isNameValid)&&(identical(other.isEmailValid, isEmailValid) || other.isEmailValid == isEmailValid)&&(identical(other.isPasswordValid, isPasswordValid) || other.isPasswordValid == isPasswordValid)&&(identical(other.isConfirmPasswordValid, isConfirmPasswordValid) || other.isConfirmPasswordValid == isConfirmPasswordValid)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEmailVerificationSent, isEmailVerificationSent) || other.isEmailVerificationSent == isEmailVerificationSent)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.confirmPasswordError, confirmPasswordError) || other.confirmPasswordError == confirmPasswordError)&&(identical(other.singleTimeEvent, singleTimeEvent) || other.singleTimeEvent == singleTimeEvent));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword,isNameValid,isEmailValid,isPasswordValid,isConfirmPasswordValid,isFormValid,isLoading,isEmailVerificationSent,isEmailVerified,nameError,emailError,passwordError,confirmPasswordError,singleTimeEvent);

@override
String toString() {
  return 'RegisterState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isNameValid: $isNameValid, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid, isFormValid: $isFormValid, isLoading: $isLoading, isEmailVerificationSent: $isEmailVerificationSent, isEmailVerified: $isEmailVerified, nameError: $nameError, emailError: $emailError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, singleTimeEvent: $singleTimeEvent)';
}


}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res> implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(_RegisterState value, $Res Function(_RegisterState) _then) = __$RegisterStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String confirmPassword, bool isNameValid, bool isEmailValid, bool isPasswordValid, bool isConfirmPasswordValid, bool isFormValid, bool isLoading, bool isEmailVerificationSent, bool isEmailVerified, String? nameError, String? emailError, String? passwordError, String? confirmPasswordError, RegisterSingleTimeEvent? singleTimeEvent
});


@override $RegisterSingleTimeEventCopyWith<$Res>? get singleTimeEvent;

}
/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isNameValid = null,Object? isEmailValid = null,Object? isPasswordValid = null,Object? isConfirmPasswordValid = null,Object? isFormValid = null,Object? isLoading = null,Object? isEmailVerificationSent = null,Object? isEmailVerified = null,Object? nameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? confirmPasswordError = freezed,Object? singleTimeEvent = freezed,}) {
  return _then(_RegisterState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isNameValid: null == isNameValid ? _self.isNameValid : isNameValid // ignore: cast_nullable_to_non_nullable
as bool,isEmailValid: null == isEmailValid ? _self.isEmailValid : isEmailValid // ignore: cast_nullable_to_non_nullable
as bool,isPasswordValid: null == isPasswordValid ? _self.isPasswordValid : isPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordValid: null == isConfirmPasswordValid ? _self.isConfirmPasswordValid : isConfirmPasswordValid // ignore: cast_nullable_to_non_nullable
as bool,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerificationSent: null == isEmailVerificationSent ? _self.isEmailVerificationSent : isEmailVerificationSent // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,confirmPasswordError: freezed == confirmPasswordError ? _self.confirmPasswordError : confirmPasswordError // ignore: cast_nullable_to_non_nullable
as String?,singleTimeEvent: freezed == singleTimeEvent ? _self.singleTimeEvent : singleTimeEvent // ignore: cast_nullable_to_non_nullable
as RegisterSingleTimeEvent?,
  ));
}

/// Create a copy of RegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterSingleTimeEventCopyWith<$Res>? get singleTimeEvent {
    if (_self.singleTimeEvent == null) {
    return null;
  }

  return $RegisterSingleTimeEventCopyWith<$Res>(_self.singleTimeEvent!, (value) {
    return _then(_self.copyWith(singleTimeEvent: value));
  });
}
}

/// @nodoc
mixin _$RegisterSingleTimeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterSingleTimeEvent()';
}


}

/// @nodoc
class $RegisterSingleTimeEventCopyWith<$Res>  {
$RegisterSingleTimeEventCopyWith(RegisterSingleTimeEvent _, $Res Function(RegisterSingleTimeEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterSingleTimeEvent].
extension RegisterSingleTimeEventPatterns on RegisterSingleTimeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowErrorDialog value)?  showErrorDialog,TResult Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult Function( _NavigateToHome value)?  navigateToHome,TResult Function( _NavigateToLogin value)?  navigateToLogin,TResult Function( _NavigateToEmailVerification value)?  navigateToEmailVerification,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _NavigateToEmailVerification() when navigateToEmailVerification != null:
return navigateToEmailVerification(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowErrorDialog value)  showErrorDialog,required TResult Function( _ShowSuccessDialog value)  showSuccessDialog,required TResult Function( _NavigateToHome value)  navigateToHome,required TResult Function( _NavigateToLogin value)  navigateToLogin,required TResult Function( _NavigateToEmailVerification value)  navigateToEmailVerification,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that);case _ShowSuccessDialog():
return showSuccessDialog(_that);case _NavigateToHome():
return navigateToHome(_that);case _NavigateToLogin():
return navigateToLogin(_that);case _NavigateToEmailVerification():
return navigateToEmailVerification(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowErrorDialog value)?  showErrorDialog,TResult? Function( _ShowSuccessDialog value)?  showSuccessDialog,TResult? Function( _NavigateToHome value)?  navigateToHome,TResult? Function( _NavigateToLogin value)?  navigateToLogin,TResult? Function( _NavigateToEmailVerification value)?  navigateToEmailVerification,}){
final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that);case _NavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin(_that);case _NavigateToEmailVerification() when navigateToEmailVerification != null:
return navigateToEmailVerification(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  showErrorDialog,TResult Function( String message)?  showSuccessDialog,TResult Function()?  navigateToHome,TResult Function()?  navigateToLogin,TResult Function()?  navigateToEmailVerification,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case _NavigateToEmailVerification() when navigateToEmailVerification != null:
return navigateToEmailVerification();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  showErrorDialog,required TResult Function( String message)  showSuccessDialog,required TResult Function()  navigateToHome,required TResult Function()  navigateToLogin,required TResult Function()  navigateToEmailVerification,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog():
return showErrorDialog(_that.message);case _ShowSuccessDialog():
return showSuccessDialog(_that.message);case _NavigateToHome():
return navigateToHome();case _NavigateToLogin():
return navigateToLogin();case _NavigateToEmailVerification():
return navigateToEmailVerification();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  showErrorDialog,TResult? Function( String message)?  showSuccessDialog,TResult? Function()?  navigateToHome,TResult? Function()?  navigateToLogin,TResult? Function()?  navigateToEmailVerification,}) {final _that = this;
switch (_that) {
case _ShowErrorDialog() when showErrorDialog != null:
return showErrorDialog(_that.message);case _ShowSuccessDialog() when showSuccessDialog != null:
return showSuccessDialog(_that.message);case _NavigateToHome() when navigateToHome != null:
return navigateToHome();case _NavigateToLogin() when navigateToLogin != null:
return navigateToLogin();case _NavigateToEmailVerification() when navigateToEmailVerification != null:
return navigateToEmailVerification();case _:
  return null;

}
}

}

/// @nodoc


class _ShowErrorDialog implements RegisterSingleTimeEvent {
  const _ShowErrorDialog(this.message);
  

 final  String message;

/// Create a copy of RegisterSingleTimeEvent
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
  return 'RegisterSingleTimeEvent.showErrorDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorDialogCopyWith<$Res> implements $RegisterSingleTimeEventCopyWith<$Res> {
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

/// Create a copy of RegisterSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowErrorDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ShowSuccessDialog implements RegisterSingleTimeEvent {
  const _ShowSuccessDialog(this.message);
  

 final  String message;

/// Create a copy of RegisterSingleTimeEvent
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
  return 'RegisterSingleTimeEvent.showSuccessDialog(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ShowSuccessDialogCopyWith<$Res> implements $RegisterSingleTimeEventCopyWith<$Res> {
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

/// Create a copy of RegisterSingleTimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ShowSuccessDialog(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NavigateToHome implements RegisterSingleTimeEvent {
  const _NavigateToHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterSingleTimeEvent.navigateToHome()';
}


}




/// @nodoc


class _NavigateToLogin implements RegisterSingleTimeEvent {
  const _NavigateToLogin();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToLogin);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterSingleTimeEvent.navigateToLogin()';
}


}




/// @nodoc


class _NavigateToEmailVerification implements RegisterSingleTimeEvent {
  const _NavigateToEmailVerification();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigateToEmailVerification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterSingleTimeEvent.navigateToEmailVerification()';
}


}




// dart format on
