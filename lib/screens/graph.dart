import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../Models/json_data.dart';
import '../Models/temperature_model.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<TemperatureModel> list;
  double maxYVal = 0;
  double minYVal = double.infinity;
  List<double> avg = [];

  @override
  void initState() {
    list = temp['T2M']!.entries.map((element) {
      // if (element.value > maxYVal) maxYVal = element.value;

      return TemperatureModel(day: element.key, temp: element.value);
    }).toList();
    int startIndex = 0;
    for (; startIndex < list.length - 7; startIndex += 7) {
      avg.add(list.first.getAverage(list
          .getRange(startIndex, startIndex + 7)
          .map((e) => e.temp)
          .toList()));
    }
    print(avg.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(maxYVal);
    return Center(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 700,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(enabled: false),
                minY: 0,
                maxY: 45,
                lineBarsData: _allCharts,
                gridData: _buildGridData(),
                borderData: _buildBorders(),
                titlesData: _buildTitles(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<LineChartBarData> get _allCharts {
    return [
      _buildLineChartBarData(),
    ];
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      dotData: FlDotData(show: false),
      spots: _createPoints,
      isCurved: true,
      colors: _colors,
      barWidth: 3,
      belowBarData: BarAreaData(show: true),
    );
  }

  List<Color> get _colors {
    return [
      Colors.black,
    ];
  }

  List<FlSpot> get _createPoints {
    int count = 1;
    return avg.map((e) => FlSpot((count++).toDouble(), e)).toList();
  }

  FlTitlesData _buildTitles() {
    return FlTitlesData(
      show: true,
      bottomTitles: _buildBottomTitles(),
      rightTitles: SideTitles(showTitles: true, getTitles: _emtpyTitles),
      topTitles: SideTitles(showTitles: true, getTitles: _emtpyTitles),
      leftTitles: SideTitles(showTitles: true, reservedSize: 20),
    );
  }

  SideTitles _buildBottomTitles() {
    return SideTitles(
      // checkToShowTitle: (_, __, ___, ____, _____) => true,
      reservedSize: 50,
      rotateAngle: 50,
      margin: 10,
      showTitles: true,
      getTitles: (x) {
        return x.toString();
        switch (x.toInt()) {
          case 2:
            return 'MAR';
          case 5:
            return 'JUNE';
          case 8:
            return 'SEP';
            break;
          default:
            return '';
        }
      },
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      getDrawingHorizontalLine: (x) =>
          FlLine(color: Colors.red, strokeWidth: 2),
      drawVerticalLine: true,
      getDrawingVerticalLine: (x) => FlLine(color: Colors.red, strokeWidth: 2),
    );
  }

  FlBorderData _buildBorders() {
    return FlBorderData(border: Border.all(color: Colors.green));
  }

  String _emtpyTitles(_) => '';
}
