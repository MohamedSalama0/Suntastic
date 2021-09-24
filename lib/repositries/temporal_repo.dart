import 'package:suntastic/Models/all_temperatures_model.dart';
import 'package:suntastic/Models/temporal_daily_point_model.dart';
import 'package:suntastic/api_response.dart';
import 'package:suntastic/constants/api_constants.dart';
import 'package:suntastic/services/call_api.dart';
import 'package:suntastic/services/dio_helper.dart';

Future<APIResponse<AllTemperaturesModel>?> fetchTemperatures(
    TemporalDailyPointModel model) async {
  final res2 = await callAPI(temporalDailyPointUrl,
      callType: CallType.Get, quiries: model.toMap());
  return res2!.error
      ? APIResponse(error: true, errorMessage: res2.errorMessage)
      : APIResponse(data: AllTemperaturesModel.fromJson(res2.data));
}
