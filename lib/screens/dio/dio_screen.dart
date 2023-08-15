import 'dart:math';

import 'package:fluster/providers/dio_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
    final random = Random();
    return TalkerWrapper(
      talker: dioProvider.loggingProvider.talker,
      options: const TalkerWrapperOptions(
        enableErrorAlerts: true,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (dioProvider.models.isEmpty)
            const SizedBox.shrink()
          else
            Column(
              children: [
                Text(
                  dioProvider
                      .models[random.nextInt(dioProvider.models.length)].name,
                ),
                Text(
                  dioProvider.models[random.nextInt(dioProvider.models.length)]
                      .duration,
                ),
                Text(
                  dioProvider.models[random.nextInt(dioProvider.models.length)]
                      .startTime,
                ),
                Text(
                  dioProvider.models[random.nextInt(dioProvider.models.length)]
                      .endTime,
                ),
                Text(
                  dioProvider.models[random.nextInt(dioProvider.models.length)]
                      .in24Hours,
                ),
                Text(
                  dioProvider
                      .models[random.nextInt(dioProvider.models.length)].site,
                ),
                Text(
                  dioProvider
                      .models[random.nextInt(dioProvider.models.length)].status,
                ),
                Text(
                  dioProvider
                      .models[random.nextInt(dioProvider.models.length)].url,
                ),
              ],
            ),
          Row(
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
          )
        ],
      ),
    );
  }
}
