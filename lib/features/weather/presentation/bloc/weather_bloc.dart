import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:task7/core/LocationInfo/location_Info.dart';
import 'package:task7/core/errors/failure.dart';
import 'package:task7/core/errors/str_errors.dart';
import 'package:task7/features/weather/domain/entities/weather_entity.dart';
import 'package:task7/features/weather/domain/usecases/get_weather.dart';
import 'package:task7/features/weather/presentation/bloc/weather_event.dart';
import 'package:task7/features/weather/presentation/bloc/weather_state.dart';
class WeatherByCityBloc extends Bloc<WeatherByCityEvent,WeatherByCityState> {
  GetWeatherByCityUseCase getWeatherByCityUseCase;
  WeatherByCityBloc({required this.getWeatherByCityUseCase}):super(InitialWeatherByCityState()){
    on<GetWeatherByCityEvent>(_getWeatherByCity);
    on<RefreshWeatherByCityEvent>(_refreshWeatherByCity);
  }
  FutureOr<void> _getWeatherByCity(GetWeatherByCityEvent event, Emitter<WeatherByCityState> emit) async{
    emit(LoadingWeatherByCityState());
    final weather= await getWeatherByCityUseCase(cityname:event.city);
    emit(getproperstate(weather));
    
  }
  FutureOr<void> _refreshWeatherByCity(RefreshWeatherByCityEvent event, Emitter<WeatherByCityState> emit) async{
    emit(LoadingWeatherByCityState());
    final weather= await getWeatherByCityUseCase(cityname:event.city);
    emit(getproperstate(weather));
  }
  WeatherByCityState getproperstate(Either<Failure,Weather> either) =>
      either.fold((failure)=>
      ErrorWeatherByCityState(message:_errormessege(failure))
    ,
    (succes)=>
      LoadedWeatherByCityState(weather: succes)
    );
  }
  // ignore: unused_element
  String _errormessege(Failure failure){
    switch(failure.runtimeType){
      case NoInternetConnectionFailure:
        return NO_INTERNET_CONNECTION;
      case ServerFailure:
        return SERVER_ERROR_MESSAGE;  
      case EmptyCacheFailure:
        return SHARED_PREFERENCES_ERROR;
      case LocationFailure:
        return LOCATION_ERROR;
      case CityFailure:
        return CITY_NOT_FOUND;
      default:
        return UNKNOWN_ERROR;
    }
  }
class WeatherByLatLonBloc extends Bloc<WeatherByLatLonEvent,WeatherByLatlonState>{
  final Location location;
  final LocationInfo locationInfo;
  final GetWeatherLatLonUseCase getWeatherLatLonUseCase;
  WeatherByLatLonBloc({required this.locationInfo, required this.getWeatherLatLonUseCase,required this.location})
  :super(InitialWeatherByLatlonState()){
    
    on<GetWeatherLatLonEvent>(_getWeatherByLatLon);
    on<RefreshWeatherByLatLonEvent>(_refreshWeatherByLatLon);
  }
  
  void _getWeatherByLatLon(GetWeatherLatLonEvent event, Emitter<WeatherByLatlonState> emit) async{
    if(!await locationInfo.requestlocationservice()){
      emit(ErrorWeatherByLatLonState(message: LOCATION_ERROR));
    }else if(!await locationInfo.requestlocationpermission())
    {
      emit(ErrorWeatherByLatLonState(message: LOCATION_PERMISSION_ERRPR));
    }
    emit(LoadingWeatherByLatlonState());
    final LocationData loc=await location.getLocation();
    final weather= await getWeatherLatLonUseCase(lat: loc.latitude.toString(),lon:loc.longitude.toString());
    emit(getproperstate(weather));
  }
  
  void _refreshWeatherByLatLon(RefreshWeatherByLatLonEvent event, Emitter<WeatherByLatlonState> emit) async{
    emit(LoadingWeatherByLatlonState());
    final LocationData loc=await location.getLocation();
    final weather= await getWeatherLatLonUseCase(lat: loc.latitude.toString(),lon:loc.longitude.toString());
    emit(getproperstate(weather));
  }
    WeatherByLatlonState getproperstate(Either<Failure,Weather> either) =>
      either.fold((failure)=>
      ErrorWeatherByLatLonState(message:_errormessege(failure))
    ,
    (succes)=>
      LoadedWeatherByLatlonState(weather: succes)
    );
}