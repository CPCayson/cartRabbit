// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:typed_data';
import 'dart:async';
// Add your import for PlaceRecord and other required files.

import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:typed_data';
import 'dart:async';
import 'package:http/http.dart' as http;

// Replace with the actual path to your cart record model
import '/backend/schema/carts_record.dart';

class FirestoreMap1 extends StatefulWidget {
  const FirestoreMap1({
    Key? key,
    this.width,
    this.height,
    required this.carts,
    required this.centerLatitude,
    required this.centerLongitude,
    required this.defaultZoom,
    this.onClickCart,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CartsRecord> carts;
  final double centerLatitude;
  final double centerLongitude;
  final double defaultZoom;
  final Future Function(CartsRecord? cartRow)? onClickCart;

  @override
  State<FirestoreMap1> createState() => _FirestoreMap1State();
}

class _FirestoreMap1State extends State<FirestoreMap1> {
  final Completer<gm.GoogleMapController> _controller = Completer();
  Set<gm.Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  Future<Uint8List> _getBytesFromNetwork(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    throw Exception('Failed to load marker icon');
  }

  void _createMarkers() async {
    final Set<gm.Marker> markers = {};
    for (final cart in widget.carts) {
      Uint8List markerIcon = await _getBytesFromNetwork(cart.cartPhoto);

      // Extracting latitude and longitude from the CART_LOCATION string
      var locationParts = cart.cartLocation.split(',');
      var latitude = double.parse(locationParts[0]);
      var longitude = double.parse(locationParts[1]);

      final gm.Marker marker = gm.Marker(
        markerId: gm.MarkerId(cart.cartId),
        position: gm.LatLng(latitude, longitude),
        icon: gm.BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: gm.InfoWindow(
          title: cart.cartDisplayName,
          snippet: 'Rate: \$${cart.cartRateDbl.toStringAsFixed(2)}',
        ),
        onTap: () {
          if (widget.onClickCart != null) {
            widget.onClickCart!(cart);
          }
        },
      );
      markers.add(marker);
    }

    setState(() {
      _markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return gm.GoogleMap(
      onMapCreated: (gm.GoogleMapController controller) {
        _controller.complete(controller);
      },
      initialCameraPosition: gm.CameraPosition(
        target: gm.LatLng(widget.centerLatitude, widget.centerLongitude),
        zoom: widget.defaultZoom,
      ),
      markers: _markers,
      mapType: gm.MapType.normal,
    );
  }
}

// Define the CartRecord class based on your Firestore cart schema
class CartsRecord {
  final String cartId;
  final String cartDisplayName;
  final String cartPhoto;
  final String cartLocation;
  final double cartRateDbl;

  CartsRecord({
    required this.cartId,
    required this.cartDisplayName,
    required this.cartPhoto,
    required this.cartLocation,
    required this.cartRateDbl,
  });
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
