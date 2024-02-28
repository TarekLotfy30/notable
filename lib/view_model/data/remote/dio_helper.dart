import 'package:dio/dio.dart';
import 'package:notable/view_model/data/remote/endpoints.dart';

class DioHelper {
  static Dio? dio;

  // Private constructor to prevent instantiation
  DioHelper._();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio?.get(
      endPoint,
      queryParameters: params,
      data: body,
    );
  }

  static Future<Response?> postData({
    required String endPoint,
    required Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return await dio?.post(
      endPoint,
      queryParameters: params,
      data: body,
    );
  }
}
