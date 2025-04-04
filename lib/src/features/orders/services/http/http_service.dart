import 'package:dio/dio.dart';

abstract interface class HttpService {
  Future<Response<T>> get<T>(String path);
}
