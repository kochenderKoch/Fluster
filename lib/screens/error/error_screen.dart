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
        child: Text('ErrorScreeen: ${exception?.message}'),
      ),
    );
  }
}
