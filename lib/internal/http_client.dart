import 'package:http/http.dart' as http;

/// All NetError Codes
enum NetErrorType {
  /// No Error
  none,

  /// Disconnected
  disconnected,

  /// The Request [timedOut]
  timedOut,

  /// The Request was [denied]
  denied,

  /// [unknown] Error
  unknown,
}

///
class HttpResponse {
  /// Construct an empty [HttpResponse] Instance
  /// and set the [NetErrorType] from the raw [http.Response]
  HttpResponse(this.raw) {
    if (raw.statusCode == 200) {
      errorType = NetErrorType.none;
    } else if (raw.statusCode >= 500 && raw.statusCode < 600) {
      errorType = NetErrorType.timedOut;
    } else if (raw.statusCode >= 400 && raw.statusCode < 500) {
      errorType = NetErrorType.denied;
    }
  }

  /// Construct an empty [HttpResponse] Instance
  /// with [NetErrorType.unknown] Error
  HttpResponse.error()
      : raw = http.Response('', 404),
        errorType = NetErrorType.unknown;

  /// Construct an empty [HttpResponse] Instance
  /// with [NetErrorType.none] Error
  HttpResponse.empty()
      : raw = http.Response('', 200),
        errorType = NetErrorType.none;

  /// The [http.Response] from the called [http.Request]
  final http.Response raw;

  /// The [http.Response] Error Code
  NetErrorType errorType = NetErrorType.none;

  /// Was the [http.Response] success?
  bool get success => errorType == NetErrorType.none;

  /// Get the body of the raw [http.Response]
  String get body => raw.body;

  /// Get a [Map] of the headers from the raw [http.Response]
  Map<String, String> get headers => raw.headers;

  /// Get the Status-Code from the raw [http.Response]
  int get statusCode => raw.statusCode;
}
