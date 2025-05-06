import 'package:dartz/dartz.dart';
import 'package:task7/core/errors/failure.dart';
import 'package:task7/features/weather/domain/entities/weather_entity.dart';
abstract class WeatherRepo {
  // ignore: non_constant_identifier_names
  Future<Either<Failure,Weather>> getweather_by_lat_lon({required String lat,required String lon});
  // ignore: non_constant_identifier_names
  Future<Either<Failure,Weather>> getweather_by_city({required String cityname});
}