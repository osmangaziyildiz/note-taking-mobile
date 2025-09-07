// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiState()';
}


}

/// @nodoc
class $AiStateCopyWith<$Res>  {
$AiStateCopyWith(AiState _, $Res Function(AiState) __);
}


/// Adds pattern-matching-related methods to [AiState].
extension AiStatePatterns on AiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _ResponseReceived value)?  responseReceived,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ResponseReceived() when responseReceived != null:
return responseReceived(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _ResponseReceived value)  responseReceived,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _ResponseReceived():
return responseReceived(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _ResponseReceived value)?  responseReceived,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _ResponseReceived() when responseReceived != null:
return responseReceived(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String response,  List<Map<String, String>> chatHistory)?  responseReceived,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ResponseReceived() when responseReceived != null:
return responseReceived(_that.response,_that.chatHistory);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String response,  List<Map<String, String>> chatHistory)  responseReceived,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _ResponseReceived():
return responseReceived(_that.response,_that.chatHistory);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String response,  List<Map<String, String>> chatHistory)?  responseReceived,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _ResponseReceived() when responseReceived != null:
return responseReceived(_that.response,_that.chatHistory);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AiState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiState.initial()';
}


}




/// @nodoc


class _Loading implements AiState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiState.loading()';
}


}




/// @nodoc


class _ResponseReceived implements AiState {
  const _ResponseReceived({required this.response, required final  List<Map<String, String>> chatHistory}): _chatHistory = chatHistory;
  

 final  String response;
 final  List<Map<String, String>> _chatHistory;
 List<Map<String, String>> get chatHistory {
  if (_chatHistory is EqualUnmodifiableListView) return _chatHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatHistory);
}


/// Create a copy of AiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseReceivedCopyWith<_ResponseReceived> get copyWith => __$ResponseReceivedCopyWithImpl<_ResponseReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResponseReceived&&(identical(other.response, response) || other.response == response)&&const DeepCollectionEquality().equals(other._chatHistory, _chatHistory));
}


@override
int get hashCode => Object.hash(runtimeType,response,const DeepCollectionEquality().hash(_chatHistory));

@override
String toString() {
  return 'AiState.responseReceived(response: $response, chatHistory: $chatHistory)';
}


}

/// @nodoc
abstract mixin class _$ResponseReceivedCopyWith<$Res> implements $AiStateCopyWith<$Res> {
  factory _$ResponseReceivedCopyWith(_ResponseReceived value, $Res Function(_ResponseReceived) _then) = __$ResponseReceivedCopyWithImpl;
@useResult
$Res call({
 String response, List<Map<String, String>> chatHistory
});




}
/// @nodoc
class __$ResponseReceivedCopyWithImpl<$Res>
    implements _$ResponseReceivedCopyWith<$Res> {
  __$ResponseReceivedCopyWithImpl(this._self, this._then);

  final _ResponseReceived _self;
  final $Res Function(_ResponseReceived) _then;

/// Create a copy of AiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,Object? chatHistory = null,}) {
  return _then(_ResponseReceived(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,chatHistory: null == chatHistory ? _self._chatHistory : chatHistory // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

/// @nodoc


class _Error implements AiState {
  const _Error({required this.message});
  

 final  String message;

/// Create a copy of AiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AiState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AiStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
