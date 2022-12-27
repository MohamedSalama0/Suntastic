import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/widgets/slider.dart';

import '../core/main_color.dart';

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
                          style: const TextStyle(fontWeight: FontWeight.bold))),
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
      // colors: _colors,
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
      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: _buildBottomTitles,reservedSize: 42)),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: false,
             ),
      ),

      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
      // leftTitles: SideTitles(showTitles: true, reservedSize: 30),
    );
  }

  // SideTitles _buildBottomTitles() {
  //   return SideTitles(
  //     // checkToShowTitle: (_, __, ___, ____, _____) => true,
  //     reservedSize: 50,
  //     rotateAngle: 50,
  //     margin: 10,
  //     showTitles: true,
  //     getTitles: (x) {
  //       return x.toString();
  //     },
  //   );
  // }
  SideTitleWidget _buildBottomTitles(double value, TitleMeta meta) {
              final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];
              return SideTitleWidget(
                child: Text(
                  titles[value.toInt()],
                  style: const TextStyle(
                    color: Color(0xff7589a2),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                axisSide: meta.axisSide,
                space: 16,
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

// class BarCharthWidget extends StatefulWidget {
//   const BarCharthWidget({
//     Key? key,
//   }) : super(key: key);
//   // final VisualizeDataModel data;

//   @override
//   State<BarCharthWidget> createState() => _BarCharthWidgetState();
// }

// class _BarCharthWidgetState extends State<BarCharthWidget> {
//   final double width = 7;

//   late List<BarChartGroupData> rawBarGroups;
//   late List<BarChartGroupData> showingBarGroups;
//   int touchedGroupIndex = -1;
//   BarChartGroupData makeGroupData(int x, double y1, double y2) {
//     return BarChartGroupData(
//       barsSpace: 4,
//       x: x,
//       barRods: [
//         BarChartRodData(
//           y: y1,
//           colors: [blue, Colors.orange],
//           width: width,
//         ),
//         BarChartRodData(
//           colors: [blue, Colors.orange],
//           width: width,
//           y: y2,
//         ),
//       ],
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     final barGroup1 = makeGroupData(0, 14, 12);
//     final barGroup2 = makeGroupData(1, 13, 12);
//     final barGroup3 = makeGroupData(2, 12, 5);
//     final barGroup4 = makeGroupData(3, 10, 16);
//     final barGroup5 = makeGroupData(4, 11, 6);
//     // final barGroup6 = makeGroupData(5, 19, 1.5);
//     // final barGroup7 = makeGroupData(6, 10, 1.5);

//     final items = [
//       barGroup1,
//       barGroup2,
//       barGroup3,
//       barGroup4,
//       barGroup5,
//       // barGroup6,
//       // barGroup7,
//     ];

//     rawBarGroups = items;

//     showingBarGroups = rawBarGroups;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final graphData = widget.data.graphData;
//     // final minVal = graphData.minVal;
//     // final maxVal = graphData.maxVal;
//     return Container(
//       // height: 50,
//       padding: EdgeInsets.symmetric(vertical: 20),
//       // padding: const EdgeInsets.only(right: 20.0),
//       child: BarChart(
//         BarChartData(
//           maxY: 17,
//           barTouchData: BarTouchData(
//             touchTooltipData: BarTouchTooltipData(
//               tooltipBgColor: Colors.grey,
//               getTooltipItem: (a, b, c, d) => null,
//             ),
//             touchCallback: (FlTouchEvent event, response) {
//               if (response == null || response.spot == null) {
//                 setState(() {
//                   touchedGroupIndex = -1;
//                   showingBarGroups = List.of(rawBarGroups);
//                 });
//                 return;
//               }

//               touchedGroupIndex = response.spot!.touchedBarGroupIndex;

//               setState(() {
//                 if (!event.isInterestedForInteractions) {
//                   touchedGroupIndex = -1;
//                   showingBarGroups = List.of(rawBarGroups);
//                   return;
//                 }
//                 showingBarGroups = List.of(rawBarGroups);
//                 if (touchedGroupIndex != -1) {
//                   var sum = 0.0;
//                   for (final rod
//                       in showingBarGroups[touchedGroupIndex].barRods) {
//                     sum += rod.y;
//                   }
//                   final avg =
//                       sum / showingBarGroups[touchedGroupIndex].barRods.length;

//                   showingBarGroups[touchedGroupIndex] =
//                       showingBarGroups[touchedGroupIndex].copyWith(
//                     barRods:
//                         showingBarGroups[touchedGroupIndex].barRods.map((rod) {
//                       return rod.copyWith(y: avg);
//                     }).toList(),
//                   );
//                 }
//               });
//             },
//           ),
//           titlesData: FlTitlesData(
//             show: true,
//             rightTitles: SideTitles(
//               showTitles: false,
//             ),
//             topTitles: SideTitles(showTitles: false),
//             bottomTitles: SideTitles(
//               showTitles: true,
//               getTitles: (x) => x.toString(),
//               reservedSize: 42,
//             ),
//             leftTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 28,
//               interval: 1,
//               getTitles: (x) => x.toString(),
//             ),
//           ),
//           borderData: FlBorderData(
//             show: false,
//           ),
//           barGroups: showingBarGroups,
//           gridData: FlGridData(show: false),
//         ),
//       ),

//       // BarChart(
//       //   BarChartData(
//       //     backgroundColor: Colors.black12,
//       //     minY: minVal.toInt() - (minVal.toInt() % 10) - 10,
//       //     maxY: maxVal.toInt() + (maxVal.toInt() % 10) + 10,
//       //     // lineBarsData: _allCharts(),
//       //     axisTitleData: FlAxisTitleData(),
//       //     gridData: _buildGridData(),
//       //     borderData: _buildBorders(),
//       //     titlesData: _buildTitles(),
//       //   ),
//       // ),
//     );
//   }

//   Widget _buildText(String math, int val) {
//     var span = TextSpan(children: [
//       TextSpan(
//         text: '$math  ',
//         style: const TextStyle(
//             fontWeight: FontWeight.bold, fontSize: 20, color: Colors.orange),
//       ),
//       TextSpan(
//         text: ' $val ',
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//       ),
//       TextSpan(
//         // text: widget.data.measureUnit,
//         style: const TextStyle(
//             color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 20),
//       ),
//     ]);
//     return FittedBox(
//       child: RichText(
//         text: span,
//       ),
//     );
//   }

//   // List<LineChartBarData> _allCharts() {
//   List<Color> get _colors {
//     return [
//       Colors.black,
//     ];
//   }

//   // List<FlSpot> _createPoints() {
//   //   final points = widget.data.graphData.mapCoordinatesToXYCoords();
//   //   return points.map((point) => FlSpot(point.x, point.y)).toList();
//   // }

//   // FlAxisTitleData _buildTitles() {
//   //   return FlAxisTitleData(
//   //     show: true,
//   //     bottomTitle: _buildBottomTitles(),

//   //     rightTitle: AxisTitle(
//   //       showTitle: true,
//   //       titleText: '',
//   //     ),
//   //     topTitle: AxisTitle(showTitle: true, titleText: ''),
//   //     // leftTitles: SideTitles(showTitles: true, reservedSize: 30),
//   //   );
//   // }

//   // AxisTitle _buildBottomTitles() {
//   //   return AxisTitle(
//   //     // checkToShowTitle: (_, __, ___, ____, _____) => true,
//   //     reservedSize: 50,

//   //     margin: 10,

//   //     showTitle: true,

//   //     titleText: '',
//   //   );
//   // }

//   // FlGridData _buildGridData() {
//   //   return FlGridData(
//   //     show: false,
//   //     getDrawingHorizontalLine: (x) {
//   //       return FlLine(color: Colors.red, strokeWidth: 2);
//   //     },
//   //     drawVerticalLine: true,
//   //     getDrawingVerticalLine: (x) => FlLine(color: Colors.red, strokeWidth: 2),
//   //   );
//   // }

//   // FlBorderData _buildBorders() {
//   //   return FlBorderData(border: Border.all(color: Colors.green));
//   // }

//   // String _emtpyTitles(_) => '';
// }
