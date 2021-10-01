import 'package:suntastic/Models/visualize_data_model.dart';

class AllPropertiesModel {
  late TemperatureModel temperatures;
  late PressuresModel pressures;
  late WindModel wind;
  late double defaultUnknownTemp = 0;
  AllPropertiesModel.fromJson(Map<String, dynamic> json) {
    if (json['properties'] == null) return;
    final Map<String, dynamic> properties = json['properties']['parameter'];
    if (json['header'] != null) if (json['header']['fill_value'] != null)
      defaultUnknownTemp = json['header']['fill_value'];
    temperatures = TemperatureModel.fromMap('T2M', properties);
    pressures = PressuresModel.fromMap('PS', properties);
    wind = WindModel.fromMap('WS10M', properties);
  }
}
