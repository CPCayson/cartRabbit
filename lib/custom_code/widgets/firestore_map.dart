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
  Map<String, google_maps_flutter.BitmapDescriptor> _customIcons = {};
  Set<google_maps_flutter.Marker> _markers = {};

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

    _loadMarkerIcons();
    _getPolyline();
  }

  Future<void> _loadMarkerIcons() async {
    Set<String?> uniqueIconPaths =
        widget.places?.map((data) => data.imageUrl).toSet() ?? {};

    for (String? path in uniqueIconPaths) {
      if (path != null && path.isNotEmpty) {
        if (path.contains("https")) {
          Uint8List? imageData = await loadNetworkImage(path);
          if (imageData != null) {
            google_maps_flutter.BitmapDescriptor descriptor =
                await google_maps_flutter.BitmapDescriptor.fromBytes(imageData);
            _customIcons[path] = descriptor;
          }
        } else {
          google_maps_flutter.BitmapDescriptor descriptor =
              await google_maps_flutter.BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(devicePixelRatio: 2.5),
            "assets/images/$path",
          );
          _customIcons[path] = descriptor;
        }
      }
    }

    _updateMarkers();
  }

  Future<void> _showAllInfoWindows() async {
    final controller = await _controller.future;
    for (final marker in _markers) {
      await controller.showMarkerInfoWindow(marker.markerId);
    }
  }

  Future<Uint8List?> loadNetworkImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = NetworkImage(path);
    image.resolve(const ImageConfiguration()).addListener(ImageStreamListener(
        (ImageInfo info, bool _) => completer.complete(info)));
    final imageInfo = await completer.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  void _updateMarkers() {
    setState(() {
      _markers = _createMarkers();
    });
  }

  void _onMapCreated(google_maps_flutter.GoogleMapController controller) {
    _controller.complete(controller);
    _showAllInfoWindows();
  }

  Set<google_maps_flutter.Marker> _createMarkers() {
    var tmp = <google_maps_flutter.Marker>{};
    for (int i = 0; i < (widget.places ?? []).length; i++) {
      var place = widget.places?[i];
      final latlng.LatLng coordinates = latlng.LatLng(
          place?.geopoint?.latitude ?? 0.0, place?.geopoint?.longitude ?? 0.0);
      final google_maps_flutter.LatLng googleMapsLatLng =
          google_maps_flutter.LatLng(
              coordinates.latitude, coordinates.longitude);
      google_maps_flutter.BitmapDescriptor icon =
          _customIcons[place?.imageUrl] ??
              google_maps_flutter.BitmapDescriptor.defaultMarker;

      final google_maps_flutter.Marker marker = google_maps_flutter.Marker(
        markerId:
            google_maps_flutter.MarkerId('${place?.title ?? "Marker"}_$i'),
        position: googleMapsLatLng,
        icon: icon,
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

  void _getPolyline() async {
    if (widget.places != null && widget.places!.isNotEmpty) {
      // Assuming you fetch and store your API key securely
      String apiKey =
          "AIzaSyBMfXG7z6EvlrRzJTLf3wKg6Z7NfiGqty0"; // Replace with your actual, securely fetched API key

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
      polylines: Set<google_maps_flutter.Polyline>.of(_polylines.values),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
