import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/weather_data_model.dart';

class WeatherMainCard extends StatelessWidget {
  WeatherData weatherData;

  WeatherMainCard(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // 230
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (weatherData.main!.temp != null)
                  Row(
                    children: [
                      Text(
                        '${weatherData.main!.temp!.toStringAsFixed(0)}\u2103',
                        // degree celsius
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                Image.network(
                  'http://openweathermap.org/img/wn/${weatherData.weather![0].icon!}@2x.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
                // CircleAvatar(
                //   radius: 40,
                //   // backgroundColor: Colors.grey,
                //   // backgroundColor: weatherData.weather![0].icon!.contains('n')
                //   //     ? const Color(0XFF414040)
                //   //     : Colors.grey,
                //   child: Image.network(
                //       'http://openweathermap.org/img/wn/${weatherData.weather![0].icon!}@2x.png',
                //       fit: BoxFit.cover),
                //   // weatherData.weather![0].icon!
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (weatherData.main!.feelsLike != null)
            Text(
              '${weatherData.weather![0].description}',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          if (weatherData.main!.feelsLike != null)
            Text(
              'Feels like ${weatherData.main!.feelsLike!.toStringAsFixed(1)}\u2103',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              FittedBox(
                  child: Text(
                weatherData.name!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
            child: Divider(
              color: Colors.white,
            ),
          ),
          WeatherMoreInfo(weatherData: weatherData)
        ],
      ),
    );
  }
}

class WeatherMoreInfo extends StatelessWidget {
  const WeatherMoreInfo({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            'Humidity: ${weatherData.main!.humidity!}%',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Pressure: ${weatherData.main!.pressure!}hPa',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Sunrise at ${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(weatherData.sys!.sunrise! * 1000))}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Sunset at ${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(weatherData.sys!.sunset! * 1000))}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
