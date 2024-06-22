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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as gmaps; // Import Google Maps package with alias
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:ui' as ui;

class CustomMapWidget extends StatefulWidget {
  const CustomMapWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomMapWidgetState createState() => _CustomMapWidgetState();
}

class _CustomMapWidgetState extends State<CustomMapWidget> {
  late gmaps.GoogleMapController _controller;
  final Set<gmaps.Polygon> _polygons = {};
  final Set<gmaps.Marker> _markers = {};
  gmaps.BitmapDescriptor? customIcon;
  bool _isMapReady = false;

  @override
  void initState() {
    super.initState();
    _setPolygons();
    _loadCustomMarker();
  }

  void _setPolygons() {
    // Define a very large outer boundary to cover the entire map area
    final List<gmaps.LatLng> outerBoundary = [
      gmaps.LatLng(85, -180), // Top left
      gmaps.LatLng(85, 180), // Top right
      gmaps.LatLng(-85, 180), // Bottom right
      gmaps.LatLng(-85, -180), // Bottom left
    ];

    // Define a more precise inner boundary with the provided coordinates
    final List<gmaps.LatLng> innerBoundary = [
      gmaps.LatLng(30.3057976, -89.3782744),
      gmaps.LatLng(30.3066322, -89.3763985),
      gmaps.LatLng(30.3153757, -89.3504777),
      gmaps.LatLng(30.3192285, -89.3393197),
      gmaps.LatLng(30.3205797, -89.3351445),
      gmaps.LatLng(30.319987, -89.3286214),
      gmaps.LatLng(30.3190609, -89.322227),
      gmaps.LatLng(30.3148375, -89.3228278),
      gmaps.LatLng(30.3098731, -89.3256602),
      gmaps.LatLng(30.3067609, -89.3272052),
      gmaps.LatLng(30.3025371, -89.3304667),
      gmaps.LatLng(30.2986095, -89.3355307),
      gmaps.LatLng(30.2946076, -89.3421397),
      gmaps.LatLng(30.292162, -89.3479762),
      gmaps.LatLng(30.2888269, -89.35922),
      gmaps.LatLng(30.3057976, -89.3782744),
    ];

    // Define the prohibited area as the outer boundary with a hole for the inner boundary
    final gmaps.Polygon prohibitedArea = gmaps.Polygon(
      polygonId: gmaps.PolygonId('prohibited_area_with_hole'),
      points: outerBoundary,
      holes: [innerBoundary.reversed.toList()],
      strokeWidth: 2,
      strokeColor: Colors.transparent,
      fillColor: Colors.orange.withOpacity(0.7),
    );

    setState(() {
      _polygons.add(prohibitedArea);
    });
  }

  Future<void> _loadCustomMarker() async {
    try {
      customIcon = await gmaps.BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(88, 88)),
        'images/marker.png',
      );
      _fetchMarkers();
    } catch (error) {
      print('Error loading custom marker: $error');
    }
  }

  Future<void> _fetchMarkers() async {
    try {
      final cartsCollection = FirebaseFirestore.instance.collection('Carts');
      final querySnapshot = await cartsCollection.get();

      final Set<gmaps.Marker> markers = querySnapshot.docs.map((doc) {
        final data = doc.data();
        final cartLoc = data['cartLoc'] as GeoPoint;
        final cartName = data['name'] ?? 'Cart';
        final cartInfo = data['info'] ?? '';

        return gmaps.Marker(
          markerId: gmaps.MarkerId(doc.id),
          position: gmaps.LatLng(cartLoc.latitude, cartLoc.longitude),
          icon: customIcon!,
          infoWindow: gmaps.InfoWindow(title: cartName, snippet: cartInfo),
        );
      }).toSet();

      setState(() {
        _markers.addAll(markers);
      });
    } catch (error) {
      print('Error fetching markers: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: gmaps.GoogleMap(
        initialCameraPosition: gmaps.CameraPosition(
          target: gmaps.LatLng(30.3057976, -89.35922), // Center of your map
          zoom: 14.0,
          bearing: 75.0, // Adjust this value to rotate the map
        ),
        polygons: _polygons,
        markers: _markers,
        onMapCreated: (gmaps.GoogleMapController controller) {
          _controller = controller;
          setState(() {
            _isMapReady = true;
          });
        },
      ),
    );
  }

  Future<void> _moveCamera(gmaps.LatLng position) async {
    if (_isMapReady) {
      await _controller.animateCamera(gmaps.CameraUpdate.newLatLng(position));
    } else {
      print('Map is not ready yet');
    }
  }

  Future<void> _calculateDistance() async {
    if (!_isMapReady) {
      print("Map is not ready yet");
      return;
    }

    // Your logic to calculate distance and move camera
    _moveCamera(gmaps.LatLng(30.3085, -89.3304));
  }
}
