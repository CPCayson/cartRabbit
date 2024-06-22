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

import 'package:flutter_animate/flutter_animate.dart';

import 'index.dart'; // Imports other custom widgets

import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;

import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;

import 'dart:math' show cos, sqrt, asin;

class RouteViewLive extends StatefulWidget {
  const RouteViewLive({
    Key? key,
    this.width,
    this.height,
    required this.startCoordinate,
    required this.endCoordinate,
    this.lineColor = Colors.black,
    required this.webGoogleMapsApiKey,
    required this.rideDetailsReference,
    required this.rebuildPage,
    required this.positions,
    required this.defaultImageUrl,
    required this.startImageUrl,
    required this.destinationImageUrl,
    this.startAddress,
    this.destinationAddress,
  }) : super(key: key);

  final double? height;
  final double? width;
  final LatLng startCoordinate;
  final LatLng endCoordinate;
  final Color lineColor;
  final String webGoogleMapsApiKey;
  final DocumentReference rideDetailsReference;
  final String? startAddress;
  final String? destinationAddress;
  final Future<dynamic> Function() rebuildPage;
  final List<MarkersStruct> positions;
  final String defaultImageUrl;
  final String startImageUrl;
  final String destinationImageUrl;

  @override
  _RouteViewLiveState createState() => _RouteViewLiveState();
}

class _RouteViewLiveState extends State<RouteViewLive> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  late Future<Set<Marker>> future;
  late Future<Map<PolylineId, Polyline>?> distanceFuture;
  late Stream<RideRecord>? rideStream;
  late RideRecord rideRecord;

  // PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> initialPolylines = {};
  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  Future<Set<Marker>> generateMarkers() async {
    await Future.delayed(Duration(milliseconds: 500));
    for (final location in widget.positions) {
      try {
        final url = Uri.parse(location.imageUrl.isEmpty
            ? widget.defaultImageUrl
            : location.imageUrl);
        final http.Response response = await http.get(url);

        if (response.statusCode == 200) {
          final icon = await BitmapDescriptor.fromBytes(response.bodyBytes,
              size: Size(24, 24));
          final marker = Marker(
            markerId: MarkerId(location.toString()),
            position: latlng.LatLng(location.coordinates!.latitude,
                location.coordinates!.longitude),
            icon: icon,
            onTap: () {
              FFAppState().tapped = LatLng(location.coordinates!.latitude,
                  location.coordinates!.longitude);
              widget.rebuildPage();
            },
          );

          markers.add(marker);
        } else {
          print('Failed to load image for marker: ${url.toString()}');
        }
      } catch (e) {
        print('Error in generateMarkers: ${e.toString()}');
      }
    }

    setState(() {});
    print('generateMarkers() completed with ${markers.length} markers');
    return markers.toSet();
  }

  // Method for calculating the distance between two places
  Future<Map<PolylineId, Polyline>?> _calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
  }) async {
    if (markers.isNotEmpty) markers.clear();

    try {
      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      final http.Response startResponse =
          await http.get(Uri.parse(widget.startImageUrl));
      final http.Response destinationResponse =
          await http.get(Uri.parse(widget.destinationImageUrl));

      final startIcon = await BitmapDescriptor.fromBytes(
          startResponse.bodyBytes,
          size: Size(24, 24));
      final destinationIcon = await BitmapDescriptor.fromBytes(
          destinationResponse.bodyBytes,
          size: Size(24, 24));

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: latlng.LatLng(startLatitude, startLongitude),
        onTap: () {
          print("tapping route view static");
          FFAppState().tapped = LatLng(startLatitude, startLongitude);
          widget.rebuildPage();
        },
        icon: startIcon,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: latlng.LatLng(destinationLatitude, destinationLongitude),

        onTap: () {
          print("tapping route view static");
          FFAppState().tapped =
              LatLng(destinationLatitude, destinationLongitude);
          widget.rebuildPage();
        },
        icon: destinationIcon,
        // icon: await BitmapDescriptor.fromAssetImage(
        //   ImageConfiguration(size: Size(20, 20)),
        //   'assets/images/cab-top-view.png',
        // ),
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      // debugPrint(
      //   'MAP::START COORDINATES: ($startLatitude, $startLongitude)',
      // );
      // debugPrint(
      //   'MAP::DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      // );
      //Made by Blupry.com
      //Blupry.com No-code marketplace, custom template and support!

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: latlng.LatLng(northEastLatitude, northEastLongitude),
            southwest: latlng.LatLng(southWestLatitude, southWestLongitude),
          ),
          60.0,
        ),
      );

      final result = await _createPolylines(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );

      final polylines = result.item1;
      final polylineCoordinates = result.item2;

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      final placeDistance = totalDistance.toStringAsFixed(2);
      // debugPrint('MAP::DISTANCE: $placeDistance km');
      FFAppState().update(() {
        FFAppState().routeDistance = '$placeDistance km';
      });

      var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$startLatitude,$startLongitude&key=$googleMapsApiKey&libraries=drawing',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        final String durationText =
            jsonResponse['rows'][0]['elements'][0]['duration']['text'];
        debugPrint('MAP::$durationText');
        FFAppState().update(() {
          FFAppState().routeDuration = '$durationText';
        });
      } else {
        debugPrint('ERROR in distance matrix API');
      }

      return polylines;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
  //Made by Blupry.com
  //Blupry.com No-code marketplace, custom template and support!
  // Formula for calculating distance between two coordinates

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  Future<Tuple2<Map<PolylineId, Polyline>, List<latlng.LatLng>>>
      _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    List<latlng.LatLng> polylineCoordinates = [];

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: widget.lineColor,
      points: polylineCoordinates,
      width: 3,
    );
    // polylines[id] = polyline;

    return Tuple2({id: polyline}, polylineCoordinates);
  }

  initPolylines() async {
    double startLatitude = widget.startCoordinate.latitude;
    double startLongitude = widget.startCoordinate.longitude;

    double destinationLatitude = widget.endCoordinate.latitude;
    double destinationLongitude = widget.endCoordinate.longitude;
    final initPolylines = await _calculateDistance(
      startLatitude: startLatitude,
      startLongitude: startLongitude,
      destinationLatitude: destinationLatitude,
      destinationLongitude: destinationLongitude,
    );
    if (initPolylines != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
            initialPolylines = initPolylines;
          }));
    }
  }

  @override
  void initState() {
    future = generateMarkers();

    final startCoordinate = latlng.LatLng(
      widget.startCoordinate.latitude,
      widget.startCoordinate.longitude,
    );
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 14,
    );
    rideStream = RideRecord.getDocument(widget.rideDetailsReference);
    var listen = rideStream!.listen((value) {
      print("value listen");
      print(rideRecord.toString());
      print("finished listening");
      rideRecord = value;
    });

    super.initState();
  }

  int k = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RideRecord>(
      stream: rideStream!.distinct(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: widget.height,
            width: widget.width,
            child: GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(initialPolylines.values),
              onMapCreated: (GoogleMapController controller) async {
                mapController = controller;
                await initPolylines();
              },
            ),
          );
        }

        final rideRecord = snapshot.data;
        // debugPrint('MAP::UPDATED');
        if (k == 0) {
          distanceFuture = _calculateDistance(
            startLatitude: rideRecord!.driverLocation!.latitude,
            startLongitude: rideRecord.driverLocation!.longitude,
            destinationLatitude: rideRecord.userLocation!.latitude,
            destinationLongitude: rideRecord.userLocation!.longitude,
          );
          k++;
        }

        return Container(
          height: widget.height,
          width: widget.width,
          child: FutureBuilder<Map<PolylineId, Polyline>?>(
              future: distanceFuture,
              builder: (context, snapshot) {
                print("future builder: ");
                if (!snapshot.hasData) {
                  return GoogleMap(
                    markers: Set<Marker>.from(markers),
                    initialCameraPosition: CameraPosition(
                      target: latlng.LatLng(
                        rideRecord!.destinationLocation!.latitude,
                        rideRecord.destinationLocation!.longitude,
                      ),
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    polylines: Set<Polyline>.of(initialPolylines.values),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                  );
                }

                return GoogleMap(
                  markers: Set<Marker>.from(markers),
                  initialCameraPosition: CameraPosition(
                    target: latlng.LatLng(
                      rideRecord!.destinationLocation!.latitude,
                      rideRecord.destinationLocation!.longitude,
                    ),
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  polylines: Set<Polyline>.of(snapshot.data!.values),
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                );
              }),
        );
      },
    );
  }
}
//Made by Blupry.com
//Blupry.com No-code marketplace, custom template and support!
