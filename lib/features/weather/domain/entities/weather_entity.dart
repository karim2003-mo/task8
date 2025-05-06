import 'package:equatable/equatable.dart';
class Weather extends Equatable {
  final double temp;
  final double maxtemp;
  final double mintemp;
  final int pressure;
  final double windspeed;
  final String country;
  final String city;
  final String icon;
  final String weatherdescription;
  final String skystatus ;
  Weather({
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.windspeed,
    required this.country,
    required this.city,
    required this.pressure,
    required this.icon,
    required this.weatherdescription,
    required this.skystatus,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [temp, maxtemp, mintemp, windspeed, country, city];
}