class TemperatureModel {
  double temp;
  String day;
  TemperatureModel({required this.day, required this.temp});
  double getAverage(List<double> list) {
    double res = 0.0;
    list.forEach((element) {
      res += element;
    });
    return res / list.length;
  }
}
