import 'package:task7/features/weather/domain/entities/weather_entity.dart';

class DataWeatherModel extends Weather{
  DataWeatherModel({required super.temp, required super.maxtemp, required super.mintemp,
   required super.windspeed, required super.country, required super.city, required super.pressure,
    required super.icon, required super.weatherdescription, required super.skystatus});
  factory DataWeatherModel.fromJson(Map<String, dynamic> json) {
    return DataWeatherModel(
      temp: json['main']['temp'],
      maxtemp:json['main']['temp_max'],
      mintemp: json['main']['temp_min'],
      windspeed: json['wind']['speed'],
      country: json['sys']['country'],
      city: json['name'],
      pressure:json['main']['pressure'],
      icon: json['weather'][0]['icon'],
      weatherdescription: json['weather'][0]['description'],
      skystatus: json['weather'][0]['main'],
    );
    
  }
  Map<String , dynamic> tojson(){
    return {
      'temp': temp,
      'maxtemp': maxtemp,
      'mintemp': mintemp,
      'windspeed': windspeed,
      'country': country,
      'city': city,
      'pressure': pressure,
      'weatherdescription':weatherdescription,
      'skystatus':skystatus
    };
  }

}