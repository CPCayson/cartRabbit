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

Future<String> createPayout(
    int amount, String currency, String destination, String description) async {
  try {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('createPayout');
    final response = await callable.call(<String, dynamic>{
      'amount': amount,
      'currency': currency,
      'destination': destination,
      'description': description,
    });

    return 'Payout created successfully: ${response.data['payout']['id']}';
  } catch (e) {
    print('Error creating payout: $e');
    return 'There was an error creating the payout. Please try again.';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
