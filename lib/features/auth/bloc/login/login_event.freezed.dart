// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmailChanged value)?  emailChanged,TResult Function( _PasswordChanged value)?  passwordChanged,TResult Function( _SubmitPressed value)?  submitPressed,TResult Function( _SignInWithGooglePressed value)?  signInWithGooglePressed,TResult Function( _ForgotPasswordPressed value)?  forgotPasswordPressed,TResult Function( _ClearForm value)?  clearForm,TResult Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case _ForgotPasswordPressed() when forgotPasswordPressed != null:
return forgotPasswordPressed(_that);case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmailChanged value)  emailChanged,required TResult Function( _PasswordChanged value)  passwordChanged,required TResult Function( _SubmitPressed value)  submitPressed,required TResult Function( _SignInWithGooglePressed value)  signInWithGooglePressed,required TResult Function( _ForgotPasswordPressed value)  forgotPasswordPressed,required TResult Function( _ClearForm value)  clearForm,required TResult Function( _ClearSingleTimeEvent value)  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that);case _PasswordChanged():
return passwordChanged(_that);case _SubmitPressed():
return submitPressed(_that);case _SignInWithGooglePressed():
return signInWithGooglePressed(_that);case _ForgotPasswordPressed():
return forgotPasswordPressed(_that);case _ClearForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmailChanged value)?  emailChanged,TResult? Function( _PasswordChanged value)?  passwordChanged,TResult? Function( _SubmitPressed value)?  submitPressed,TResult? Function( _SignInWithGooglePressed value)?  signInWithGooglePressed,TResult? Function( _ForgotPasswordPressed value)?  forgotPasswordPressed,TResult? Function( _ClearForm value)?  clearForm,TResult? Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case _ForgotPasswordPressed() when forgotPasswordPressed != null:
return forgotPasswordPressed(_that);case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function()?  submitPressed,TResult Function()?  signInWithGooglePressed,TResult Function()?  forgotPasswordPressed,TResult Function()?  clearForm,TResult Function()?  clearSingleTimeEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case _ForgotPasswordPressed() when forgotPasswordPressed != null:
return forgotPasswordPressed();case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function()  submitPressed,required TResult Function()  signInWithGooglePressed,required TResult Function()  forgotPasswordPressed,required TResult Function()  clearForm,required TResult Function()  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _EmailChanged():
return emailChanged(_that.email);case _PasswordChanged():
return passwordChanged(_that.password);case _SubmitPressed():
return submitPressed();case _SignInWithGooglePressed():
return signInWithGooglePressed();case _ForgotPasswordPressed():
return forgotPasswordPressed();case _ClearForm():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function()?  submitPressed,TResult? Function()?  signInWithGooglePressed,TResult? Function()?  forgotPasswordPressed,TResult? Function()?  clearForm,TResult? Function()?  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case _ForgotPasswordPressed() when forgotPasswordPressed != null:
return forgotPasswordPressed();case _ClearForm() when clearForm != null:
return clearForm();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent();case _:
  return null;

}
}

}

/// @nodoc


class _EmailChanged implements LoginEvent {
  const _EmailChanged(this.email);
  

 final  String email;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailChangedCopyWith<_EmailChanged> get copyWith => __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailChanged&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'LoginEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$EmailChangedCopyWith(_EmailChanged value, $Res Function(_EmailChanged) _then) = __$EmailChangedCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class __$EmailChangedCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(this._self, this._then);

  final _EmailChanged _self;
  final $Res Function(_EmailChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PasswordChanged implements LoginEvent {
  const _PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordChangedCopyWith<_PasswordChanged> get copyWith => __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordChanged&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,password);

@override
String toString() {
  return 'LoginEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class _$PasswordChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(_PasswordChanged value, $Res Function(_PasswordChanged) _then) = __$PasswordChangedCopyWithImpl;
@useResult
$Res call({
 String password
});




}
/// @nodoc
class __$PasswordChangedCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(this._self, this._then);

  final _PasswordChanged _self;
  final $Res Function(_PasswordChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitPressed implements LoginEvent {
  const _SubmitPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.submitPressed()';
}


}




/// @nodoc


class _SignInWithGooglePressed implements LoginEvent {
  const _SignInWithGooglePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithGooglePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.signInWithGooglePressed()';
}


}




/// @nodoc


class _ForgotPasswordPressed implements LoginEvent {
  const _ForgotPasswordPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.forgotPasswordPressed()';
}


}




/// @nodoc


class _ClearForm implements LoginEvent {
  const _ClearForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.clearForm()';
}


}




/// @nodoc


class _ClearSingleTimeEvent implements LoginEvent {
  const _ClearSingleTimeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.clearSingleTimeEvent()';
}


}




// dart format on
