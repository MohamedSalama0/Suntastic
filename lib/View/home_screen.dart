import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/View/graph.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.position}) : super(key: key);
  final LatLng position;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? startTime = DateTime.now().subtract(const Duration(days: 365));
  DateTime? endTime = DateTime.now().subtract(const Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('yyyyMMdd');
    return Scaffold(
      backgroundColor: const Color(0xff45526C),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Suntastic',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "neue"
          ),
        ),
        leading: Image.asset(
          'assets/images/sunlogo.png',
          scale: 3.0,
        ),
      ),
      body: BlocProvider<TemporalCubit>(
        create: (_) => TemporalCubit(
            widget.position,
            double.parse(formatter.format(startTime!)),
            double.parse(formatter.format(endTime!))),
        child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0)),
                    tileColor: const Color(0xff628395),
                    contentPadding: const EdgeInsets.only(left: 60.0),
                    title: Text(
                      'Selected date range:\nFrom ${startTime == null ? null : DateFormat('yyyy/MM/dd').format(startTime!)}\nTo ${endTime == null ? null : DateFormat('yyyy/MM/dd').format(endTime!)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: const Icon(Icons.lock),
                    onTap: _chageTime),

                ///Space
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),

                ///Click Button
                ElevatedButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () async {
                    if (startTime != null) {
                      await TemporalCubit.instance(context)
                          .getTemperaturesFromServer(
                              double.parse(formatter.format(startTime!)),
                              double.parse(formatter.format(endTime!)),
                              widget.position);
                    }
                  },
                  child: const Text(
                    'Click to Refresh',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    elevation: 3.0,
                    shadowColor: Colors.cyan,
                    primary: const Color(0xff262A53),
                    padding: const EdgeInsets.all(15.0),
                  ),
                ),
                const SizedBox(height: 20),

                if (startTime != null) const Expanded(child: GraphScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _chageTime() async {
    final nowDate = DateTime.now();

    final res = await showDateRangePicker(
        context: context,
        initialEntryMode: DatePickerEntryMode.inputOnly,
        initialDateRange: DateTimeRange(
          start: startTime!,
          end: endTime!,
        ),
        firstDate: DateTime(1980, 1, 1),
        lastDate: nowDate.subtract(const Duration(days: 2)));
    if (res == null) return;
    setState(() {
      startTime = res.start;
      endTime = res.end;
    });
  }
}
