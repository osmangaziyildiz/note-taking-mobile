// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent()';
}


}

/// @nodoc
class $RegisterEventCopyWith<$Res>  {
$RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}


/// Adds pattern-matching-related methods to [RegisterEvent].
extension RegisterEventPatterns on RegisterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NameChanged value)?  nameChanged,TResult Function( _EmailChanged value)?  emailChanged,TResult Function( _PasswordChanged value)?  passwordChanged,TResult Function( _ConfirmPasswordChanged value)?  confirmPasswordChanged,TResult Function( _SubmitPressed value)?  submitPressed,TResult Function( _SignInWithGooglePressed value)?  signInWithGooglePressed,TResult Function( _SendEmailVerification value)?  sendEmailVerification,TResult Function( _CheckEmailVerification value)?  checkEmailVerification,TResult Function( _ClearForm value)?  clearForm,TResult Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case _SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification(_that);case _CheckEmailVerification() when checkEmailVerification != null:
return checkEmailVerification(_that);case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NameChanged value)  nameChanged,required TResult Function( _EmailChanged value)  emailChanged,required TResult Function( _PasswordChanged value)  passwordChanged,required TResult Function( _ConfirmPasswordChanged value)  confirmPasswordChanged,required TResult Function( _SubmitPressed value)  submitPressed,required TResult Function( _SignInWithGooglePressed value)  signInWithGooglePressed,required TResult Function( _SendEmailVerification value)  sendEmailVerification,required TResult Function( _CheckEmailVerification value)  checkEmailVerification,required TResult Function( _ClearForm value)  clearForm,required TResult Function( _ClearSingleTimeEvent value)  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _NameChanged():
return nameChanged(_that);case _EmailChanged():
return emailChanged(_that);case _PasswordChanged():
return passwordChanged(_that);case _ConfirmPasswordChanged():
return confirmPasswordChanged(_that);case _SubmitPressed():
return submitPressed(_that);case _SignInWithGooglePressed():
return signInWithGooglePressed(_that);case _SendEmailVerification():
return sendEmailVerification(_that);case _CheckEmailVerification():
return checkEmailVerification(_that);case _ClearForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NameChanged value)?  nameChanged,TResult? Function( _EmailChanged value)?  emailChanged,TResult? Function( _PasswordChanged value)?  passwordChanged,TResult? Function( _ConfirmPasswordChanged value)?  confirmPasswordChanged,TResult? Function( _SubmitPressed value)?  submitPressed,TResult? Function( _SignInWithGooglePressed value)?  signInWithGooglePressed,TResult? Function( _SendEmailVerification value)?  sendEmailVerification,TResult? Function( _CheckEmailVerification value)?  checkEmailVerification,TResult? Function( _ClearForm value)?  clearForm,TResult? Function( _ClearSingleTimeEvent value)?  clearSingleTimeEvent,}){
final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that);case _EmailChanged() when emailChanged != null:
return emailChanged(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case _SubmitPressed() when submitPressed != null:
return submitPressed(_that);case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed(_that);case _SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification(_that);case _CheckEmailVerification() when checkEmailVerification != null:
return checkEmailVerification(_that);case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  nameChanged,TResult Function( String email)?  emailChanged,TResult Function( String password)?  passwordChanged,TResult Function( String confirmPassword)?  confirmPasswordChanged,TResult Function()?  submitPressed,TResult Function()?  signInWithGooglePressed,TResult Function()?  sendEmailVerification,TResult Function()?  checkEmailVerification,TResult Function()?  clearForm,TResult Function()?  clearSingleTimeEvent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.confirmPassword);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case _SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification();case _CheckEmailVerification() when checkEmailVerification != null:
return checkEmailVerification();case _ClearForm() when clearForm != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  nameChanged,required TResult Function( String email)  emailChanged,required TResult Function( String password)  passwordChanged,required TResult Function( String confirmPassword)  confirmPasswordChanged,required TResult Function()  submitPressed,required TResult Function()  signInWithGooglePressed,required TResult Function()  sendEmailVerification,required TResult Function()  checkEmailVerification,required TResult Function()  clearForm,required TResult Function()  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _NameChanged():
return nameChanged(_that.name);case _EmailChanged():
return emailChanged(_that.email);case _PasswordChanged():
return passwordChanged(_that.password);case _ConfirmPasswordChanged():
return confirmPasswordChanged(_that.confirmPassword);case _SubmitPressed():
return submitPressed();case _SignInWithGooglePressed():
return signInWithGooglePressed();case _SendEmailVerification():
return sendEmailVerification();case _CheckEmailVerification():
return checkEmailVerification();case _ClearForm():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  nameChanged,TResult? Function( String email)?  emailChanged,TResult? Function( String password)?  passwordChanged,TResult? Function( String confirmPassword)?  confirmPasswordChanged,TResult? Function()?  submitPressed,TResult? Function()?  signInWithGooglePressed,TResult? Function()?  sendEmailVerification,TResult? Function()?  checkEmailVerification,TResult? Function()?  clearForm,TResult? Function()?  clearSingleTimeEvent,}) {final _that = this;
switch (_that) {
case _NameChanged() when nameChanged != null:
return nameChanged(_that.name);case _EmailChanged() when emailChanged != null:
return emailChanged(_that.email);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that.password);case _ConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.confirmPassword);case _SubmitPressed() when submitPressed != null:
return submitPressed();case _SignInWithGooglePressed() when signInWithGooglePressed != null:
return signInWithGooglePressed();case _SendEmailVerification() when sendEmailVerification != null:
return sendEmailVerification();case _CheckEmailVerification() when checkEmailVerification != null:
return checkEmailVerification();case _ClearForm() when clearForm != null:
return clearForm();case _ClearSingleTimeEvent() when clearSingleTimeEvent != null:
return clearSingleTimeEvent();case _:
  return null;

}
}

}

/// @nodoc


class _NameChanged implements RegisterEvent {
  const _NameChanged(this.name);
  

 final  String name;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameChangedCopyWith<_NameChanged> get copyWith => __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameChanged&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'RegisterEvent.nameChanged(name: $name)';
}


}

/// @nodoc
abstract mixin class _$NameChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) _then) = __$NameChangedCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(this._self, this._then);

  final _NameChanged _self;
  final $Res Function(_NameChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_NameChanged(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmailChanged implements RegisterEvent {
  const _EmailChanged(this.email);
  

 final  String email;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.emailChanged(email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_EmailChanged(
null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PasswordChanged implements RegisterEvent {
  const _PasswordChanged(this.password);
  

 final  String password;

/// Create a copy of RegisterEvent
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
  return 'RegisterEvent.passwordChanged(password: $password)';
}


}

/// @nodoc
abstract mixin class _$PasswordChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
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

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? password = null,}) {
  return _then(_PasswordChanged(
null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ConfirmPasswordChanged implements RegisterEvent {
  const _ConfirmPasswordChanged(this.confirmPassword);
  

 final  String confirmPassword;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmPasswordChangedCopyWith<_ConfirmPasswordChanged> get copyWith => __$ConfirmPasswordChangedCopyWithImpl<_ConfirmPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmPasswordChanged&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword));
}


@override
int get hashCode => Object.hash(runtimeType,confirmPassword);

@override
String toString() {
  return 'RegisterEvent.confirmPasswordChanged(confirmPassword: $confirmPassword)';
}


}

/// @nodoc
abstract mixin class _$ConfirmPasswordChangedCopyWith<$Res> implements $RegisterEventCopyWith<$Res> {
  factory _$ConfirmPasswordChangedCopyWith(_ConfirmPasswordChanged value, $Res Function(_ConfirmPasswordChanged) _then) = __$ConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String confirmPassword
});




}
/// @nodoc
class __$ConfirmPasswordChangedCopyWithImpl<$Res>
    implements _$ConfirmPasswordChangedCopyWith<$Res> {
  __$ConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final _ConfirmPasswordChanged _self;
  final $Res Function(_ConfirmPasswordChanged) _then;

/// Create a copy of RegisterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? confirmPassword = null,}) {
  return _then(_ConfirmPasswordChanged(
null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmitPressed implements RegisterEvent {
  const _SubmitPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.submitPressed()';
}


}




/// @nodoc


class _SignInWithGooglePressed implements RegisterEvent {
  const _SignInWithGooglePressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInWithGooglePressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.signInWithGooglePressed()';
}


}




/// @nodoc


class _SendEmailVerification implements RegisterEvent {
  const _SendEmailVerification();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendEmailVerification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.sendEmailVerification()';
}


}




/// @nodoc


class _CheckEmailVerification implements RegisterEvent {
  const _CheckEmailVerification();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckEmailVerification);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.checkEmailVerification()';
}


}




/// @nodoc


class _ClearForm implements RegisterEvent {
  const _ClearForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.clearForm()';
}


}




/// @nodoc


class _ClearSingleTimeEvent implements RegisterEvent {
  const _ClearSingleTimeEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearSingleTimeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegisterEvent.clearSingleTimeEvent()';
}


}




// dart format on
