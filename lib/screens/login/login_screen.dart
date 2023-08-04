import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
    // TODO: implement dispose
    controllerUsername.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50),
                    child: Text(AppLocalizations.of(context)!.login),
                  ),
                  CustomTextField(
                    controller: controllerUsername,
                    prefixIcon: const Icon(Icons.person),
                    hintText: AppLocalizations.of(context)!.username,
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
                      //         themeProvider.getTheme().colorScheme.onSecondary)),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(AppLocalizations.of(context)!.loginButton),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
