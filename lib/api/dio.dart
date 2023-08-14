// import 'package:dio/dio.dart';

// class Api {
//   factory Api() => _singleton;
//   Api._internal();

//   final dio = createDio();
//   final tokenDio = Dio(BaseOptions());

//   static final _singleton = Api._internal();

//   static Dio createDio() {
//     final dio = Dio(
//       BaseOptions(
//         receiveTimeout: const Duration(seconds: 15), // 15 seconds
//         connectTimeout: const Duration(seconds: 15),
//         sendTimeout: const Duration(seconds: 15),
//       ),
//     );

//     dio.interceptors.addAll({
//       AppInterceptors(dio),
//     });
//     return dio;
//   }
// }

// class AppInterceptors extends Interceptor {
//   AppInterceptors(this.dio);
//   final Dio dio;

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     var accessToken = await TokenRepository().getAccessToken();

//     if (accessToken != null) {
//       var expiration = await TokenRepository().getAccessTokenRemainingTime();

//       if (expiration.inSeconds < 60) {
//         dio.interceptors.requestLock.lock();

//         // Call the refresh endpoint to get a new token
//         await UserService().refresh().then((response) async {
//           await TokenRepository().persistAccessToken(response.accessToken);
//           accessToken = response.accessToken;
//         }).catchError((error, stackTrace) {
//           handler.reject(error, true);
//         }).whenComplete(() => dio.interceptors.requestLock.unlock());
//       }

//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }

//     return handler.next(options);
//   }
// }
