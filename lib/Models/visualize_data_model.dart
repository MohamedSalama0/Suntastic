import 'package:suntastic/Models/day_temperature_model.dart';
import 'package:suntastic/Models/math_operations.dart';

abstract class VisualizeDataModel {
  late BasicGraphData graphData;
  List<DayValueModel> list = [];
  String graphDisplayName = '#Weeks';
  VisualizeDataModel.fromMap(String key, Map<String, dynamic> map) {
    if (map[key] != null) {
      list = DayValueModel.mapToList(map[key]);
      final math = MathOperations(list, GraphType.daily);
      graphData = math.data;
    }
  }
  void changeGraphDisplayType(GraphType graphType) {
    final math = MathOperations(list, graphType);
    _updateGraphDisplayTypeName(graphType);
    graphData = math.data;
  }

  void _updateGraphDisplayTypeName(GraphType graphType) {
    if (graphType == GraphType.daily) graphDisplayName = '#Day';
    if (graphType == GraphType.weekly) graphDisplayName = '#Week';
    if (graphType == GraphType.monthly) graphDisplayName = '#Month';
    // if (graphType == GraphType.daily) graphDisplayName = '#Day';
  }

  String get measureUnit;
  String get modelName;
}

class TemperatureModel extends VisualizeDataModel {
  TemperatureModel.fromMap(String key, Map<String, dynamic> map)
      : super.fromMap(key, map);

  @override
  String get measureUnit => 'C';

  @override
  String get modelName => 'temperature';
}

class PressuresModel extends VisualizeDataModel {
  PressuresModel.fromMap(String key, Map<String, dynamic> map)
      : super.fromMap(key, map);

  @override
  String get measureUnit => 'Pa';

  @override
  String get modelName => 'surface pressure';
}

class WindModel extends VisualizeDataModel {
  WindModel.fromMap(String key, Map<String, dynamic> map)
      : super.fromMap(key, map);

  @override
  String get measureUnit => 'm/s';

  @override
  String get modelName => 'wind speed';
}

class SolarIrradians extends VisualizeDataModel {
  SolarIrradians.fromMap(String key, Map<String, dynamic> map)
      : super.fromMap(key, map);

  @override
  String get measureUnit => 'kW-hr/m^2/day';

  @override
  String get modelName => 'solar irradiance';
}
