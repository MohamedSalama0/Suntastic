import 'package:suntastic/Models/all_properties_model.dart';
import 'package:suntastic/Models/temporal_daily_point_model.dart';
import 'package:suntastic/api_response.dart';
import 'package:suntastic/constants/api_constants.dart';
import 'package:suntastic/services/call_api.dart';

Future<APIResponse<AllPropertiesModel>?> fetchTemperatures(
    TemporalDailyPointModel model) async {
  final res2 = await callAPI(temporalDailyPointUrl,
      callType: CallType.Get, quiries: model.toMap());
  return res2!.error
      ? APIResponse(error: true, errorMessage: res2.errorMessage)
      : APIResponse(data: AllPropertiesModel.fromJson(res2.data));
}
