import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const weatherAPIKey = '09476576bca5605487804394da9b3776';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        '$openWeatherMapURL?q=$cityName&appid=$weatherAPIKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var cityWeather = await networkHelper.getWeatherData();
    return cityWeather;
  }

  Future<dynamic> getLocationWeather() async {
    LocationHandler location = LocationHandler();
    await location.determinePosition();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$weatherAPIKey&units=metric');

    var networkData = await networkHelper.getWeatherData();
    return networkData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
