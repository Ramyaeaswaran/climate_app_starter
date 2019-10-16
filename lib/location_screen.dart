import 'package:flutter/material.dart';
import 'package:clima/weather_screen.dart';
class LocationScreen extends StatefulWidget {
  final Map weatherdata;
  LocationScreen({this.weatherdata});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  @override
  Widget build(BuildContext context) {
    Map weathermap= widget.weatherdata;
    double temp_max=weathermap['main']['temp_max'];
    int temp=(temp_max-273).round();
    String place =weathermap['name'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
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
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
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
                      temp.toString(),
                      style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 100.0,
                      ),
                    ),
                    Text(
                      '☀️',
                      style: TextStyle(
                        fontSize: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in $place",
                  textAlign: TextAlign.right,
                  style:  TextStyle(
                    fontFamily: 'Spartan MB',
                    fontSize:45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
