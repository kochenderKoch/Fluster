import 'package:fluster/internal/http_client.dart';

/// An Wrapper around an API result
class ApiResult<T> {
  /// Constructor
  ApiResult(this.content, this.response);

  /// HTTP-Response
  final HttpResponse response;

  /// content that is received from a HTTP-Response
  final T? content;

  /// HTTP-Request was success
  bool get success => response.success;
}
