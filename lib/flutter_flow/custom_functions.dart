import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? cartLoc(
  LatLng? userLoc,
  LatLng? cartRef,
) {
  // calculate distance between both arguments and convert into feet
  if (userLoc == null || cartRef == null) {
    return null;
  }

  const double earthRadius = 6371.0; // in km

  // Manually converting degrees to radians
  final lat1 = userLoc.latitude * (math.pi / 180);
  final lon1 = userLoc.longitude * (math.pi / 180);
  final lat2 = cartRef.latitude * (math.pi / 180);
  final lon2 = cartRef.longitude * (math.pi / 180);

  final dLat = lat2 - lat1;
  final dLon = lon2 - lon1;

  final a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);

  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final distance = earthRadius * c * 1000; // in meters

  return distance * 3.28084; // convert to feet
}
