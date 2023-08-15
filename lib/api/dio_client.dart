import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluster/api/api_result.dart';
import 'package:fluster/api/dio_exception.dart';
import 'package:fluster/api/interceptors/interceptors.dart';
import 'package:fluster/config/config.dart';
import 'package:fluster/config/endpoints.dart';
import 'package:fluster/internal/http_client.dart';
import 'package:fluster/models/kontests.dart';
import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

/// This Class create a [Dio]-Client for HTTP-Communication
class DioClient {
  /// Constructor for [DioClient]
  DioClient(this.talker) {
    _dio = createDio();
  }

  /// Logger for [Dio] Tasks
  final Talker talker;

  /// The [Dio] Client
  late final Dio _dio;

  /// Create an new Dio Instance
  /// with the Config from [Endpoints]
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseURL,
        receiveTimeout: Endpoints.receiveTimeout, // 15 seconds
        connectTimeout: Endpoints.connectionTimeout,
        sendTimeout: Endpoints.sendTimeout,
      ),
    );

    dio.interceptors.addAll({
      AuthInterceptors(dio),
      LoggingInterceptors(),
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: Config.isDetailedLogging,
          printResponseHeaders: Config.isDetailedLogging,
          printRequestData: Config.isDetailedLogging,
          printResponseData: Config.isDetailedLogging,
        ),
      ),
    });

    return dio;
  }

  /// Calls KontestsAPI and return a [List] of all Kontest
  Future<ApiResult<List<KontestsModel>>> getKontests() async {
    try {
      // Perform GET request to the endpoint "/users/<id>"
      // TODO(kochenderKoch): Change Options to JSON
      // ignore: omit_local_variable_types
      final Response<String> response = await _dio.get(
        Endpoints.getAllKontests,
        options: Options(responseType: ResponseType.plain),
      );

      return ApiResult(
        (jsonDecode(response.data!) as List<dynamic>)
            .map(
              (model) => KontestsModel.fromJson(model as Map<String, dynamic>),
            )
            .toList(),
        HttpResponse(response),
      );
    } on DioException catch (error) {
      final errorMessage = DioExceptionImpl.fromDioException(error).toString();
      throw ArgumentError(errorMessage);
    } catch (e) {
      if (kDebugMode) debugPrint(e.toString());
      throw ArgumentError(e.toString());
    }
  }
}
