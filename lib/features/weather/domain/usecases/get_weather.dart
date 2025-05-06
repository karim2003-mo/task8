import 'package:dartz/dartz.dart';
import 'package:task7/core/errors/failure.dart';
import 'package:task7/features/weather/domain/entities/weather_entity.dart';
import 'package:task7/features/weather/domain/repositories/weather_repo.dart';
class GetWeatherLatLonUseCase{
  WeatherRepo repo;
  GetWeatherLatLonUseCase({required this.repo});
  Future<Either<Failure,Weather>> call({required String lat,required String lon}) async{
    return await repo.getweather_by_lat_lon(lon: lon,lat: lat);
  }
}
class GetWeatherByCityUseCase {
  WeatherRepo repo;
  GetWeatherByCityUseCase({required this.repo});
  Future<Either<Failure,Weather>> call({required String cityname}) async{
    return await repo.getweather_by_city(cityname:cityname );
  }
}
