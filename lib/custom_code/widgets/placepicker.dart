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

import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class Placepicker extends StatefulWidget {
  const Placepicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<Placepicker> createState() => _PlacepickerState();
}

class _PlacepickerState extends State<Placepicker> {
  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Position? userPosition;
  bool showAutocomplete = true;

  @override
  void initState() {
    super.initState();
    googlePlace = GooglePlace('AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM');
    _getUserLocation();
  }

  void _getUserLocation() async {
    try {
      userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(
          'User location: ${userPosition?.latitude}, ${userPosition?.longitude}');
    } catch (e) {
      print('Failed to get user location: $e');
    }
  }

  void autoCompleteSearch(String value) async {
    final double centralLat = 30.3088;
    final double centralLng = -89.3300;
    final int radius = 10000; // Radius in meters

    final proxyUrl =
        'https://us-central1-rabbit-2ba47.cloudfunctions.net/proxyAutocomplete';

    print('Starting autocomplete search for: $value');
    print(
        'Request URL: $proxyUrl?input=$value&location=$centralLat,$centralLng&radius=$radius&strictbounds=true&key=AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM');

    try {
      final response = await http.get(Uri.parse(
          '$proxyUrl?input=$value&location=$centralLat,$centralLng&radius=$radius&strictbounds=true&key=AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM'));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        setState(() {
          predictions = (result['predictions'] as List)
              .map((p) => AutocompletePrediction.fromJson(p))
              .toList();
          showAutocomplete = true;
        });
      } else {
        print(
            'Failed to load predictions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during autocomplete search: $e');
    }
  }

  double _normalizeDistance(double distance) {
    return (distance / 10000) * 5;
  }

  double _calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = widget.width ?? screenSize.width * 0.9;
    final height = widget.height ?? screenSize.height * 0.5;

    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                autoCompleteSearch(value);
              } else {
                setState(() {
                  predictions = [];
                  showAutocomplete = false;
                });
              }
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: showAutocomplete
                ? predictions.isNotEmpty
                    ? ListView.builder(
                        itemCount: predictions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text(predictions[index].description!),
                            onTap: () async {
                              double distance = await displayPrediction(
                                  predictions[index], context);
                              setState(() {
                                showAutocomplete = false;
                              });
                            },
                          );
                        },
                      )
                    : Center(
                        child: Text("No results found",
                            style: TextStyle(color: Colors.grey)),
                      )
                : Center(
                    child: Text(
                        'Normalized Distance: ${FFAppState().normalizedDistance?.toStringAsFixed(2) ?? ''}',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
          ),
        ],
      ),
    );
  }

  Future<double> displayPrediction(
      AutocompletePrediction prediction, BuildContext context) async {
    final proxyUrl =
        'https://us-central1-rabbit-2ba47.cloudfunctions.net/proxyPlaceDetails';
    print('Fetching place details for: ${prediction.placeId}');
    print(
        'Request URL: $proxyUrl?place_id=${prediction.placeId}&key=AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM');

    try {
      final response = await http.get(Uri.parse(
          '$proxyUrl?place_id=${prediction.placeId}&key=AIzaSyAeU7_Y-1gOTgOoQCq_k6nuWn8KUlOeDvM'));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final details = jsonDecode(response.body);
        if (details != null &&
            details['result'] != null &&
            userPosition != null) {
          final lat = details['result']['geometry']['location']['lat'];
          final lng = details['result']['geometry']['location']['lng'];

          if (lat != null && lng != null) {
            final distance = _calculateDistance(
                userPosition!.latitude, userPosition!.longitude, lat, lng);
            final normalizedDistance = _normalizeDistance(distance);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "${prediction.description} - Distance: ${distance.toStringAsFixed(2)} meters, Normalized: ${normalizedDistance.toStringAsFixed(2)}")));

            return normalizedDistance;
          } else {
            print('Lat or Lng is null for ${prediction.description}');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "Could not determine the location for ${prediction.description}")));
            return 0.0;
          }
        }
      } else {
        print(
            'Failed to load place details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching place details: $e');
    }
    return 0.0;
  }
}
