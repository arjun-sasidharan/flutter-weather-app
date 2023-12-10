import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../application/home_controller.dart';
import './weather_main_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF414040),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controllerState) {
          if (controllerState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controllerState.isError) {
            return Center(
              child: Text(
                controllerState.errorMessage,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: WeatherMainCard(controllerState.weatherData),
            );
          }
        },
      ),
    );
  }
}
