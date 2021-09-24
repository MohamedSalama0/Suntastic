import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suntastic/Models/point_model.dart';
import 'package:suntastic/Models/all_temperatures_model.dart';
import 'package:suntastic/Models/temporal_daily_point_model.dart';
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
  late AllTemperaturesModel _temperaturesModel;
  late double totalAverage = _temperaturesModel.totalAvg;
  double get maxTemp => _temperaturesModel.maxTemp;
  double get minTemp => _temperaturesModel.minTemp;
  double graphWidth = 400;
  List<PointCoord> get graphPoints => _mapCoordinatesToXYCoords();

  Future<void> getTemperaturesFromServer(
      double startTime, double endTime, LatLng location) async {
    emit(LoadingTemporalState());
    try {
      final res = await fetchTemperatures(TemporalDailyPointModel(
          start: startTime.toInt(),
          end: endTime.toInt(),
          lat: location.latitude,
          long: location.longitude,
          params: 'T2M'));
      if (res!.error) {
        emit(ErrorTemporalState(errorMessage: res.errorMessage));
        return;
      }
      _temperaturesModel = res.data!;
      print(res.data!.temperatures.first.day);
    } on Exception catch (e) {
      emit(ErrorTemporalState(errorMessage: e.toString()));
    }
    emit(LoadedTemporalState());
  }

  List<PointCoord> _mapCoordinatesToXYCoords() {
    int count = 0;
    final res = _temperaturesModel.avgPerWeek
        .map((avgVal) => PointCoord((count++).toDouble(), avgVal))
        .toList();
    return res;
  }

  void changeGraphWidth(double x) {
    graphWidth = x;
    emit(ChangeGraphDimensionsState());
  }
}
