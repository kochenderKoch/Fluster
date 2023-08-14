import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The [ErrorScreen] is displayed when no route is found
class ErrorScreen extends StatelessWidget {
  /// Constructor of [ErrorScreen]
  const ErrorScreen(this.exception, {super.key});

  /// Exception that triggered the [ErrorScreen]
  final GoException? exception;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('ErrorScreeen: ${exception?.message}'),
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              child: const Text('Zurück zu Home'),
            )
          ],
        ),
      ),
    );
  }
}
