//call the rest api to store data on remote data base and return data in case of succeded or error on failed in format 4xx or 5xx status code

import 'package:dio/dio.dart';
import 'package:suntastic/constants/api_constants.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(BaseOptions(
      connectTimeout: 15 * 1000, //15 seconds if excced then throw exception
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String methodUrl,
      required Map<String, dynamic> queries}) async {
    return await dio.get(
      methodUrl,
      queryParameters: queries,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> queries = const {},
  }) async {
    return await dio.post(
      url,
      queryParameters: queries,
      data: body,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
  }
}
