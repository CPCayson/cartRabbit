// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> findMarkerIndex(
  List<LatLng> markerList,
  LatLng? markerToFind,
) async {
  if (markerToFind == null) {
    // If markerToFind is null, we cannot find its index.
    return -1;
  }

  for (int i = 0; i < markerList.length; i++) {
    // Assuming a small threshold for equality due to floating point comparison
    if ((markerList[i].latitude - markerToFind.latitude).abs() < 0.0001 &&
        (markerList[i].longitude - markerToFind.longitude).abs() < 0.0001) {
      return i; // Found the marker, return its index
    }
  }
  return -1; // If the marker is not found, return -1
}
