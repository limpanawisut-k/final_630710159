import 'package:collection/collection.dart';


class TodoItem {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelslikeC;
  final double feelslikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  //final List<condition> condition;



  TodoItem({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    //required this.condition,

  });

  factory TodoItem.fromJson (Map<String, dynamic> json){
    return TodoItem(
      city: json['city'],
      country: json['country'],
      lastUpdated : json['lastUpdated'],
      tempC : double.parse(json['tempC']),
      tempF : double.parse(json['tempF']),
      feelslikeC : double.parse(json['feelslikeC']),
      feelslikeF : double.parse(json['feelslikeF']),
      windKph : double.parse(json['windKph']),
      windMph : double.parse(json['windMph']),
      humidity : double.parse(json['humidity']),
      uv : json['uv'],
    );
  }
}
