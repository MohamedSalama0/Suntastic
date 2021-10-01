import 'package:suntastic/Models/day_temperature_model.dart';
import 'package:suntastic/Models/math_operations.dart';

abstract class VisualizeDataModel {
  late BasicGraphData graphData;
  List<DayValueModel> list = [];
  VisualizeDataModel.fromMap(String key, Map<String, dynamic> map) {
    if (map[key] != null) {
      list = DayValueModel.mapToList(map[key]);
      final math = MathOperations(list);
      graphData = math.data;
    }
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
  String get measureUnit => 'kPa';

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
