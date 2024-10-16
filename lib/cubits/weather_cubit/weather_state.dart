part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitialstate extends WeatherState {}

final class WeatherLoadedstate extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedstate({required this.weatherModel});
}

final class WeatherFailurestate extends WeatherState {
  final String errMessage;

  WeatherFailurestate( this.errMessage);
}
