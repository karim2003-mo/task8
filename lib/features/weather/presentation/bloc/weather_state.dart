import 'package:equatable/equatable.dart';
import 'package:task7/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherByCityState extends Equatable{
  @override
  List<Object?> get props => [];
}
class InitialWeatherByCityState extends WeatherByCityState{
  @override
  List<Object?> get props => [];
}
class LoadingWeatherByCityState extends WeatherByCityState{

  @override
  List<Object?> get props => [];
}
class LoadedWeatherByCityState extends WeatherByCityState{
  final Weather ? weather;
  LoadedWeatherByCityState({required this.weather});
  @override
  List<Object?> get props => [weather];
}
class ErrorWeatherByCityState extends WeatherByCityState{
  final String? message;
  ErrorWeatherByCityState({required this.message});
  @override
  List<Object?> get props => [message];
}
class RefreshWeatherByCityState extends WeatherByLatlonState {
  
  @override
  List<Object?> get props => [];
}
abstract class WeatherByLatlonState extends Equatable{
  @override
  List<Object?> get props => [];
}
class InitialWeatherByLatlonState extends WeatherByLatlonState{
  @override
  List<Object?> get props => [];
}
class LoadingWeatherByLatlonState extends WeatherByLatlonState{
  @override
  List<Object?> get props => [];
}
class LoadedWeatherByLatlonState extends WeatherByLatlonState{
  final Weather ? weather;
  LoadedWeatherByLatlonState({required this.weather});
  @override
  List<Object?> get props => [weather];
}
class ErrorWeatherByLatLonState extends WeatherByLatlonState{
  final String? message;
  ErrorWeatherByLatLonState({required this.message});
  @override
  List<Object?> get props => [message];
}
class RefreshWeatherByLatlonState extends WeatherByLatlonState {
  @override
  List<Object?> get props => [];
}
