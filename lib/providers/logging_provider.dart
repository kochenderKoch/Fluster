import 'package:fluster/config/config.dart';
import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// State Management for Logging
class LoggingProvider extends ChangeNotifier {
  /// Logger for Dio Operations
  Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      /// Length of history that saving logs data
      maxHistoryItems: Config.loggerHistory,

      /// You can enable/disable console logs
      useConsoleLogs: false,
    ),
  );
}
