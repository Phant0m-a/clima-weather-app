import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('[+] Printing Weather...');
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weather;
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
  //Please use your own appid it wont take minute to create account! 😓
  // http.Response response = await http.get(
  //     'api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=cae4daaffe6dd6c36475b1778890f2a0');

}
