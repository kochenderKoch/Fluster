import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

/// State Management for Logging
class LoggingProvider extends ChangeNotifier {
  /// Logger for Dio Operations
  // TODO(kochenderKoch): TalkerFlutter or Talker()?
  Talker talker = TalkerFlutter.init(
    settings: TalkerSettings(
      /// Length of history that saving logs data
      maxHistoryItems: 10,

      /// You can enable/disable console logs
      useConsoleLogs: false,
    ),
  );
}
