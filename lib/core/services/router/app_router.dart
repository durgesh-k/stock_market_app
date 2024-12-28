import 'package:go_router/go_router.dart';
import 'package:stock_market_app/core/services/router/app_routes.dart';
import 'package:stock_market_app/presentation/screens/home/home_screen.dart';
import 'package:stock_market_app/presentation/screens/other/welcome_screen.dart';
import 'package:stock_market_app/presentation/screens/voice_calling/voice_call_screen.dart';

abstract class AppRouter {
  static GoRouter goRouter =
      GoRouter(initialLocation: AppRoutes.welcome.path, routes: [
    GoRoute(
      path: AppRoutes.welcome.path,
      name: AppRoutes.welcome.name,
      builder: (context, state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.home.path,
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: AppRoutes.voiceCall.path,
            name: AppRoutes.voiceCall.name,
            builder: (context, state) => const VoiceCallScreen())
      ],
    ),
  ]);
}
