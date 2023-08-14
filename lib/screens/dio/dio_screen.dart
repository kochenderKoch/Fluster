import 'package:fluster/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// This [DioExampleScreen] is visible when opening the Dio tab
/// from the MainScaffold
///
/// It displays ....
class DioExampleScreen extends StatelessWidget {
  /// Constructor of [DioExampleScreen]
  const DioExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dioProvider = context.watch<DioProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: dioProvider.getModels,
          child: const Text('GET Kontests'),
        ),
        ElevatedButton(
          onPressed: () {
            context.push(
              '/dio/logs',
              extra: dioProvider.loggingProvider.talker,
            );
          },
          child: const Text(
            'Open Logs',
          ),
        ),
      ],
    );
  }
}
