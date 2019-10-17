import 'package:clima/Network_helper.dart';
import 'package:flutter/material.dart';
import 'package:clima/Location.dart';
import 'package:clima/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  String cityname;
  LoadingScreen(this.cityname);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location currentLocation = Location();
  @override
  void initState() {
    super.initState();
    print('Init state');
    getCurentLocation();
  }

  void getCurentLocation() async {
    await currentLocation.getLocation();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    NetworkHelper helper;
    if(widget.cityname == ''){
      helper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=de172246e2e8f73e465ef9d110d83556');
    }else{
      helper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?q=${widget.cityname}&appid=de172246e2e8f73e465ef9d110d83556');
    }
    Map result = await helper.weatherinfo();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherdata: result,),),);
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return SpinKitWave(
      color: Colors.white,
      size: 50.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose called');
  }
}
