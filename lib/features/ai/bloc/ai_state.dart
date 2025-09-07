import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_state.freezed.dart';

@freezed
abstract class AiState with _$AiState {
  const factory AiState.initial() = _Initial;
  
  const factory AiState.loading() = _Loading;
  
  const factory AiState.responseReceived({
    required String response,
    required List<Map<String, String>> chatHistory,
  }) = _ResponseReceived;
  
  const factory AiState.error({
    required String message,
  }) = _Error;
}
