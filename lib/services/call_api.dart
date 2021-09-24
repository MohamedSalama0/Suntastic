import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:suntastic/services/dio_helper.dart';

class RecievedData {
  Map<String, dynamic> data;
  bool error;
  String errorMessage;
  RecievedData(
      {required this.data, required this.error, required this.errorMessage});
}

enum CallType {
  Get,
  Post,
}
Future<RecievedData?> callAPI(String url,
    {Map<String, dynamic> body = const {},
    Map<String, dynamic> quiries = const {},
    required CallType callType}) async {
  String error = "Un expected error happened";
  late Map<String, dynamic> data;

  try {
    Response response;
    if (callType == CallType.Post) {
      response =
          await DioHelper.postData(url: url, body: body, queries: quiries);
    } else {
      response = await DioHelper.getData(methodUrl: url, queries: quiries);
    }
    print(response.data);

    data = response.data;
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if ((response.data['success'] != null &&
              response.data['success'] != true) ||
          (response.data['status'] != null &&
              response.data['status'] != 'success'))
        error = response.data['message'];
      else {
        try {
          return RecievedData(
              data: response.data, error: false, errorMessage: "");
        } catch (e) {
          throw 'Error:${e.toString()} occured.';
        }
      }
    } else if (response.statusCode == 404)
      throw 'The requested page is not found try again!';
    else if (response.statusCode! >= 400 && response.statusCode! < 500) {
      if (response.data['message'] != null)
        error = response.data['message'];
      else if (response.data['errors'] != null) {
        error = (response.data['errors'] as Map<String, dynamic>)
            .entries
            .toList()[0]
            .value[0];
      } else
        throw 'Client side error please modify it then retry.';
    }
  } on DioError catch (e) {
    print(e.toString());
    print('Connection time out');
    if (e.type == DioErrorType.connectTimeout) throw 'Connection time out';
  }

  return RecievedData(data: data, error: true, errorMessage: error);
}
