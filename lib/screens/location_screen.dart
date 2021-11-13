import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var message;
  int temprature;
  String weatherIcon;
  String cityName;
  String weatherLine;
  double lat, lon;
  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weatherIcon = 'Error';
        weatherLine = 'Location turned off cannot get Weather';
        cityName = '';
        message = '';
        lat = 0;
        lon = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temprature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherLine = "${weather.getMessage(temprature)} $cityName!";
      message = weatherData['weather'][0]['description'];
      lat = weatherData['coord']['lat'];
      lon = weatherData['coord']['lon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() async {
                        var weatherData = await weather.getLocationWeather();
                        updateUi(weatherData);
                      });
                    },
                    child: Icon(
                      Icons.add_location_rounded,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );

                      if (cityName != null) {
                        var weatherData =
                            await weather.getCityWeather(cityName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        message,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(lat.toStringAsFixed(2),
                            style: KCoordTextStyle)),
                    Expanded(
                        child: Text(lon.toStringAsFixed(2),
                            style: KCoordTextStyle)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherLine,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
