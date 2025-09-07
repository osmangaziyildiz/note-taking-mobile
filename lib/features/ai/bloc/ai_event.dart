import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_event.freezed.dart';

@freezed
abstract class AiEvent with _$AiEvent {
  const factory AiEvent.askQuestion({
    required String question,
  }) = _AskQuestion;
  
  const factory AiEvent.clearResponse() = _ClearResponse;
}
