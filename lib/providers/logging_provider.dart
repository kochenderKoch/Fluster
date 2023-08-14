import 'package:flutter/material.dart';
import 'package:talker/talker.dart';

/// State Management for Logging
class LoggingProvider extends ChangeNotifier {
  /// Logger for Dio Operations
  Talker talker = Talker();
}
