import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const KCoordTextStyle =
    TextStyle(fontSize: 33.0, color: Colors.teal, fontWeight: FontWeight.bold);

const KInputTextDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Search cities in an instantly!',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none,
    ),
    icon: Icon(
      Icons.search,
      size: 32.0,
    ));
