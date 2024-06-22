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

import 'package:cloud_functions/cloud_functions.dart';

Future<String> retrievePayouts(int limit) async {
  try {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('retrievePayouts');
    final response = await callable.call(<String, dynamic>{
      'limit': limit,
    });

    return 'Payouts retrieved successfully: ${response.data['payouts']}';
  } catch (e) {
    print('Error retrieving payouts: $e');
    return 'There was an error retrieving the payouts. Please try again.';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
