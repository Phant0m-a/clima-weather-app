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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return '๐ค๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    print(temp);
    if (temp >= 40) {
      return 'Stay at home its so hot outside in';
    } else if (temp > 35) {
      return 'It\'s ๐ฆ time in';
    } else if (temp > 30) {
      return 'Its ok to wear ๐ in';
    } else if (temp > 20) {
      return 'Its a little cold, so wear ๐งฅ and stalk in ';
    } else if (temp < 15) {
      return 'You\'ll need ๐งฃ and ๐งค in';
    } else {
      return 'Bring a ๐งข and ๐งฅ just in case in';
    }
  }
}
