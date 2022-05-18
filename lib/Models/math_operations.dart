import 'package:suntastic/Models/day_temperature_model.dart';
import 'package:suntastic/Models/point_model.dart';

enum GraphType {
  daily,
  weekly,
  monthly,
  yearly,
}

class MathOperations {
  BasicGraphData data = BasicGraphData();
  List<DayValueModel> _list = [];
  GraphType graphType;
  late AverageData avg;
  MathOperations(this._list, this.graphType) {
    _makeCalculation();
  }
  
  void _makeCalculation() {
    _list.removeWhere((element) => element.temp == -999);

    _calcavgList();
    _calcTotalAvg();
    _calcMinMaxTemp();
  }

  void _calcavgList() {
    if (graphType == GraphType.weekly) avg = WeeklyAverage(_list);
    if (graphType == GraphType.daily) avg = DailyAverage(_list);
    if (graphType == GraphType.monthly) avg = MonthlyAverage(_list);
    if (graphType == GraphType.yearly) avg = YearlyAverage(_list);
    avg.calcAvg();
    data.avgList = avg.averageList;
  }

  void _calcTotalAvg() {
    double avg = 0;
    data.avgList.forEach((element) {
      avg += element;
    });
    data.totalAvg = avg / data.avgList.length;
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
  late List<double> avgList = [];
  List<PointCoord> mapCoordinatesToXYCoords() {
    int count = 0;
    final res = avgList
        .map((avgVal) => PointCoord((count++).toDouble(), avgVal))
        .toList();
    return res;
  }
}

abstract class AverageData {
  List<DayValueModel> values = [];
  List<double> averageList = [];
  AverageData(this.values);
  late double totalAvg;
  void calcAvg();
  double getListAverage(List<double> _list) {
    double res = 0.0;
    _list.forEach((element) {
      res += element;
    });
    return res / _list.length;
  }
}

class WeeklyAverage extends AverageData {
  WeeklyAverage(List<DayValueModel> values) : super(values);

  @override
  void calcAvg() {
    int startIndex = 0;
    if (startIndex > values.length - 7) {
      averageList.add(getListAverage(values.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < values.length - 7; startIndex += 7) {
      averageList.add(getListAverage(values
          .getRange(startIndex, startIndex + 7)
          .map((e) => e.temp)
          .toList()));
    }
  }
}

class MonthlyAverage extends AverageData {
  MonthlyAverage(List<DayValueModel> values) : super(values);

  @override
  void calcAvg() {
    const incremtnBy = 30;
    int startIndex = 0;
    if (startIndex > values.length - incremtnBy) {
      averageList.add(getListAverage(values.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < values.length - incremtnBy; startIndex += incremtnBy) {
      averageList.add(getListAverage(values
          .getRange(startIndex, startIndex + incremtnBy)
          .map((e) => e.temp)
          .toList()));
    }
  }
}

class DailyAverage extends AverageData {
  DailyAverage(List<DayValueModel> values) : super(values);

  @override
  void calcAvg() {
    const incremtnBy = 1;
    int startIndex = 0;
    if (startIndex > values.length - incremtnBy) {
      averageList.add(getListAverage(values.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < values.length - incremtnBy; startIndex += incremtnBy) {
      averageList.add(getListAverage(values
          .getRange(startIndex, startIndex + incremtnBy)
          .map((e) => e.temp)
          .toList()));
    }
  }
}

class YearlyAverage extends AverageData {
  YearlyAverage(List<DayValueModel> values) : super(values);

  @override
  void calcAvg() {
    const incremtnBy = 365;
    int startIndex = 0;
    if (startIndex > values.length - incremtnBy) {
      averageList.add(getListAverage(values.map((e) => e.temp).toList()));
      return;
    }
    for (; startIndex < values.length - incremtnBy; startIndex += incremtnBy) {
      averageList.add(getListAverage(values
          .getRange(startIndex, startIndex + incremtnBy)
          .map((e) => e.temp)
          .toList()));
    }
  }
}
