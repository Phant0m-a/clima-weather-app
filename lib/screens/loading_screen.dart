import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
