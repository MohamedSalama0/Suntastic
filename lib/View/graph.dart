import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/cubits/temporal_states.dart';
import 'package:suntastic/widgets/slider.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TemporalCubitBuilder(
            builder: (_, state) {
              if (state is LoadingTemporalState)
                return CircularProgressIndicator();
              if (state is ErrorTemporalState) {
                return Center(
                  child: Text(
                    'Error happened ${state.errorMessage}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              }
              final minVal = TemporalCubit.instance(context).minTemp;
              final maxVal = TemporalCubit.instance(context).maxTemp;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SliderWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: TemporalCubit.instance(context).graphWidth,
                        child: LineChart(
                          LineChartData(
                            minY: minVal.toInt() - (minVal.toInt() % 10) - 10,
                            maxY: maxVal.toInt() + (maxVal.toInt() % 10) + 10,
                            lineBarsData: _allCharts,
                            gridData: _buildGridData(),
                            borderData: _buildBorders(),
                            titlesData: _buildTitles(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Total Average temp is ${TemporalCubit.instance(context).totalAverage.ceil()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Min temp is ${TemporalCubit.instance(context).minTemp.floor()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'Max temp is ${TemporalCubit.instance(context).maxTemp.ceil()}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              );
            },
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
      colors: _colors,
      barWidth: 3,
      // belowBarData: BarAreaData(show: true),
    );
  }

  List<Color> get _colors {
    return [
      Colors.black,
    ];
  }

  List<FlSpot> get _createPoints {
    final points = TemporalCubit.instance(context).graphPoints;
    return points.map((point) => FlSpot(point.x, point.y)).toList();
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
