class TemporalDailyPointModel {
  int start;
  int end;
  double lat;
  double long;
  String params;
  String community = 'ag';
  TemporalDailyPointModel({
    required this.start,
    required this.end,
    required this.lat,
    required this.long,
    required this.params,
    this.community = 'ag',
  });
  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
      'latitude': lat,
      'longitude': long,
      'community': community,
      'parameters': params
    };
  }
}
