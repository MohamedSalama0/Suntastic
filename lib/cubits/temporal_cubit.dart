import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suntastic/Models/all_properties_model.dart';
import 'package:suntastic/Models/temporal_daily_point_model.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_states.dart';
import 'package:suntastic/repositries/temporal_repo.dart';

typedef TemporalCubitBuilder = BlocBuilder<TemporalCubit, TemporalStates>;
typedef TemporalCubitListener = BlocListener<TemporalCubit, TemporalStates>;

class TemporalCubit extends Cubit<TemporalStates> {
  TemporalCubit(LatLng locationToSearch, double startTime, double endTime)
      : super(IntialTemporalState()) {
    getTemperaturesFromServer(startTime, endTime, locationToSearch);
  }
  static TemporalCubit instance(BuildContext context) =>
      BlocProvider.of<TemporalCubit>(context);

  late AllPropertiesModel _temperaturesModel;
  TemperatureModel get temperatures => _temperaturesModel.temperatures;
  PressuresModel get pressures => _temperaturesModel.pressures;
  WindModel get wind => _temperaturesModel.wind;

  double graphWidth = 400;

  Future<void> getTemperaturesFromServer(
      double startTime, double endTime, LatLng location) async {
    emit(LoadingTemporalState());
    try {
      final res = await fetchTemperatures(TemporalDailyPointModel(
          start: startTime.toInt(),
          end: endTime.toInt(),
          lat: location.latitude,
          long: location.longitude,
          params: 'T2M,PS,WS10M'));
      if (res!.error) {
        emit(ErrorTemporalState(errorMessage: res.errorMessage));
        return;
      }
      _temperaturesModel = res.data!;
      print(res.data!.temperatures.list.first.day);
    } on Exception catch (e) {
      emit(ErrorTemporalState(errorMessage: e.toString()));
    }
    emit(LoadedTemporalState());
  }

  void changeGraphWidth(double x) {
    graphWidth = x;
    emit(ChangeGraphDimensionsState());
  }
}
