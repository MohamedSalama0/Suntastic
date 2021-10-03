import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/View/temperatures_screen.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';

class FeatureTemporalButton extends StatelessWidget {
  const FeatureTemporalButton(
      {Key? key, required this.text, required this.data})
      : super(key: key);
  final String text;
  final VisualizeDataModel data;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff4B3869),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext hossam) {
          return TemperaturesGraphScreen(
              graphs: data, cubit: TemporalCubit.instance(context), name: text);
        }));
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 20.0,
          fontFamily: 'neue',
        ),
      ),
    );
  }
}
