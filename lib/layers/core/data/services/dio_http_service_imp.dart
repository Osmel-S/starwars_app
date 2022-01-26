import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:starwars_app/layers/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;

  DioHttpServiceImp() {
    _dio = Dio(BaseOptions(baseUrl: 'https://swapi.dev/api/'));
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path);
  }
}
