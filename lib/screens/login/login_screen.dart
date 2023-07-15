import 'package:flutter/material.dart';

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
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
                    child: Text("Login"),
                  ),
                  CustomTextField(
                    controller: controllerUsername,
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Username",
                  ),
                  CustomTextField(
                    controller: controllerPassword,
                    obscureText: true,
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Passwort",
                  ),
                  ElevatedButton(
                      // style: ButtonStyle(
                      //     backgroundColor: MaterialStatePropertyAll(
                      //         themeProvider.getTheme().colorScheme.onSecondary)),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text("Login"),
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
