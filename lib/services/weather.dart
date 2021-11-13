import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

class WeatherModel {
  var apiKey = 'cae4daaffe6dd6c36475b1778890f2a0';
  var ApiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeather(var cityName) {
    var url = '$ApiUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    //MyApi key

    NetworkHelper networkHelper = NetworkHelper(
        '$ApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var decodedData = await networkHelper.getData();
    return decodedData;
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
      return '🌤️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    print(temp);
    if (temp >= 40) {
      return 'Stay at home its so hot outside in';
    } else if (temp > 35) {
      return 'It\'s 🍦 time in';
    } else if (temp > 30) {
      return 'Its ok to wear 👕 in';
    } else if (temp > 20) {
      return 'Its a little cold, so wear 🧥 and stalk in ';
    } else if (temp < 15) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧢 and 🧥 just in case in';
    }
  }
}
