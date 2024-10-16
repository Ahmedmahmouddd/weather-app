class WeatherModel {
  final String? name;
  final String? region;
  final num? temp;
  final String? condition;
  final String? image;
  final num? maxTemp;
  final num? minTemp;
  final num? humidity;
  final String? date;

  WeatherModel({
    required this.date,
    required this.image,
    required this.region,
    required this.name,
    required this.humidity,
    required this.temp,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      name: json["location"]["name"],
      region: json["location"]["region"],
      temp: json["current"]["temp_c"],
      condition: json["current"]["condition"]["text"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      humidity: json["current"]["humidity"],
      image: json["current"]["condition"]["icon"], date: json["current"]["last_updated"],
    );
  }
}
