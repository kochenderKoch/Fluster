import '../internal/http_client.dart';

class ApiResult<T> {
  final HttpResponse response;
  final T? content;

  bool get success => response.success;

  ApiResult(this.content, this.response);
}
