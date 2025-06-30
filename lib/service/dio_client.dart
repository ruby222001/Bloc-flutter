import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://fakestoreapi.com',
          // connectTimeout: 5000,
          // receiveTimeout: 3000,
        )) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options); // continue
      },
      onResponse: (response, handler) {
        print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        print('ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}');
        return handler.next(e); //continue
      },
    ));
  }

  Future<Response> get(String path) async {
    return _dio.get(path);
  }
}
