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

bool? timelimit(
  DateTime? initialTime,
  int? plusHour,
) {
  // return false if datetime(hour) + plusHour occur between 2am through 5am
  if (initialTime == null || plusHour == null) {
    return null;
  }
  final newTime = initialTime.add(Duration(hours: plusHour));
  final hour = newTime.hour;
  if (hour >= 2 && hour <= 5) {
    return false;
  }
  return true;
}

bool? checkBirthday(String? userDOB) {
  // check to see if user is at least 16 of age, return true if inputed age in format d/M/y
  if (userDOB == null) {
    return null;
  }
  final dob = DateFormat('d/M/y').parse(userDOB);
  final age = DateTime.now().year - dob.year;
  if (age > 16) {
    return true;
  } else if (age == 16) {
    if (DateTime.now().month > dob.month) {
      return true;
    } else if (DateTime.now().month == dob.month) {
      if (DateTime.now().day >= dob.day) {
        return true;
      }
    }
  }
  return false;
}

double? stepcont(int? stepcontroller) {
  // take the value from step controller, make it a double, and multiply it by 0.06
  if (stepcontroller != null) {
    return stepcontroller.toDouble() * 0.06;
  } else {
    return null;
  }
}

int? slider(double? sliderDouble) {
  // convert the sliders selection (double) into an integer
  if (sliderDouble != null) {
    return sliderDouble.round();
  } else {
    return null;
  }
}

List<double> calculateEarnings(double rentalPrice) {
  double percentageFee;
  double flatFee;

  if (rentalPrice < 10) {
    percentageFee = 0.12; // 12%
    flatFee = 0.30;
  } else if (rentalPrice >= 10 && rentalPrice <= 20) {
    percentageFee = 0.15; // 15%
    flatFee = 0.50;
  } else {
    percentageFee = 0.18; // 18%
    flatFee = 0.50;
  }

  double totalPercentageFee = rentalPrice * percentageFee;
  double totalFee = totalPercentageFee + flatFee;
  double platformEarnings = totalFee;
  double hostEarnings = rentalPrice - totalFee;

  return [platformEarnings, hostEarnings];
}

int? datastructIndex(
  List<CartStruct>? myList,
  String? cartID,
) {
  var targetIndex = myList?.indexWhere((element) => element.cartId == cartID);
  return targetIndex;
}

double? cartDist(
  LatLng? userLoc,
  LatLng? cartRef,
) {
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

DateTime? caclulateEndDate(
  DateTime? startTime,
  int? hours,
) {
  // Check if either parameter is null
  if (startTime == null || hours == null) {
    // If yes, return null or handle accordingly
    return null;
  }

  // If both parameters are not null, calculate the end time
  return startTime.add(Duration(hours: hours, minutes: 30));
}

DateTime? endTimeCountdown(
  DateTime endtime,
  DateTime starttime,
) {
  if (endtime == null || starttime == null) {
    return null;
  }

  Duration difference = endtime.difference(starttime);

  // Example condition: If the difference is more than a certain period, adjust endtime
  if (difference > Duration(hours: 1)) {
    // Adjust endtime by a criteria, e.g., subtracting a certain Duration
    return endtime.subtract(Duration(minutes: 30));
  }

  return endtime;
}
