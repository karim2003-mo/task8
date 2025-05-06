import 'package:task7/core/constants.dart';
import 'package:task7/features/weather/data/models/weather_model.dart';
import 'package:task7/core/network/dio_data.dart';
abstract class WeatherRemoteSource{
  Future<DataWeatherModel> getweather_by_lat_lon({required String lat , required String lon});
  Future<DataWeatherModel> getweather_by_city({required String cityname});
}
class WeatherRemoteSourceImplDio implements WeatherRemoteSource{
  // ignore: unused_field
  final GetDio dio;
  WeatherRemoteSourceImplDio({required this.dio});
  @override
  Future<DataWeatherModel> getweather_by_city({required String cityname}) async{
    final data= await dio.call.get(
      '',
      queryParameters: {
        "appid":WEATHERAPIKEY,
        "units":"metric",
        "q":cityname
      }
    );
    return DataWeatherModel.fromJson(data.data);
  }

  @override
  Future<DataWeatherModel> getweather_by_lat_lon({required String lat , required String lon}) async{
      final data= await dio.call.get(
      '',
      queryParameters: {
        "appid":WEATHERAPIKEY,
        "units":"metric",
        "lat":lat,
        "lon":lon
      }
    );
    return DataWeatherModel.fromJson(data.data);
  }

}
