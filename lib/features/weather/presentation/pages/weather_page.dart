import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7/core/constants.dart';
import 'package:task7/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:task7/features/weather/presentation/bloc/weather_state.dart';
class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Page',
      style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                    ),
      ),
      backgroundColor: Color.fromRGBO(60, 121, 251, 1),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(onPressed: (){
            // showSearch(context:context , delegate: )
          }, icon: Icon(Icons.search,
          size: 30,color: Colors.white,)),
        )
      ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
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
              return (state is LoadedWeatherByLatlonState)?Stack(
                children: [

                  Align(
                    alignment: Alignment(-0.9, -1),
                    child: Text(state.weather!.temp.toString()+"°",style:TextStyle(
                      color: Colors.white,
                      fontSize: 62,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                  Align(
                    alignment: Alignment(0.5, -1),
                    child: Image.network(IMAGEBASEURL+state.weather!.icon+"@2x.png")),
                    Align(
                      alignment: Alignment(-0.9, -0.7),
                      child: Text(state.weather!.skystatus.toString(),style:TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w400
                    ),),
                    ),
                    Align(
                      alignment: Alignment(-0.9, -0.5),
                      child: Text("Max temp : "+state.weather!.maxtemp.toString()+"°"
                      ,style:TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w400
                    ),),
                    ),
                    Align(
                      alignment: Alignment(-0.9, -0.3),
                      child: Text("City :"+state.weather!.city.toString()
                      ,style:TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w400
                    ),),
                    ),
                    Align(
                      alignment: Alignment(-0.9, -0.1),
                      child: Text("Weather : "+state.weather!.weatherdescription.toString()
                      ,style:TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w400
                    ),),
                    ),
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
