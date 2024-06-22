// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // For loading indicator
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherWidgets extends StatefulWidget {
  const WeatherWidgets({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<WeatherWidgets> createState() => _WeatherWidgetsState();
}

class _WeatherWidgetsState extends State<WeatherWidgets> {
  bool isLoading = true;
  double? temp;
  double? feelsLikeTemp;
  String? weatherDescription;
  DateTime? sunrise;
  DateTime? sunset;
  int? humidity;
  double? windSpeed;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=London&appid=4c30fb6bdde1f850e52d45d0754fc524&units=metric';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          temp = data['main']['temp'];
          feelsLikeTemp = data['main']['feels_like'];
          weatherDescription = data['weather'][0]['description'];
          sunrise = DateTime.fromMillisecondsSinceEpoch(
              data['sys']['sunrise'] * 1000);
          sunset =
              DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000);
          humidity = data['main']['humidity'];
          windSpeed = data['wind']['speed'].toDouble();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print("Error fetching weather data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: isLoading
          ? Center(
              child: SpinKitCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "☀️",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  "${temp?.toStringAsFixed(1)}°C",
                  style: TextStyle(fontSize: 32),
                ),
                Text(
                  "Feels like ${feelsLikeTemp?.toStringAsFixed(1)}°C 🥵",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  weatherDescription ?? '',
                  style: TextStyle(fontSize: 18),
                ),
                Divider(),
                Text(
                  "🌅 Sunrise: ${DateFormat('hh:mm a').format(sunrise ?? DateTime.now())}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "🌇 Sunset: ${DateFormat('hh:mm a').format(sunset ?? DateTime.now())}",
                  style: TextStyle(fontSize: 16),
                ),
                Divider(),
                Text(
                  "💧 Humidity: ${humidity ?? 0}%",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "🌬️ Wind: ${windSpeed?.toStringAsFixed(1)} km/h",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
    );
  }
}
