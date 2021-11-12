import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// double lat = location.latitude;
// double log = location.longitude;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
    }
  }

  void getData() async {
    // http.Response response = await http.get(
    //     'api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=cae4daaffe6dd6c36475b1778890f2a0');
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=cae4daaffe6dd6c36475b1778890f2a0');
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      print(res.body);
      String body = res.body;

      var decodedData = jsonDecode(body);

      double temprature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];
    } else {
      print(res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
