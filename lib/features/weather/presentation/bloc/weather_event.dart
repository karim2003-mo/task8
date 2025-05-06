import 'package:equatable/equatable.dart';

abstract class WeatherByCityEvent extends Equatable{
  const WeatherByCityEvent();
  @override
  List<Object?> get props => [];
}
class GetWeatherByCityEvent extends WeatherByCityEvent{
  final String city;
  const GetWeatherByCityEvent({required this.city});
  @override
  List<Object?> get props => [city];
}
class RefreshWeatherByCityEvent extends WeatherByCityEvent{
  final String city;
  const RefreshWeatherByCityEvent({required this.city});
  @override
  List<Object?> get props => [city];
}
abstract class WeatherByLatLonEvent extends Equatable{
  const WeatherByLatLonEvent();
  @override
  List<Object?> get props => [];
}
class GetWeatherLatLonEvent extends WeatherByLatLonEvent{

  GetWeatherLatLonEvent();
  @override
  List<Object?> get props => [];
}
class RefreshWeatherByLatLonEvent extends WeatherByLatLonEvent{
  @override
  List<Object?> get props => [];
}