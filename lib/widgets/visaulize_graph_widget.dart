import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';

class VisualizeGraphWidget extends StatelessWidget {
  const VisualizeGraphWidget({Key? key, required this.data}) : super(key: key);
  final VisualizeDataModel data;
  @override
  Widget build(BuildContext context) {
    final graphData = data.graphData;
    final minVal = graphData.minVal;
    final maxVal = graphData.maxVal;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 13,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: TemporalCubit.instance(context).graphWidth,
              child: LineChart(
                LineChartData(
                  minY: minVal.toInt() - (minVal.toInt() % 10) - 10,
                  maxY: maxVal.toInt() + (maxVal.toInt() % 10) + 10,
                  lineBarsData: _allCharts(),
                  gridData: _buildGridData(),
                  borderData: _buildBorders(),
                  titlesData: _buildTitles(),
                ),
              ),
            ),
          ),
        ),
        Text(
          'Average ${data.modelName} is ${graphData.totalAvg.ceil()} ${data.measureUnit}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Min ${data.modelName} is ${graphData.minVal.floor()} ${data.measureUnit}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          'Max ${data.modelName} is ${graphData.maxVal.ceil()} ${data.measureUnit}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(child: Container())
      ],
    );
  }

  List<LineChartBarData> _allCharts() {
    return [
      _buildLineChartBarData(),
    ];
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      dotData: FlDotData(show: false),
      spots: _createPoints(),
      colors: _colors,
      barWidth: 3,
    );
  }

  List<Color> get _colors {
    return [
      Colors.black,
    ];
  }

  List<FlSpot> _createPoints() {
    final points = data.graphData.mapCoordinatesToXYCoords();
    return points.map((point) => FlSpot(point.x, point.y)).toList();
  }

  FlTitlesData _buildTitles() {
    return FlTitlesData(
      show: true,
      bottomTitles: _buildBottomTitles(),
      rightTitles: SideTitles(showTitles: true, getTitles: _emtpyTitles),
      topTitles: SideTitles(showTitles: true, getTitles: _emtpyTitles),
      // leftTitles: SideTitles(showTitles: true, reservedSize: 30),
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
      },
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: false,
      getDrawingHorizontalLine: (x) {
        return FlLine(color: Colors.red, strokeWidth: 2);
      },
      drawVerticalLine: true,
      getDrawingVerticalLine: (x) => FlLine(color: Colors.red, strokeWidth: 2),
    );
  }

  FlBorderData _buildBorders() {
    return FlBorderData(border: Border.all(color: Colors.green));
  }

  String _emtpyTitles(_) => '';
}
