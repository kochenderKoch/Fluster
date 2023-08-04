import 'package:fluster/providers/text_provider.dart';
import 'package:fluster/screens/isar_example/isar_example_screen.dart';
import 'package:fluster/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings/settings_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  var _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextProvider textProvider = context.watch();
    return Scaffold(
      appBar: AppBar(
        actions: [
          _selectedIndex == 1
              ? IconButton(
                  onPressed: () {
                    textProvider.getTexts();
                  },
                  icon: const Icon(Icons.refresh),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: [
        const LoginScreen(),
        IsarExampleScreen(),
        const SettingsScreen(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.login),
            label: AppLocalizations.of(context)!.login,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
