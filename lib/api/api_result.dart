import 'package:fluster/internal/http_client.dart';

/// An Wrapper around an [ApiResult]
class ApiResult<T> {
  /// Constructor
  ApiResult(this.content, this.response);

  /// The [HttpResponse] as a response to an HTTP-Request
  final HttpResponse response;

  /// Content of type [T] for further processing.
  final T? content;

  /// Was the [HttpResponse] sucessfull?
  bool get success => response.success;
}
