import 'package:fluster/components/custom_text_field.dart';
import 'package:fluster/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

/// This [LoginScreen] is visible when opening application with
/// no authorization set.
///
/// It displays an login prompt for the user to log in.
class LoginScreen extends StatefulWidget {
  /// Constructor of [LoginScreen]
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final GlobalKey _one = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerUsername.addListener(() {});
      controllerPassword.addListener(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 50,
                    ),
                    child: Text(AppLocalizations.of(context)!.login),
                  ),
                  Showcase(
                    key: _one,
                    description: 'Test',
                    child: CustomTextField(
                      controller: controllerUsername,
                      prefixIcon: const Icon(Icons.person),
                      hintText: AppLocalizations.of(context)!.username,
                    ),
                  ),
                  CustomTextField(
                    controller: controllerPassword,
                    obscureText: true,
                    prefixIcon: const Icon(Icons.password),
                    hintText: AppLocalizations.of(context)!.password,
                  ),
                  ElevatedButton(
                    // style: ButtonStyle(
                    //     backgroundColor: MaterialStatePropertyAll(
                    //         themeProvider.getTheme().colorScheme.
                    // onSecondary)),
                    onPressed: () {
                      authProvider.signIn();
                      if (authProvider.isAuthenticated) {
                        context.go('/home');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(AppLocalizations.of(context)!.loginButton),
                    ),
                  ),
                  ElevatedButton(
                    // style: ButtonStyle(
                    //     backgroundColor: MaterialStatePropertyAll(
                    //         themeProvider.getTheme().colorScheme.
                    // onSecondary)),
                    onPressed: () {
                      ShowCaseWidget.of(context).startShowCase([_one]);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('SHOWCASE'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
