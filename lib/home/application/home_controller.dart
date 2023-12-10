import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../common/api_endpoints.dart';
import '../domain/weather_data_model.dart';
import '../infrastructure/weather_repository.dart';

class HomeController extends GetxController {
  WeatherRepository weatherRepository = WeatherRepository();
  late WeatherData weatherData;
  var isLoading = false;
  var currentStatus = 'No status';
  var isError = false;
  var errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    fetchCurrentLocation();
  }

  // fetch location
  fetchCurrentLocation() async {
    isLoading = true;
    update();

    try {
      final locationData = await Location().getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        debugPrint(
            'lat: ${locationData.latitude}, lng: ${locationData.longitude}');
        currentStatus = 'location fetched';
        // location fetch success
        fetchWeather(locationData.latitude!, locationData.longitude!);
      } else {
        isError = true;
        errorMessage = 'Can not fetch your location';
        isLoading = false;
        update();
      }
    } catch (error) {
      // debugPrint(error.toString());
      isError = true;
      errorMessage = error.toString();
      isLoading = false;
      update();
    }
  }

  fetchWeather(double lat, double long) async {
    // debugPrint('url before: ${ApiEndpoints.weatherDataUrl}');
    ApiEndpoints.createWeatherDataUrl(lat, long);
    // debugPrint('url after: ${ApiEndpoints.weatherDataUrl}');

    Either<String, WeatherData> weatherResponse =
        await weatherRepository.fetchWeatherData();

    weatherResponse.fold((l) {
      errorMessage = l;
      isError = true;
      currentStatus = l;
    }, (r) {
      weatherData = r;
      currentStatus = 'weather fetched';
      debugPrint(r.name);
    });

    isLoading = false;
    update();
  }
}
