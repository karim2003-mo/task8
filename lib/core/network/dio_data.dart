import 'package:dio/dio.dart';
import 'package:task7/core/constants.dart';

class GetDio {
  // ignore: unused_field, prefer_typing_uninitialized_variables
  static final GetDio _instance=GetDio._internal();
  factory GetDio() => _instance;
  final Dio _dio;
  GetDio._internal():
    _dio = Dio(BaseOptions(
  baseUrl: BASEURL,
  connectTimeout: Duration(seconds: 30),
  receiveTimeout: Duration(seconds: 30),
  sendTimeout: Duration(seconds: 30),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
));
Dio get call => _dio;
}