class ApiEndpoints {
// weather api
  static String weatherDataUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=11.6662721&lon=78.0529879&appid=316a7277a84229be3fcf54c1978e2037&units=metric';
      // 'https://api.openweathermap.org/data/2.5/weather?lat=11.6662721&lon=78.0529879&appid=316a7277a84229be3fcf54c1978e2037&units=metric';


  static void createWeatherDataUrl(double latitude, double longitude) {
    weatherDataUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=316a7277a84229be3fcf54c1978e2037&units=metric';
  }

}
