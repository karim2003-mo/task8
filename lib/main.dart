import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:task7/features/weather/presentation/bloc/weather_event.dart';
import 'package:task7/features/weather/presentation/pages/weather_page.dart';
import 'di/service_locator.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>di.getIt<WeatherByCityBloc>()),
      BlocProvider(create: (_)=>di.getIt<WeatherByLatLonBloc>()..add(GetWeatherLatLonEvent())),
    ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage()
    );
  }
}
