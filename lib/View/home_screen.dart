//
//   Re-disgn the whole UI
//   created by Mohamed
//   22/12/2022
//

import 'package:date_ranger/date_ranger.dart';
// import 'package:indicator.dart';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suntastic/core/main_color.dart';
import 'package:suntastic/core/size_utils.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/View/graph.dart';
import 'package:suntastic/widgets/visaulize_graph_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Models/math_operations.dart';
import '../Models/visualize_data_model.dart';
import '../core/image_constant.dart';
import '../widgets/bar_grapg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.position}) : super(key: key);
  final LatLng position;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // late final VisualizeDataModel graphs;
  late TabController _tabController;
//  GraphType graphType = GraphType.weekly;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    // graphs.changeGraphDisplayType(graphType);
    super.initState();
  }

  DateTime? startTime = DateTime.now().subtract(const Duration(days: 365));
  DateTime? endTime = DateTime.now().subtract(const Duration(days: 2));
  bool showDateTime = true;
  int newIndex = 0;
  List<_SalesData> data = [
    _SalesData('S', 35),
    _SalesData('S', 28),
    _SalesData('M', 34),
    _SalesData('T', 32),
    _SalesData('W', 32),
    _SalesData('T', 40),
    _SalesData('F', 40),
  ];
  // TabController tabController = TabController(length: 4, vsync: );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    final formatter = DateFormat('yyyyMMdd');
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      // extendBodyBehindAppBar: true,

      bottomNavigationBar: const BttmNavBar(),

      // Padding(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   child: DotNavigationBar(
      //     margin: const EdgeInsets.only(left: 10, right: 10),
      //     currentIndex: newIndex,
      //     dotIndicatorColor: Colors.white,
      //     unselectedItemColor: Colors.grey[300],
      //     // enableFloatingNavBar: false,
      //     onTap: (val) {
      //       setState(() {
      //         newIndex = val;
      //       });
      //     },
      //     items: [
      //       /// Home
      //       DotNavigationBarItem(
      //         icon: Icon(Icons.home),

      body: BlocProvider<TemporalCubit>(
        create: (_) => TemporalCubit(
            widget.position,
            double.parse(formatter.format(startTime!)),
            double.parse(formatter.format(endTime!))),
        child: SingleChildScrollView(
          // primary: true,
          // physics: NeverScrollableScrollPhysics(),
          child: Stack(
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Container(
                height: size.height,
                color: myWhite,
              ),

              // Gradient Background
              Container(
                height: size.height / 4,
                width: size.width,
                padding: const EdgeInsets.only(top: 53, bottom: 53),
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //   bottomLeft: Radius.circular(30),
                  //   bottomRight: Radius.circular(30),
                  // ),

                  gradient: LinearGradient(
                    begin: Alignment(
                      0.5,
                      0,
                    ),
                    end: Alignment(
                      0.5,
                      1,
                    ),
                    colors: [
                      // ColorConstant.cyan500,
                      Color(0xff00C0D8),
                      Color(0xffAFE8EF)
                      // ColorConstant.cyan100,
                    ],
                  ),
                ),
                // child: ,
              ),

              // Main text & icon
              Container(
                // width: size.width,
                margin: const EdgeInsets.only(top: 60, bottom: 53),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: const Text(
                                "Sample St. 12",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              margin: const EdgeInsets.only(right: 90)),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hello John!",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 12, right: 8),
                      child: SvgPicture.asset(
                        ImageConstant.imgPerson,
                        height: 65.00,
                        width: 63.00,
                        //   margin: getMargin(
                        //       // left: 12,
                        //       right: 8),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),

              // Body
              Container(
                height: size.height * 4,
                margin: EdgeInsets.only(top: size.height / 4.5),
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  color: myWhite,
                  // color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // _buildChangeDate(),

                    buildHeightSpace(5),
                    TabBar(
                      automaticIndicatorColorAdjustment: false,
                      indicatorColor: blue,
                      indicatorWeight: 4,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.symmetric(
                          horizontal: getResponsiveScreenWidth(20),
                          vertical: getResponsiveScreenHeight(2)),
                      controller: _tabController,
                      tabs: const [
                        Text(
                          'DAY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Text(
                          'WK',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Text(
                          'MO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        Text(
                          'YR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(196, 196, 196, 1),
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ],
                    ),

                    ///Space
                    buildHeightSpace(4),

                    const Text(
                      'Weekly production',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),

                    buildHeightSpace(4),

                    const BarChartSample2(),

                    ///Click Button
                    ///Space
                    buildHeightSpace(5),
                    Container(
                      height: getResponsiveScreenHeight(20),
                      width: getResponsiveScreenWidth(80),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 223, 201),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                bottom: getResponsiveScreenHeight(1.5)),
                            child: const Text(
                              'current production',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const Text(
                            '20KWh',
                            style: TextStyle(
                              color: Color(0xffFF8B03),
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //   clipBehavior: Clip.antiAliasWithSaveLayer,
                    //   onPressed: () async {
                    //     if (startTime != null) {
                    //       await TemporalCubit.instance(context)
                    //           .getTemperaturesFromServer(
                    //               double.parse(formatter.format(startTime!)),
                    //               double.parse(formatter.format(endTime!)),
                    //               widget.position);
                    //     }
                    //   },
                    //   child: const Text(
                    //     'Click to Refresh',
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 15.0),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(12.0)),
                    //     side: const BorderSide(
                    //       color: Colors.white,
                    //     ),
                    //     elevation: 3.0,
                    //     shadowColor: Colors.cyan,
                    //     primary: const Color(0xff262A53),
                    //     padding: const EdgeInsets.all(15.0),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    buildHeightSpace(5),

                    Container(
                      width: 311,
                      height: 97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(
                              0,
                              0,
                              10,
                              0.17,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                          )
                        ],
                        color: const Color.fromARGB(255, 248, 248, 248),
                      ),
                      child: Row(
                        children: [
                          buildWidthSpace(15),
                          SvgPicture.asset('assets/images/lamp.svg'),
                          buildWidthSpace(10),
                          const Text(
                            'Your panels are producing more\n than usual. Take the opportunity\n to do some laundry',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    buildHeightSpace(5),
                   
                    Container(
                      width: 311,
                      height: 97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(
                              0,
                              0,
                              10,
                              0.17,
                            ),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                          )
                        ],
                        color: const Color.fromARGB(255, 248, 248, 248),
                      ),
                      child: Row(
                        children: [
                          buildWidthSpace(15),
                          SvgPicture.asset('assets/images/Cityscapes.svg'),
                          buildWidthSpace(10),
                          const Text(
                            'Your panels are producing more\n than usual. Take the opportunity\n to do some laundry',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                    // Container(
                    //     width: getResponsiveScreenWidth(80),
                    //     height: getResponsiveScreenHeight(14),
                    //     decoration: const BoxDecoration(
                    //       color: Color.fromRGBO(255, 255, 255, 1),
                    //     ),
                    //     child: Row(children: <Widget>[
                    //       SvgPicture.asset(
                    //         '/assets/images/cityscape.svg',
                    //         color: Colors.black,
                    //         height: 25,
                    //       ),
                    //       Column(
                    //         children: const [
                    //           Text(
                    //             '20kWh corresponds to',
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //           Text(
                    //             'a 2 hours ufo flight',
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //         ],
                    //       ),
                    //     ]))
                   
                    // if (startTime != null) const GraphScreen(),
                  ],
                ),
              ),

              // BttmNavBar

              // Container(
              //   color: Colors.green,
              //   height: 150.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChangeDate() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionPanelList(
        expandedHeaderPadding: const EdgeInsets.all(0.0),
        expansionCallback: (index, val) {
          setState(() {
            showDateTime = !val;
          });
        },
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: showDateTime,
            backgroundColor: Colors.transparent,
            headerBuilder: (_, __) => const Align(
              alignment: Alignment.center,
              child: Text(
                '           Change Date',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: _buildDateRanger(),
          )
        ],
      ),
    );
  }

  Widget _buildDateRanger() {
    final initialStartDate = DateTime(
        DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
    final initialEndDate = DateTime.now();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: DateRanger(
        backgroundColor: const Color(0xff2C2E43),
        borderColors: Colors.white,
        initialRange:
            DateTimeRange(start: initialStartDate, end: initialEndDate),
        onRangeChanged: (range) {
          setState(() {
            startTime = range.start;
            endTime = range.end;
          });
        },
      ),
    );
  }
}

class BttmNavBar extends StatefulWidget {
  const BttmNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BttmNavBar> createState() => _BttmNavBarState();
}

class _BttmNavBarState extends State<BttmNavBar> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: blue,
      selectedFontSize: 12,
      // fixedColor: myWhite,
      backgroundColor: myWhite,
      // enableFloatingNavBar: true,
      // margin: const EdgeInsets.only(left: 10, right: 10),
      currentIndex: newIndex,
      // dotIndicatorColor: Colors.lightBlue,
      unselectedItemColor: const Color.fromARGB(255, 133, 133, 133),
      // enableFloatingNavBar: false,
      onTap: (val) {
        setState(() {
          newIndex = val;
        });
      },
      items: [
        /// Home
        BottomNavigationBarItem(
          label: 'overview',
          icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            // padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              ImageConstant.imgOverview,
              semanticsLabel: 'overview',
              color: blue,
            ),
          ),
          // selectedColor: Color(0xff73544C),
          backgroundColor: myWhite,
        ),

        /// Likes
        BottomNavigationBarItem(
          label: 'production',
          icon: Container(
              margin: EdgeInsets.only(bottom: 4),
              // padding: const EdgeInsets.only(bottom: 3),
              child: SvgPicture.asset(ImageConstant.imgProduction)),
          // selectedColor: Color(0xff73544C),
          backgroundColor: myWhite,
        ),

        /// Search
        BottomNavigationBarItem(
          label: 'consumption',

          icon: Container(
            // color: Colors.red,
            margin: const EdgeInsets.only(bottom: 8),
            // padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              ImageConstant.imgConsumption,
              height: 19,
              width: 19,
              color: blue,
              // matchTextDirection: true,
              // alignment: Alignment.center,
            ),
          ),
          backgroundColor: myWhite,
          // selectedColor: Colors.red,
        ),

        /// Profile
        BottomNavigationBarItem(
          label: 'weather',
          icon: Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: SvgPicture.asset(ImageConstant.imgWeather)),
          // selectedColor: Color(0xff73544C),
          backgroundColor: myWhite,
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.day, this.sales);

  final String day;
  final double sales;
}
