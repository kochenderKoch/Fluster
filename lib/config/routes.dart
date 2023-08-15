import 'package:fluster/providers/auth_provider.dart';
import 'package:fluster/screens/dio/dio_screen.dart';
import 'package:fluster/screens/error/error_screen.dart';
import 'package:fluster/screens/home/home_screnn.dart';
import 'package:fluster/screens/isar_example/isar_example_screen.dart';
import 'package:fluster/screens/login/login_screen.dart';
import 'package:fluster/screens/main_scaffold.dart';
import 'package:fluster/screens/settings/settings_screen.dart';
import 'package:fluster/screens/splash/lottie_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey1 = GlobalKey<NavigatorState>();
final _sectionNavigatorKey2 = GlobalKey<NavigatorState>();
final _sectionNavigatorKey3 = GlobalKey<NavigatorState>();
final _sectionNavigatorKey4 = GlobalKey<NavigatorState>();

/// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  errorBuilder: (context, state) => ErrorScreen(state.error),
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      redirect: handleAuthentication,
      path: '/dio/logs',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        final talker = state.extra! as Talker;
        return TalkerScreen(
          talker: talker,
          theme: TalkerScreenTheme(
            backgroundColor: Theme.of(context).colorScheme.background,
            textColor: Theme.of(context).colorScheme.onBackground,
          ),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey1,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey2,
          routes: <RouteBase>[
            GoRoute(
              redirect: handleAuthentication,
              path: '/text',
              builder: (context, state) => IsarExampleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey3,
          routes: <RouteBase>[
            GoRoute(
              redirect: handleAuthentication,
              path: '/dio',
              builder: (context, state) => const DioExampleScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey4,
          routes: <RouteBase>[
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
            GoRoute(
              path: '/settings/opensource',
              builder: (context, state) => IsarExampleScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Check wether the User is logged in and authorized to see the screen
String? handleAuthentication(BuildContext context, GoRouterState state) {
  final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
  if (!isAuthenticated) {
    return '/login';
  } else {
    return null;
  }
}
