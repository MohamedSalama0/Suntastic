import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suntastic/Models/math_operations.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/widgets/visaulize_graph_widget.dart';

class AllPropertiesGraphScreen extends StatefulWidget {
  final TemporalCubit cubit;
  final VisualizeDataModel graphs;
  final String name;

  const AllPropertiesGraphScreen(
      {Key? key, required this.cubit, required this.graphs, required this.name})
      : super(key: key);

  @override
  _AllPropertiesGraphScreenState createState() =>
      _AllPropertiesGraphScreenState();
}

class _AllPropertiesGraphScreenState extends State<AllPropertiesGraphScreen> {
  GraphType graphType = GraphType.weekly;

  @override
  void initState() {
    widget.graphs.changeGraphDisplayType(graphType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: widget.cubit,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff45526C),
            elevation: 0,
          ),
          backgroundColor: const Color(0xff45526C),
          body: SafeArea(
            child: Center(
              child: TemporalCubitBuilder(
                builder: (_, state) {
                  return SizedBox(
                    height: 700.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(
                            '${widget.name} Graph Data',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontFamily: 'neue'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildChooseGraphType(),
                        ),
                        Expanded(
                          child: VisualizeGraphWidget(data: widget.graphs),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildChooseGraphType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'Display Graph :  ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        DropdownButton<GraphType>(
          style: const TextStyle(
            fontSize: 12
          ),
          value: graphType,
          onChanged: (val) {
            setState(() {
              graphType = val!;
              widget.graphs.changeGraphDisplayType(val);
            });
          },
          items: const [
            DropdownMenuItem(
              value: GraphType.weekly,
              child: Text('Weekly'),
            ),
            DropdownMenuItem(
              value: GraphType.monthly,
              child: Text('Montly'),
            ),
            DropdownMenuItem(
              value: GraphType.daily,
              child: Text('Daily'),
            )
          ],
        ),
      ],
    );
  }
}
