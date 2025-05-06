import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7/core/constants.dart';
import 'package:task7/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:task7/features/weather/presentation/bloc/weather_state.dart';
class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Page')),
      body: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 27, 86, 1),
            Color.fromRGBO(60, 121, 251, 1),
          ])
        ) ,
        child: Center(
          child: BlocBuilder<WeatherByLatLonBloc, WeatherByLatlonState>(
            builder: (context, state) {
              print(state);
              return (state is LoadedWeatherByLatlonState)?Column(
                children: [
                  Text(state.weather!.skystatus.toString()),
                  Image.network(IMAGEBASEURL+state.weather!.icon+"@2x.png")
                ],
              )
              :CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
