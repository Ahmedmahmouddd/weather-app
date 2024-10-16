import 'package:dio/dio.dart';
import 'package:weather_app/models/service_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String location}) async {
    Response response = await dio.get(
        "http://api.weatherapi.com/v1/forecast.json?key=53f44a24712843c99d221304240209&q=$location&days=1&aqi=no&alerts=no");

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    
    return (weatherModel);
  }
}
