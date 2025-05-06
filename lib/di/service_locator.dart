import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task7/core/LocationInfo/location_Info.dart';
import 'package:task7/core/network/dio_data.dart';
import 'package:task7/core/network/network_status.dart';
import 'package:task7/features/weather/data/repositories/weather_repoimpl.dart';
import 'package:task7/features/weather/data/sources/localsource.dart';
import 'package:task7/features/weather/data/sources/remotesource.dart';
import 'package:task7/features/weather/domain/repositories/weather_repo.dart';
import 'package:task7/features/weather/domain/usecases/get_weather.dart';
import 'package:task7/features/weather/presentation/bloc/weather_bloc.dart';

final getIt = GetIt.instance;
Future<void> setupDependencies() async{
  // Usecases
  // ignore: unused_element
    getIt.registerLazySingleton(() => GetWeatherByCityUseCase(repo: getIt()));
    getIt.registerLazySingleton(()=>GetWeatherLatLonUseCase(repo: getIt()));
    // repos
    getIt.registerLazySingleton<WeatherRepo>(()=> WeatherRepoimpl(remoteDataSource: getIt(), localDataSource: getIt(), networkInfo: getIt()));
    // datasources
    getIt.registerLazySingleton<WeatherRemoteSource>(()=> WeatherRemoteSourceImplDio(dio: getIt()));
    getIt.registerLazySingleton<WeatherLocalDataSource>(()=> WeatherLocalDataSourceImpl(preferences: getIt()));
    // core
    getIt.registerLazySingleton<NetworkInfo>(()=> NetworkInfoImpl(connectionChecker: getIt()));
    getIt.registerLazySingleton<LocationInfo>(()=> LocationInfoimpl(location: getIt()));
    getIt.registerLazySingleton(()=> GetDio());
    // externals
    getIt.registerLazySingleton(() => InternetConnectionChecker.createInstance());
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(()=> sharedPreferences);
    getIt.registerLazySingleton(()=>Location());
    // blocs
    getIt.registerFactory(()=> WeatherByCityBloc(getWeatherByCityUseCase: getIt()));
    getIt.registerFactory(()=>WeatherByLatLonBloc(locationInfo: getIt(),getWeatherLatLonUseCase: getIt(), location: getIt(),));
}
