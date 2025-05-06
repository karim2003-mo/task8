
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task7/core/errors/exceptions.dart';
import 'package:task7/features/weather/data/models/weather_model.dart';

abstract class WeatherLocalDataSource{
  Future<DataWeatherModel> getlocalweather();
  Future<Unit> addlocalwather(DataWeatherModel data);
}
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource{
  final SharedPreferences preferences;
  WeatherLocalDataSourceImpl({required this.preferences});
  @override
  Future<Unit> addlocalwather(DataWeatherModel data) async{
    Map weatherdata=data.tojson();
    preferences.setString("cached_weather",json.encode(weatherdata) );
    return Future.value(unit);
  }

  @override
  Future<DataWeatherModel> getlocalweather() async{
    String ? data= preferences.getString("cached_weather");
    if(data != null){
      return DataWeatherModel.fromJson(json.decode(data));
    }
    else{
      throw EmptyCacheException();
    }
  }
  
}