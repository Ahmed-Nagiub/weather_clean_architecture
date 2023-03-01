import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather/core/constants.dart';
import 'package:weather/data/model/weather_model.dart';

abstract class BaseRemoteDataSource {
  Future<WeatherModel?> getCurrentWeatherByCountryName(String cityName);
}

class RemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<WeatherModel?> getCurrentWeatherByCountryName(String cityName) async {
    try{
      var response = await Dio().get('${AppConstants.baseUrl}/weather?q=$cityName&${AppConstants.apiKey}');
      print(response);
      return WeatherModel.fromJson(response.data);
    }catch(e){
      print(e);
      return null;
    }
  }

}