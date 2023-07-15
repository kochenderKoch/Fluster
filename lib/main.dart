import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';
import 'providers/auth_provider.dart';
import 'providers/settings_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SettingsProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch();
    SettingsProvider settingsProvider = context.watch();
    return MaterialApp(
      title: 'AppWrite Example',
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
      home: !authProvider.isAuthenticated
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
