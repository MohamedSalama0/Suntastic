import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/widgets/visaulize_graph_widget.dart';

class TemperaturesGraphScreen extends StatefulWidget {
  final TemporalCubit cubit;
  final VisualizeDataModel graphs;
  final String name;

  TemperaturesGraphScreen(
      {Key? key, required this.cubit, required this.graphs, required this.name})
      : super(key: key);

  @override
  _TemperaturesGraphScreenState createState() =>
      _TemperaturesGraphScreenState();
}

class _TemperaturesGraphScreenState extends State<TemperaturesGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.cubit,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: const Color(0xff45526C),
          body: SafeArea(
            child: Center(
              child: TemporalCubitBuilder(
                builder: (_, state) {
                  return SizedBox(
                    height: 600.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${widget.name} Graph Data',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.orange)),
                        ),
                        Expanded(
                            child: VisualizeGraphWidget(data: widget.graphs)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
