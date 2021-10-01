class DayValueModel {
  double temp;
  String day;
  DayValueModel({required this.day, required this.temp});
  static List<DayValueModel> mapToList(Map<String, dynamic> map) {
    final list = map.entries
        .map((e) => DayValueModel(day: e.key, temp: e.value))
        .toList();
    return list;
  }
}
