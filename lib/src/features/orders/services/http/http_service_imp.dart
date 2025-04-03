import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pizzaria/env.dart';
import 'package:pizzaria/src/features/orders/services/http/http_service.dart';
import 'package:pizzaria/src/shared/exceptions/http_exception.dart';

class HttpServiceDio implements HttpService {
  late Dio _dio;
  HttpServiceDio() {
    _init();
  }

  Future<void> _init() async {
    _dio = Dio(BaseOptions(
      baseUrl:
          'https://maps.googleapis.com/maps/api/distancematrix/json?origin=-15.5472162%2C-47.344899&key=$GOOGLE_MAPS_API_KEY&',
      connectTimeout: Duration(milliseconds: 30 * 1000),
      receiveTimeout: Duration(milliseconds: 30 * 1000),
    ));
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      bool isConnected = await _isConnected();
      if (!isConnected) {
        _throwHttpException(999,
            'Sua conexão com a internet está instável. Reconecte e tente novamente.');
      }
      return _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: {
          "content-type": "application/json;charset=utf-8",
        }),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e, s) {
      var throwException = HttpException(e.response?.statusCode?.toInt() ?? 400,
          'Exception: $e, StackTrace $s');
      throw throwException;
    }
  }

  Future<bool> _isConnected() async {
    try {
      List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.isEmpty) {
        return false;
      } else {
        return true;
      }
    } on Exception {
      return false;
    }
  }

  void _throwHttpException(int statusCode, String message) {
    throw HttpException(statusCode, message);
  }
}
