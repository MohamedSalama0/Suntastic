import 'package:flutter/material.dart';
import 'package:suntastic/View/solar_panels_screen.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/cubits/temporal_states.dart';
import 'package:suntastic/widgets/feature_button.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child:
    TemporalCubitBuilder(
      builder: (_, state) {
        if (state is LoadingTemporalState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorTemporalState) {
          return Center(
            child: Text(
              'Error happened ${state.errorMessage}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          );
        }

        print(TemporalCubit.instance(context).temperatures.list.length);
        final temperatures = TemporalCubit.instance(context).temperatures;
        final pressures = TemporalCubit.instance(context).pressures;
        final wind = TemporalCubit.instance(context).wind;
        final solarIrradians = TemporalCubit.instance(context).solarIrradians;

        return LayoutBuilder(
          builder: (_, constraints) {
            return GridView.count(
              padding: const EdgeInsets.all(20.0),
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                FeatureTemporalButton(
                  text: 'Solar irradiance',
                  data: solarIrradians,
                  imageBottom: 'assets/images/solar-energy.png',
                  scaleImageBottom: 9.0,
                  // textSize: 19.0,
                ),
                FeatureTemporalButton(
                  text: 'Temperatures',
                  data: temperatures,
                  imageBottom: 'assets/images/high-temperature.png',
                  scaleImageBottom: 9.2,
                ),
                FeatureTemporalButton(
                  text: 'Pressures',
                  data: pressures,
                  imageBottom: 'assets/images/atmospheric.png',
                  scaleImageBottom: 9.0,
                ),
                FeatureTemporalButton(
                  text: 'Wind',
                  data: wind,
                  imageBottom: 'assets/images/pngwing.com.png',
                  scaleImageBottom: 8.0,
                ),
                ElevatedButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          'Solar Panels',
                          textScaleFactor: 1,
                          style: TextStyle(
                            color: Color(0xffFFC947),
                            fontSize: 18.0,
                            fontFamily: 'neue',
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/amazon-logo.png',
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4B3869),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const SolarPanelsScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    ));
  }
}
