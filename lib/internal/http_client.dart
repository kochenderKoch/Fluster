import 'package:dio/dio.dart';

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
  /// and set the [NetErrorType] from the raw [Response]
  HttpResponse(this.raw) {
    if (raw.statusCode == 200) {
      errorType = NetErrorType.none;
    } else if (raw.statusCode! >= 500 && raw.statusCode! < 600) {
      errorType = NetErrorType.timedOut;
    } else if (raw.statusCode! >= 400 && raw.statusCode! < 500) {
      errorType = NetErrorType.denied;
    }
  }

  // /// Construct an empty [HttpResponse] Instance
  // /// with [NetErrorType.unknown] Error
  // HttpResponse.error()
  //     : raw = Response(data: '', 404),
  //       errorType = NetErrorType.unknown;

  // /// Construct an empty [HttpResponse] Instance
  // /// with [NetErrorType.none] Error
  // HttpResponse.empty()
  //     : raw = http.Response('', 200),
  //       errorType = NetErrorType.none;

  /// The [Response] from the an HTTP Request
  final Response<String> raw;

  /// The [Response] Error Code
  NetErrorType errorType = NetErrorType.none;

  /// Was the [Response] success?
  bool get success => errorType == NetErrorType.none;

  /// Get the body of the raw [Response]
  String get body => raw.data.toString();

  /// Get a [Map] of the headers from the raw [Response]
  Map<String, List<String>> get headers => raw.headers.map;

  /// Get the Status-Code from the raw [Response]
  int get statusCode => raw.statusCode!;
}
