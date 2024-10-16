import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                    appBarTheme: AppBarTheme(
                        color: getColor(BlocProvider.of<WeatherCubit>(context).weatherModel?.condition)),
                    primaryColor: getColor(BlocProvider.of<WeatherCubit>(context).weatherModel?.condition)),
                debugShowCheckedModeBanner: false,
                home: const HomeView(),
              );
            },
          ),
        ));
  }
}

// create states
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit

MaterialColor getColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    // Colors.yellow
    case 'Sunny':
      return Colors.yellow;

    // Colors.blueGrey
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.blueGrey;

    // Colors.blue
    case 'Mist':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blue;

    // Colors.green
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
      return Colors.lightBlue;

    // Colors.teal
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;

    // Colors.cyan
    case 'Patchy light drizzle':
    case 'Light drizzle':
      return Colors.cyan;

    case 'Clear':
      return Colors.lightBlue;
    // Colors.deepPurple
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    // Colors.grey
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    // Colors.deepOrange
    case 'Heavy rain at times':
    case 'Torrential rain shower':
      return Colors.deepOrange;

    // Default color for unknown conditions
    default:
      return Colors.blueGrey;
  }
}
