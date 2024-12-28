class AppRoute {
  final String path;
  final String name;

  AppRoute({required this.path, required this.name});
}

abstract class AppRoutes {
  /// Welcome
  static final welcome = AppRoute(path: "/welcome", name: "welcome");

  /// Home
  static final home = AppRoute(path: "/home", name: "home");

  /// Voice
  static final voiceCall = AppRoute(path: "/voice-call", name: "voice-call");
}
