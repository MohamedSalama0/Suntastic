import 'package:suntastic/Models/day_temperature_model.dart';

class AllTemperaturesModel {
  List<DayTemperatureModel> temperatures = [];
  List<double> avgPerWeek = [];
  double totalAvg = 0;
  double maxTemp = 0;
  double minTemp = 0;
  late double _defaultUnknownTemp = 0;
  AllTemperaturesModel.fromJson(Map<String, dynamic> json) {
    if (json['properties'] == null) return;
    final Map<String, dynamic> properties = json['properties']['parameter'];
    if (json['header'] != null) if (json['header']['fill_value'] != null)
      _defaultUnknownTemp = json['header']['fill_value'];
    if (properties['T2M'] != null) {
      final Map<String, dynamic> t2m = properties['T2M'];
      temperatures = t2m.entries
          .map((e) => DayTemperatureModel(day: e.key, temp: e.value))
          .toList();
      _calcAvgPerWeek();
      _calcTotalAvg();
      _calcMinMaxTemp();
    }
  }

  void _calcAvgPerWeek() {
    int startIndex = 0;
    if (startIndex > temperatures.length - 7) {
      avgPerWeek.add(getListAverage(temperatures.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < temperatures.length - 7; startIndex += 7) {
      avgPerWeek.add(getListAverage(temperatures
          .getRange(startIndex, startIndex + 7)
          .map((e) => e.temp)
          .toList()));
    }
    print('calcAvgPerWeek');
  }

  void _calcTotalAvg() {
    double avg = 0;
    avgPerWeek.forEach((element) {
      avg += element;
    });
    totalAvg = avg / avgPerWeek.length;
  }

  void _calcMinMaxTemp() {
    minTemp = temperatures.first.temp;
    maxTemp = temperatures.first.temp;
    temperatures.forEach((element) {
      if (element.temp != _defaultUnknownTemp) {
        if (element.temp > maxTemp) maxTemp = element.temp;
        if (element.temp < minTemp) minTemp = element.temp;
      }
    });
    print('Min value is $minTemp');
  }
}

double getListAverage(List<double> list) {
  double res = 0.0;
  list.forEach((element) {
    res += element;
  });
  return res / list.length;
}
