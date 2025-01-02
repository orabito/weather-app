class WeatherModel {
final String cityName;
final DateTime date;
final String? image;
final double tamp;
final double maxTamp;
final double mainTamp;
  final String weatherCondition;
  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.tamp,
    required this.maxTamp,
    required this.mainTamp,
    required this.weatherCondition,
    
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        tamp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTamp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mainTamp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
