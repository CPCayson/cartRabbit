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

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:cart_rabbit/flutter_flow/lat_lng.dart' as custom_latlng;

class CustomMap extends StatefulWidget {
  const CustomMap({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  google_maps.GoogleMapController? mapController;
  final Set<google_maps.Marker> _markers = {};
  final google_maps.LatLng _initialPosition =
      google_maps.LatLng(37.7749, -122.4194);

  @override
  void initState() {
    super.initState();
    _setCustomMarker();
  }

  void _setCustomMarker() async {
    final google_maps.BitmapDescriptor customMarker =
        await google_maps.BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)), // Specify the width and height
      'assets/marker.png', // Ensure this path is correct
    );

    setState(() {
      _markers.add(
        google_maps.Marker(
          markerId: google_maps.MarkerId('customMarker'),
          position: _initialPosition,
          icon: customMarker,
          infoWindow: google_maps.InfoWindow(
            title: 'Custom Marker',
            snippet: 'This is a custom marker with an info window',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: google_maps.GoogleMap(
        onMapCreated: (google_maps.GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: google_maps.CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}
