// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [EmailVerificationScreen]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
    : super(EmailVerificationRoute.name, initialChildren: children);

  static const String name = 'EmailVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmailVerificationScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [NoteCreateScreen]
class NoteCreateRoute extends PageRouteInfo<void> {
  const NoteCreateRoute({List<PageRouteInfo>? children})
    : super(NoteCreateRoute.name, initialChildren: children);

  static const String name = 'NoteCreateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoteCreateScreen();
    },
  );
}

/// generated route for
/// [NoteEditScreen]
class NoteEditRoute extends PageRouteInfo<NoteEditRouteArgs> {
  NoteEditRoute({
    required String noteId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         NoteEditRoute.name,
         args: NoteEditRouteArgs(noteId: noteId, key: key),
         initialChildren: children,
       );

  static const String name = 'NoteEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteEditRouteArgs>();
      return NoteEditScreen(noteId: args.noteId, key: args.key);
    },
  );
}

class NoteEditRouteArgs {
  const NoteEditRouteArgs({required this.noteId, this.key});

  final String noteId;

  final Key? key;

  @override
  String toString() {
    return 'NoteEditRouteArgs{noteId: $noteId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NoteEditRouteArgs) return false;
    return noteId == other.noteId && key == other.key;
  }

  @override
  int get hashCode => noteId.hashCode ^ key.hashCode;
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
