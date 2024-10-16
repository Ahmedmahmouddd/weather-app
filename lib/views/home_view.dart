import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/search_appbar.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SearchAppbar(),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialstate) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedstate) {
              return  WeatherInfoBody(weatherModel: state.weatherModel);
            } else {
              return Text(state.toString());
            }
          },
        ));
  }
}
