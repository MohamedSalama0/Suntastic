import 'package:flutter/material.dart';
import 'package:suntastic/Models/visualize_data_model.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/cubits/temporal_states.dart';
import 'package:suntastic/widgets/visaulize_graph_widget.dart';
import 'package:suntastic/widgets/slider.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: TemporalCubitBuilder(
      builder: (_, state) {
        if (state is LoadingTemporalState) return CircularProgressIndicator();
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

        return LayoutBuilder(
          builder: (_, constraints) {
            final graphHeight = constraints.maxHeight - 70;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SliderWidget(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionPanelList.radio(
                      animationDuration: Duration(milliseconds: 1100),
                      dividerColor: Colors.black,
                      initialOpenPanelValue: 'Temperatures Graph',
                      expandedHeaderPadding: const EdgeInsets.all(0),
                      children: [
                        _buildExpansionTile(
                            height: graphHeight,
                            data: temperatures,
                            text: 'Temperatures Graph'),
                        _buildExpansionTile(
                            height: graphHeight,
                            data: pressures,
                            text: 'Pressures Graph'),
                        _buildExpansionTile(
                            height: graphHeight,
                            data: wind,
                            text: 'Wind Graph'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ));
  }

  ExpansionPanelRadio _buildExpansionTile({
    required double height,
    required VisualizeDataModel data,
    required String text,
  }) {
    return ExpansionPanelRadio(
      value: text,
      canTapOnHeader: true,
      headerBuilder: (_, isSelected) => Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple)),
      body: Container(
        height: height,
        child: VisualizeGraphWidget(data: data),
      ),
    );
  }
}
