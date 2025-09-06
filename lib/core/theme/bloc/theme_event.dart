part of 'theme_bloc.dart';

@freezed
abstract class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.changed(ThemeMode themeMode) = _ThemeChanged;
  const factory ThemeEvent.loaded(ThemeMode themeMode) = _ThemeLoaded;
}
