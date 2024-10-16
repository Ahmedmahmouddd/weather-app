import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/service_model.dart';
import 'package:weather_app/service/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialstate());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    emit(WeatherLoadingstate());
    try {
      weatherModel = await WeatherService(Dio()).getWeather(location: cityName);
      emit(WeatherLoadedstate(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailurestate(errMessage: e.toString()));
    }
  }
}
