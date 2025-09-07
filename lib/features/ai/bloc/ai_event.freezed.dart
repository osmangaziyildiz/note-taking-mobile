// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiEvent()';
}


}

/// @nodoc
class $AiEventCopyWith<$Res>  {
$AiEventCopyWith(AiEvent _, $Res Function(AiEvent) __);
}


/// Adds pattern-matching-related methods to [AiEvent].
extension AiEventPatterns on AiEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AskQuestion value)?  askQuestion,TResult Function( _ClearResponse value)?  clearResponse,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AskQuestion() when askQuestion != null:
return askQuestion(_that);case _ClearResponse() when clearResponse != null:
return clearResponse(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AskQuestion value)  askQuestion,required TResult Function( _ClearResponse value)  clearResponse,}){
final _that = this;
switch (_that) {
case _AskQuestion():
return askQuestion(_that);case _ClearResponse():
return clearResponse(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AskQuestion value)?  askQuestion,TResult? Function( _ClearResponse value)?  clearResponse,}){
final _that = this;
switch (_that) {
case _AskQuestion() when askQuestion != null:
return askQuestion(_that);case _ClearResponse() when clearResponse != null:
return clearResponse(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String question)?  askQuestion,TResult Function()?  clearResponse,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AskQuestion() when askQuestion != null:
return askQuestion(_that.question);case _ClearResponse() when clearResponse != null:
return clearResponse();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String question)  askQuestion,required TResult Function()  clearResponse,}) {final _that = this;
switch (_that) {
case _AskQuestion():
return askQuestion(_that.question);case _ClearResponse():
return clearResponse();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String question)?  askQuestion,TResult? Function()?  clearResponse,}) {final _that = this;
switch (_that) {
case _AskQuestion() when askQuestion != null:
return askQuestion(_that.question);case _ClearResponse() when clearResponse != null:
return clearResponse();case _:
  return null;

}
}

}

/// @nodoc


class _AskQuestion implements AiEvent {
  const _AskQuestion({required this.question});
  

 final  String question;

/// Create a copy of AiEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AskQuestionCopyWith<_AskQuestion> get copyWith => __$AskQuestionCopyWithImpl<_AskQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AskQuestion&&(identical(other.question, question) || other.question == question));
}


@override
int get hashCode => Object.hash(runtimeType,question);

@override
String toString() {
  return 'AiEvent.askQuestion(question: $question)';
}


}

/// @nodoc
abstract mixin class _$AskQuestionCopyWith<$Res> implements $AiEventCopyWith<$Res> {
  factory _$AskQuestionCopyWith(_AskQuestion value, $Res Function(_AskQuestion) _then) = __$AskQuestionCopyWithImpl;
@useResult
$Res call({
 String question
});




}
/// @nodoc
class __$AskQuestionCopyWithImpl<$Res>
    implements _$AskQuestionCopyWith<$Res> {
  __$AskQuestionCopyWithImpl(this._self, this._then);

  final _AskQuestion _self;
  final $Res Function(_AskQuestion) _then;

/// Create a copy of AiEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? question = null,}) {
  return _then(_AskQuestion(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClearResponse implements AiEvent {
  const _ClearResponse();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearResponse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AiEvent.clearResponse()';
}


}




// dart format on
