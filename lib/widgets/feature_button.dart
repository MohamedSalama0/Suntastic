import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/View/temperatures_screen.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';

class FeatureTemporalButton extends StatelessWidget {
  const FeatureTemporalButton(
      {Key? key,
      required this.text,
      this.textSize=18.0,
      required this.data,
      this.imageBottom = '',
      this.scaleImageBottom = 1.0})
      : super(key: key);
  final String text;
  final double? textSize;
  final VisualizeDataModel data;
  final imageBottom;
  final double scaleImageBottom;

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
          return AllPropertiesGraphScreen(
              graphs: data, cubit: TemporalCubit.instance(context), name: text);
        }));
      },
      child: Container(
        // color: Colors.orange,
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 29.0),
                child: Image.asset(
                  '$imageBottom',
                  scale: scaleImageBottom,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 7.0),
              child: Text(
                text,
                textAlign: TextAlign.center,
                // maxLines: 1,
                softWrap: false,
                style: TextStyle(
                  fontSize: textSize,
                  fontFamily: 'neue',
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffF3F3F3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
