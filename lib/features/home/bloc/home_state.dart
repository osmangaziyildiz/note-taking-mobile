import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notetakingapp/core/models/note_model.dart';
import 'package:notetakingapp/features/home/widgets/home_note_filters.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<NoteModel> notes,
    @Default(false) bool isLoading,
    String? error,
    @Default(NoteFilter.all) NoteFilter selectedFilter,
  }) = _HomeState;
}
