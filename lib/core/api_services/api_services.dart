import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/core/utils/app_constance.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL'] ?? '',
        contentType: 'application/json',
      ),
    );
  }

  Future<dynamic> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'X-RapidAPI-Key': AppConstance.apiKey,
    };
    var response = await dio.get(
      path,
      queryParameters: query,
      options: Options(
        headers: {
          'X-RapidAPI-Key': AppConstance.apiKey,
        },
      ),
    );
    return response.data;
  }

  Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'X-RapidAPI-Key': AppConstance.apiKey,
    };

    return await dio.post(
      path,
      data: data,
    );
  }

  Future<Response> putData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'X-RapidAPI-Key': AppConstance.apiKey,
    };

    return await dio.put(
      path,
      data: data,
    );
  }
}