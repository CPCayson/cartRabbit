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

import 'index.dart'; // Imports other custom widgets

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;

class CustomMarkerWidget extends StatefulWidget {
  const CustomMarkerWidget({
    Key? key,
    this.width,
    this.height,
    required this.positions,
    required this.defaultImageUrl,
    required this.rebuildPage,
    required this.center,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String defaultImageUrl;
  final Future<dynamic> Function() rebuildPage;
  final List<MarkersStruct> positions;
  final LatLng center;

  @override
  _CustomMarkerWidgetState createState() => _CustomMarkerWidgetState();
}

class _CustomMarkerWidgetState extends State<CustomMarkerWidget> {
  late gm.BitmapDescriptor icon1;
  late Future<Set<gm.Marker>> future;
  final Completer<gm.GoogleMapController> _controller =
      Completer<gm.GoogleMapController>();

  @override
  initState() {
    future = generateMarkers();
    super.initState();
  }

  Future<Set<gm.Marker>> generateMarkers() async {
    List<gm.Marker> markers = <gm.Marker>[];
    for (final location in widget.positions) {
      final http.Response response = await http.get(Uri.parse(
          location.imageUrl.isEmpty
              ? widget.defaultImageUrl
              : location.imageUrl));
      final icon = await gm.BitmapDescriptor.fromBytes(response.bodyBytes,
          size: Size(24, 24));

      final marker = gm.Marker(
        markerId: gm.MarkerId(location.toString()),
        position: gm.LatLng(
            location.coordinates!.latitude, location.coordinates!.longitude),
        icon: icon,
        onTap: () {
          print("tapping custom marker");
          FFAppState().tapped = LatLng(
              location.coordinates!.latitude, location.coordinates!.longitude);
          widget.rebuildPage();
        },
      );

      markers.add(marker);
    }
    return markers.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<gm.Marker>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return gm.GoogleMap(
              onMapCreated: (gm.GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: gm.CameraPosition(
                  target: gm.LatLng(
                      widget.center.latitude, widget.center.longitude),
                  zoom: 15),
              markers: snapshot.data!,
            );
          } else {
            return gm.GoogleMap(
              onMapCreated: (gm.GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: gm.CameraPosition(
                  target: gm.LatLng(
                      widget.center.latitude, widget.center.longitude),
                  zoom: 15),
              markers: Set.of(<gm.Marker>[]),
            );
          }
        });
  }
}
