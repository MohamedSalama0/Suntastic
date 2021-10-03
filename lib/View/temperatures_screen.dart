import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/widgets/visaulize_graph_widget.dart';

class TemperaturesGraphScreen extends StatefulWidget {
  TemporalCubit cubit;
  VisualizeDataModel graphs;

  TemperaturesGraphScreen({Key? key, required this.cubit, required this.graphs}) : super(key: key);

  @override
  _TemperaturesGraphScreenState createState() =>
      _TemperaturesGraphScreenState();
}

class _TemperaturesGraphScreenState extends State<TemperaturesGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color(0xff45526C),
            body: SafeArea(
              child: TemporalCubitBuilder(
                builder: (_, state) {
                  return SizedBox(
                    height: 500.0,
                    child:Column(
                      children: [
                        Expanded(child: VisualizeGraphWidget(data: widget.graphs)),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
      ),
    );
  }
}