import 'package:http/http.dart' as http;

enum NetErrorType {
  none,
  disconnected,
  timedOut,
  denied,
  unknown,
}

class HttpResponse {
  final http.Response raw;

  NetErrorType errorType = NetErrorType.none;

  bool get success => errorType == NetErrorType.none;

  String get body => raw.body;

  Map<String, String> get headers => raw.headers;

  int get statusCode => raw.statusCode;

  HttpResponse(this.raw) {
    if (raw.statusCode == 200) {
      errorType = NetErrorType.none;
    } else if (raw.statusCode >= 500 && raw.statusCode < 600) {
      errorType = NetErrorType.timedOut;
    } else if (raw.statusCode >= 400 && raw.statusCode < 500) {
      errorType = NetErrorType.denied;
    }
  }

  HttpResponse.error()
      : raw = http.Response("", 404),
        errorType = NetErrorType.unknown;

  HttpResponse.empty()
      : raw = http.Response("", 200),
        errorType = NetErrorType.none;
}
