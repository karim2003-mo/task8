import 'package:dartz/dartz.dart';
import 'package:task7/core/errors/exceptions.dart';
import 'package:task7/core/errors/failure.dart';
import 'package:task7/core/network/network_status.dart';
import 'package:task7/features/weather/data/sources/localsource.dart';
import 'package:task7/features/weather/data/sources/remotesource.dart';
import 'package:task7/features/weather/domain/entities/weather_entity.dart';
import 'package:task7/features/weather/domain/repositories/weather_repo.dart';

class WeatherRepoimpl implements WeatherRepo {
  final WeatherRemoteSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  WeatherRepoimpl({required this.remoteDataSource,required this.localDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, Weather>> getweather_by_city({required String cityname}) async{
    if(await networkInfo.isConnected){
      try{
        return Right(await remoteDataSource.getweather_by_city(cityname:cityname ));
      }on ServerException{
        return Left(ServerFailure());  
      }
    }
    else{
      try{
        return Right(await localDataSource.getlocalweather());
      }on EmptyCacheException{
        return Left(EmptyCacheFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, Weather>> getweather_by_lat_lon({required String lat, required String lon}) async{
    return Right(await remoteDataSource.getweather_by_lat_lon(lat: lat,lon:lon));
  }
}
