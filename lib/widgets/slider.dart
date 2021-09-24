import 'package:flutter/material.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double width = 400;
  double height = 300;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Graph Width: $width Pixel',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Expanded(
          child: Slider(
            divisions: 10,
            value: width,
            onChanged: (x) {
              TemporalCubit.instance(context).changeGraphWidth(x);
              setState(() {
                width = x;
              });
            },
            min: 400,
            max: 2000,
            // onChangeEnd: (x) => TemporalCubit.instance(context).changeGraphWidth(x),
          ),
        ),
      ],
    );
  }
}
