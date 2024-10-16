part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

final class WeatherInitialstate extends WeatherState {}

final class WeatherLoadingstate extends WeatherState {}

final class WeatherLoadedstate extends WeatherState {
  WeatherLoadedstate({required this.weatherModel});
  final WeatherModel weatherModel;
}

final class WeatherFailurestate extends WeatherState {
  WeatherFailurestate({required this.errMessage});
  final String errMessage;
}
