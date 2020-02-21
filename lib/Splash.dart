import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'App.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// Start Timer for Splash Screen Show
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    runApp(AppHome());
  }

  @override
  void initState() {

    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,
        child: new Image.asset(
          'assest/splash.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
