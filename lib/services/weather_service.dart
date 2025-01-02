import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'key=5fa7825b29a649fda9611200240801';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
  Response response =
      await dio.get('$baseUrl/forecast.json?$apiKey&q=$cityName&days=1');
  
  WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  return weatherModel;
} on DioException catch (e) {
  final String errorMassage= e.response?.data['error']['message']??'oops ther was an error tray later';
  throw Exception(errorMassage); 
} catch (e){
  log(e.toString());
  throw Exception('oops ther was an error tray later');
}
    
  }
} 
