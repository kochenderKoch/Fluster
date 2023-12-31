import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:fluster/config/routes.dart';
import 'package:fluster/l10n/l10n.dart';
import 'package:fluster/providers/auth_provider.dart';
import 'package:fluster/providers/dio_provider.dart';
import 'package:fluster/providers/logging_provider.dart';
import 'package:fluster/providers/settings_provider.dart';
import 'package:fluster/providers/text_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

void main() async {
  if (kIsWeb) {
    await Isar.initialize();
  }
  runApp(
    ShowCaseWidget(
      autoPlay: true,
      autoPlayDelay: const Duration(seconds: 5),
      builder: Builder(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => LoggingProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => TextProvider(),
            ),
            ChangeNotifierProxyProvider<LoggingProvider, DioProvider>(
              create: (context) => DioProvider(
                context.read<LoggingProvider>(),
              ),
              update: (context, value, previous) {
                previous?.setLoggingProvider(value);
                return previous ?? DioProvider(value);
              },
            ),
            ChangeNotifierProvider(
              create: (_) => SettingsProvider(),
            ),
          ],
          child: const FlusterApp(),
        ),
      ),
    ),
  );
}

/// Creates a [FlusterApp] as root of the application
class FlusterApp extends StatelessWidget {
  /// Constructor of [FlusterApp]
  const FlusterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    return MaterialApp.router(
      title: 'Fluster Application',
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.all,
      locale: settingsProvider.appLocal,
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: settingsProvider.theme,
        appBarElevation: 2,
        useMaterial3: true,
        typography: Typography.material2021(platform: TargetPlatform.windows),
      ),
      darkTheme: FlexThemeData.dark(
        scheme: settingsProvider.theme,
        appBarElevation: 2,
        useMaterial3: true,
        typography: Typography.material2021(platform: TargetPlatform.windows),
      ),
      themeMode: settingsProvider.themeMode,
      routerConfig: router,
    );
  }
}
