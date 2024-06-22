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

import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import '/flutter_flow/lat_lng.dart' as latlng;
import 'dart:async';
export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '/flutter_flow/lat_lng.dart' show LatLng;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:ui' as ui;

class FirestoreMap extends StatefulWidget {
  const FirestoreMap({
    super.key,
    this.width,
    this.height,
    this.places,
    required this.centerLatitude,
    required this.centerLongitude,
    required this.showLocation,
    required this.showCompass,
    required this.showMapToolbar,
    required this.showTraffic,
    required this.allowZoom,
    required this.showZoomControls,
    required this.defaultZoom,
    this.onClickMarker,
  });

  final double? width;
  final double? height;
  final List<PlaceRecord>? places;
  final double centerLatitude;
  final double centerLongitude;
  final bool showLocation;
  final bool showCompass;
  final bool showMapToolbar;
  final bool showTraffic;
  final bool allowZoom;
  final bool showZoomControls;
  final double defaultZoom;
  final Future Function(PlaceRecord? placeRow)? onClickMarker;

  @override
  State<FirestoreMap> createState() => _FirestoreMapState();
}

class _FirestoreMapState extends State<FirestoreMap> {
  Completer<google_maps_flutter.GoogleMapController> _controller = Completer();
  BitmapDescriptor? customIcon;
  Set<google_maps_flutter.Marker> _markers = {};
  final Set<google_maps_flutter.Polygon> _polygons = {};

  Map<google_maps_flutter.PolylineId, google_maps_flutter.Polyline> _polylines =
      {};
  List<google_maps_flutter.LatLng> _polylineCoordinates = [];
  PolylinePoints _polylinePoints = PolylinePoints();

  late google_maps_flutter.LatLng _center;

  @override
  void initState() {
    super.initState();

    _center = google_maps_flutter.LatLng(
        widget.centerLatitude, widget.centerLongitude);

    _loadMarkerIcon();
    _setPolygons();
    _getPolyline();
  }

  // Load custom marker icon from assets
  Future<void> _loadMarkerIcon() async {
    customIcon = await google_maps_flutter.BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/marker.png',
    );

    _updateMarkers();
  }

  void _updateMarkers() {
    setState(() {
      _markers = _createMarkers();
    });
  }

  void _onMapCreated(google_maps_flutter.GoogleMapController controller) {
    _controller.complete(controller);
  }

  // Create markers with custom icon
  Set<google_maps_flutter.Marker> _createMarkers() {
    var tmp = <google_maps_flutter.Marker>{};
    for (int i = 0; i < (widget.places ?? []).length; i++) {
      var place = widget.places?[i];
      final latlng.LatLng coordinates = latlng.LatLng(
          place?.geopoint?.latitude ?? 0.0, place?.geopoint?.longitude ?? 0.0);
      final google_maps_flutter.LatLng googleMapsLatLng =
          google_maps_flutter.LatLng(
              coordinates.latitude, coordinates.longitude);

      final google_maps_flutter.Marker marker = google_maps_flutter.Marker(
        markerId:
            google_maps_flutter.MarkerId('${place?.title ?? "Marker"}_$i'),
        position: googleMapsLatLng,
        icon: customIcon ?? google_maps_flutter.BitmapDescriptor.defaultMarker,
        infoWindow: google_maps_flutter.InfoWindow(
            title: place?.title, snippet: place?.description),
        onTap: () async {
          final callback = widget.onClickMarker;
          if (callback != null) {
            await callback(place);
          }
        },
      );

      tmp.add(marker);
    }
    return tmp;
  }

  void _setPolygons() {
    // Define a very large outer boundary to cover the entire map area
    final List<google_maps_flutter.LatLng> outerBoundary = [
      google_maps_flutter.LatLng(85, -180), // Top left
      google_maps_flutter.LatLng(85, 180), // Top right
      google_maps_flutter.LatLng(-85, 180), // Bottom right
      google_maps_flutter.LatLng(-85, -180), // Bottom left
    ];

    // Define a more precise inner boundary with the provided coordinates
    final List<google_maps_flutter.LatLng> innerBoundary = [
      google_maps_flutter.LatLng(30.3057976, -89.3782744),
      google_maps_flutter.LatLng(30.3066322, -89.3763985),
      google_maps_flutter.LatLng(30.3153757, -89.3504777),
      google_maps_flutter.LatLng(30.3192285, -89.3393197),
      google_maps_flutter.LatLng(30.3205797, -89.3351445),
      google_maps_flutter.LatLng(30.319987, -89.3286214),
      google_maps_flutter.LatLng(30.3190609, -89.322227),
      google_maps_flutter.LatLng(30.3148375, -89.3228278),
      google_maps_flutter.LatLng(30.3098731, -89.3256602),
      google_maps_flutter.LatLng(30.3067609, -89.3272052),
      google_maps_flutter.LatLng(30.3025371, -89.3304667),
      google_maps_flutter.LatLng(30.2986095, -89.3355307),
      google_maps_flutter.LatLng(30.2946076, -89.3421397),
      google_maps_flutter.LatLng(30.292162, -89.3479762),
      google_maps_flutter.LatLng(30.2888269, -89.35922),
      google_maps_flutter.LatLng(30.3057976, -89.3782744),
    ];

    // Define the prohibited area as the outer boundary with a hole for the inner boundary
    final google_maps_flutter.Polygon prohibitedArea =
        google_maps_flutter.Polygon(
      polygonId: google_maps_flutter.PolygonId('prohibited_area_with_hole'),
      points: outerBoundary,
      holes: [innerBoundary.reversed.toList()],
      strokeWidth: 2,
      strokeColor: Colors.transparent,
      fillColor: Colors.black.withOpacity(0.7),
    );

    setState(() {
      _polygons.add(prohibitedArea);
    });
  }

  void _getPolyline() async {
    if (widget.places != null && widget.places!.isNotEmpty) {
      // Assuming you fetch and store your API key securely
      String apiKey =
          "YOUR_API_KEY"; // Replace with your actual, securely fetched API key

      // Origin and destination coordinates
      PointLatLng origin =
          PointLatLng(widget.centerLatitude, widget.centerLongitude);
      PointLatLng destination = PointLatLng(
          widget.places!.first.geopoint!.latitude,
          widget.places!.first.geopoint!.longitude);

      // Correctly passing arguments to the function
      PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
        apiKey, // API key as the first argument
        origin, // Start point as the second argument
        destination, // End point as the third argument
        travelMode: TravelMode.driving,
      );

      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          _polylineCoordinates
              .add(google_maps_flutter.LatLng(point.latitude, point.longitude));
        });
      }

      _addPolyline();
    }
  }

  void _addPolyline() {
    google_maps_flutter.PolylineId id = google_maps_flutter.PolylineId("poly");
    google_maps_flutter.Polyline polyline = google_maps_flutter.Polyline(
      polylineId: id,
      color: Colors.red,
      points: _polylineCoordinates,
      width: 3,
    );
    setState(() {
      _polylines[id] = polyline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return google_maps_flutter.GoogleMap(
      onMapCreated: _onMapCreated,
      zoomGesturesEnabled: widget.allowZoom,
      zoomControlsEnabled: widget.showZoomControls,
      myLocationEnabled: widget.showLocation,
      compassEnabled: widget.showCompass,
      mapToolbarEnabled: widget.showMapToolbar,
      trafficEnabled: widget.showTraffic,
      initialCameraPosition: google_maps_flutter.CameraPosition(
        target: _center,
        zoom: widget.defaultZoom,
      ),
      markers: _markers,
      polygons: _polygons,
      polylines: Set<google_maps_flutter.Polyline>.of(_polylines.values),
    );
  }
}
