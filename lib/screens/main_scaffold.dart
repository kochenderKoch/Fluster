import 'package:fluster/providers/text_provider.dart';
import 'package:fluster/screens/isar_example/isar_example_screen.dart';
import 'package:fluster/screens/login/login_screen.dart';
import 'package:fluster/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

/// This [MainScaffold] is always visible after sucessfull login.
///
/// It displays the [BottomNavigationBar] to navigate to different Screens
class MainScaffold extends StatefulWidget {
  /// Constructor of [MainScaffold]
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
    final textProvider = context.watch<TextProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_selectedIndex == 1)
            IconButton(
              onPressed: textProvider.getTexts,
              icon: const Icon(Icons.refresh),
            )
          else
            const SizedBox.shrink()
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
