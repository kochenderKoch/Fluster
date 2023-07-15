import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../providers/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = context.watch();
    return Scaffold(
        body: Center(
      child: SettingsList(
        lightTheme: SettingsThemeData(
            settingsSectionBackground: Theme.of(context).hoverColor,
            settingsListBackground: Theme.of(context).colorScheme.background),
        darkTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).colorScheme.background),
        sections: [
          SettingsSection(
            title: Text(AppLocalizations.of(context)!.generalSettings),
            tiles: [
              SettingsTile(
                leading: const Icon(Icons.color_lens),
                title: Text(AppLocalizations.of(context)!.themeMode),
                value: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      switch (index) {
                        case 0:
                          settings.changeThemeMode(ThemeMode.light);
                          break;
                        case 1:
                          settings.changeThemeMode(ThemeMode.dark);
                          break;
                        case 2:
                          settings.changeThemeMode(ThemeMode.system);
                          break;
                      }
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    selectedBorderColor: Colors.blue[700],
                    selectedColor: Colors.white,
                    fillColor: Colors.blue[200],
                    color: Colors.blue[400],
                    isSelected: [
                      settings.themeMode == ThemeMode.light,
                      settings.themeMode == ThemeMode.dark,
                      settings.themeMode == ThemeMode.system
                    ],
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.light_mode,
                            size: 15,
                          ),
                          Text(" ${AppLocalizations.of(context)!.lightMode} ")
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.dark_mode,
                            size: 15,
                          ),
                          Text(" ${AppLocalizations.of(context)!.darkMode} ")
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.settings_system_daydream,
                            size: 15,
                          ),
                          Text(" ${AppLocalizations.of(context)!.systemMode} ")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SettingsTile(
                leading: const Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.colorSchema),
                value: DropdownButton<String>(
                  value: settings.theme.name,
                  onChanged: (String? value) {
                    settings.changeSchema(FlexScheme.values
                        .firstWhere((element) => element.name == value));
                  },
                  items: FlexScheme.values
                      .map((e) => e.name)
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SettingsTile(
                leading: const Icon(Icons.language),
                title: Text(AppLocalizations.of(context)!.language),
                value: DropdownButton<String>(
                  value: settings.appLocal.languageCode,
                  onChanged: (String? value) {
                    debugPrint(value);
                    (value == "de")
                        ? settings.changeLanguage(
                            const Locale("de"),
                          )
                        : settings.changeLanguage(
                            const Locale("en"),
                          );
                  },
                  items: ["en", "de"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SettingsSection(
            title: Text(AppLocalizations.of(context)!.otherSettings),
            tiles: [
              SettingsTile.navigation(
                title: Text(AppLocalizations.of(context)!.openSource),
                onPressed: (context) {},
                trailing: const Icon(Icons.arrow_right),
              ),
              SettingsTile.navigation(
                title: Text(AppLocalizations.of(context)!.privacy_policy),
                onPressed: (context) {},
                trailing: const Icon(Icons.arrow_right),
              ),
              SettingsTile.navigation(
                title: Text(AppLocalizations.of(context)!.about),
                onPressed: (context) {},
                trailing: const Icon(Icons.arrow_right),
              ),
            ],
          ),
          SettingsSection(tiles: [
            SettingsTile(
              title: Text(AppLocalizations.of(context)!.aboutThisApp),
              description: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _packageInfo.appName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Text(
                      "App-Version: ${_packageInfo.version}, Build-Version: ${_packageInfo.buildNumber}"),

                  //Text("Build-Signature: ${_packageInfo.buildSignature}"),
                  Text("Developed by kochenderKoch")
                ],
              ),
            ),
          ])
        ],
      ),
    ));
  }
}
