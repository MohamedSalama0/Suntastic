import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/widgets/slider.dart';

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
            child: SizedBox(
              width: TemporalCubit.instance(context).graphWidth,
              child: Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(data.measureUnit,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold))),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: LineChart(
                      LineChartData(
                        backgroundColor: Colors.black12,
                        minY: minVal.toInt() - (minVal.toInt() % 10) - 10,
                        maxY: maxVal.toInt() + (maxVal.toInt() % 10) + 10,
                        lineBarsData: _allCharts(),
                        gridData: _buildGridData(),
                        borderData: _buildBorders(),
                        titlesData: _buildTitles(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    right: 50,
                    child: Text(
                      data.graphDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xff4B3869),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: _buildText(
            'Average =',
            graphData.totalAvg.ceil(),
          ),
        ),
        const SizedBox(height: 5),
        Container(
            height: 40,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xff4B3869),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: _buildText('Min =', graphData.minVal.ceil())),
        const SizedBox(height: 5),
        Container(
            height: 40,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xff4B3869),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: _buildText('Max =', graphData.maxVal.ceil())),
        const Expanded(child: SizedBox()),
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: SliderWidget(),
        ),
      ],
    );
  }

  Widget _buildText(String math, int val) {
    var span = TextSpan(children: [
      TextSpan(
        text: '$math  ',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
      ),
      TextSpan(
        text: ' $val ',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      TextSpan(
        text: data.measureUnit,
        style: const TextStyle(
            color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ]);
    return FittedBox(
      child: RichText(
        text: span,
      ),
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
