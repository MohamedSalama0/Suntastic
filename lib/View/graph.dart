import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/View/temperatures_screen.dart';
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
    return Center(child: TemporalCubitBuilder(
      builder: (_, state) {
        if (state is LoadingTemporalState)
          return const CircularProgressIndicator();
        if (state is ErrorTemporalState) {
          return Center(
            child: Text(
              'Error happened ${state.errorMessage}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          );
        }
        final temperatures = TemporalCubit.instance(context).temperatures;
        final pressures = TemporalCubit.instance(context).pressures;
        final wind = TemporalCubit.instance(context).wind;
        final solarIrradians = TemporalCubit.instance(context).solarIrradians;

        return LayoutBuilder(
          builder: (_, constraints) {
            return GridView.count(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20.0),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                FeatureTemporalButton(
                    text: 'Solar irradiance', data: solarIrradians),
                FeatureTemporalButton(text: 'Temperatures', data: temperatures),
                FeatureTemporalButton(text: 'Pressures', data: pressures),
                FeatureTemporalButton(text: 'Wind', data: wind),
                FeatureTemporalButton(text: 'Solar Panels', data: pressures),
              ],
            );
          },
        );
      },
    ));
  }
}
