import 'package:assignment_4/common/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../domain/weather_data_model.dart';
import '../../common/strings.dart';

class WeatherRepository {
  final Dio dioInstance = Dio();

  Future<Either<String, WeatherData>> fetchWeatherData() async {
    print('in repo, fetch weather, url : ${ApiEndpoints.weatherDataUrl}');
    try {
      Response responseData =
          await dioInstance.get(ApiEndpoints.weatherDataUrl);
      debugPrint('res status code: ${responseData.statusCode}');
      if (responseData.statusCode == 200) {
        WeatherData weatherData = WeatherData.fromJson(responseData.data);
        print(weatherData.toJson());
        return right(weatherData);
      } else {
        return left(errorSomethingWentWrong);
      }
    } catch (error) {
      debugPrint(error.toString());
      return left(errorSomethingWentWrong);
    }
  }
}
