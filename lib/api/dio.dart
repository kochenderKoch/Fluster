import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluster/models/kontests.dart';
import 'package:flutter/material.dart';
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
  /// receiveTimeout is set to 15 seconds
  /// connectTimeout is set to 15 seconds
  /// sendTimeout is set to 15 seconds
  Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://kontests.net/api',
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll({
      AuthInterceptors(dio),
    });
    dio.interceptors.addAll({
      LoggingInterceptors(),
    });
    dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );

    return dio;
  }

  /// Calls KontestsAPI and return a [List] of all Kontest
  Future<List<KontestsModel>> getKontests() async {
    // Perform GET request to the endpoint "/users/<id>"
    // ignore: omit_local_variable_types
    final Response<String> response = await _dio.get('/v1/all');

    return (jsonDecode(response.data!) as List<dynamic>)
        .map((model) => KontestsModel.fromJson(model as Map<String, dynamic>))
        .toList();
  }
}

/// Wraps an authorization around an [Dio]-Requests
class AuthInterceptors extends Interceptor {
  /// Constructor for [AuthInterceptors]
  AuthInterceptors(this.dio);

  /// The [Dio] Client
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // var accessToken = await TokenRepository().getAccessToken();

    // if (accessToken != null) {
    //   var expiration = await TokenRepository().getAccessTokenRemainingTime();

    //   if (expiration.inSeconds < 60) {
    //     dio.interceptors.requestLock.lock();

    //     // Call the refresh endpoint to get a new token
    //     await UserService().refresh().then((response) async {
    //       await TokenRepository().persistAccessToken(response.accessToken);
    //       accessToken = response.accessToken;
    //     }).catchError((error, stackTrace) {
    //       handler.reject(error, true);
    //     }).whenComplete(() => dio.interceptors.requestLock.unlock());
    //   }

    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }
}

/// The [Dio]-Requests and [Dio]-Response gets interrupted to log the output to
/// stdout.
class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
      '''RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}''',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      '''ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}''',
    );
    return super.onError(err, handler);
  }
}
