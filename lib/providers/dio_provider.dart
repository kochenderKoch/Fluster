import 'package:fluster/api/dio_client.dart';
import 'package:fluster/models/kontests.dart';
import 'package:fluster/providers/logging_provider.dart';
import 'package:flutter/material.dart';

/// Provider for communication with API
class DioProvider extends ChangeNotifier {
  /// [DioProvider] Constructor
  DioProvider(this.loggingProvider);

  /// Logger for Dio Operations
  LoggingProvider loggingProvider;

  /// [List] of [KontestsModel] Instance
  List<KontestsModel> models = [];

  /// Update the Logger in Realtime
  void setLoggingProvider(LoggingProvider newLoggingProvider) {
    loggingProvider = newLoggingProvider;
    notifyListeners();
  }

  /// Add a new [Text] to the database and the provider
  Future<void> getModels() async {
    loggingProvider.talker.info('Call get function');
    final result = await DioClient(loggingProvider.talker).getKontests();
    if (result.success) {
      models = result.content!;
    }

    notifyListeners();
  }
}
