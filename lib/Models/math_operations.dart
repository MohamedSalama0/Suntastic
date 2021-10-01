import 'package:suntastic/Models/day_temperature_model.dart';
import 'package:suntastic/Models/point_model.dart';

class MathOperations {
  BasicGraphData data = BasicGraphData();
  List<DayValueModel> _list = [];
  MathOperations(this._list) {
    _makeCalculation();
  }
  void _makeCalculation() {
    _calcAvgPerWeek();
    _calcTotalAvg();
    _calcMinMaxTemp();
  }

  void _calcAvgPerWeek() {
    int startIndex = 0;
    if (startIndex > _list.length - 7) {
      data.avgPerWeek.add(getListAverage(_list.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < _list.length - 7; startIndex += 7) {
      data.avgPerWeek.add(getListAverage(_list
          .getRange(startIndex, startIndex + 7)
          .map((e) => e.temp)
          .toList()));
    }
    print('calcAvgPerWeek');
  }

  void _calcTotalAvg() {
    double avg = 0;
    data.avgPerWeek.forEach((element) {
      avg += element;
    });
    data.totalAvg = avg / data.avgPerWeek.length;
  }

  void _calcMinMaxTemp() {
    double minVal = _list.first.temp;
    double maxTemp = _list.first.temp;
    _list.forEach((element) {
      if (element.temp != -999) {
        if (element.temp > maxTemp) maxTemp = element.temp;
        if (element.temp < minVal) minVal = element.temp;
      }
    });
    data.minVal = minVal;
    data.maxVal = maxTemp;
    print('Min value is $minVal');
  }

  double getListAverage(List<double> _list) {
    double res = 0.0;
    _list.forEach((element) {
      res += element;
    });
    return res / _list.length;
  }
}

class BasicGraphData {
  late double minVal = 0;
  late double maxVal = 0;
  late double totalAvg = 0;
  late List<double> avgPerWeek = [];
  List<PointCoord> mapCoordinatesToXYCoords() {
    int count = 0;
    final res = avgPerWeek
        .map((avgVal) => PointCoord((count++).toDouble(), avgVal))
        .toList();
    return res;
  }
}
