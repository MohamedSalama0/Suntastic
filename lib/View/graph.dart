import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suntastic/View/temperatures_screen.dart';
import 'package:suntastic/cubits/temporal_cubit.dart';
import 'package:suntastic/cubits/temporal_states.dart';


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
        if (state is LoadingTemporalState) return const CircularProgressIndicator();
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
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 170.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    GridView.count(
                      scrollDirection:Axis.vertical,
                      padding: const EdgeInsets.all(20.0),
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 15.0,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4B3869),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext hossam) {
                              return TemperaturesGraphScreen(
                                  graphs: temperatures,
                                  cubit: TemporalCubit.instance(context));
                            }));
                          },
                          child: const Text(
                            'solar\nirradiance\nGraph',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'neue',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4B3869),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext hossam) {
                                  return TemperaturesGraphScreen(
                                      graphs: temperatures,
                                      cubit: TemporalCubit.instance(context));
                                }));
                          },
                          child: const Text(
                            'temperature\nالمفروض يعني',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'neue',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4B3869),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext hossam) {
                              return TemperaturesGraphScreen(
                                  graphs: wind,
                                  cubit: TemporalCubit.instance(context));
                            }));
                          },
                          child: const Text(
                            'wind Graph',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'neue',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4B3869),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext hossam) {
                              return TemperaturesGraphScreen(
                                  graphs: pressures,
                                  cubit: TemporalCubit.instance(context));
                            }));
                          },
                          child: const Text(
                            'pressures\nGraph',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'neue',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff4B3869),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext hossam) {
                              return TemperaturesGraphScreen(
                                  graphs: pressures,
                                  cubit: TemporalCubit.instance(context));
                            }));
                          },
                          child: const Text(
                            'Solar Panels',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontFamily: 'neue',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
