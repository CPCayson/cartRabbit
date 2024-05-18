// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> createConnectAccount(String hostEmail) async {
  final response = await http.post(
    Uri.parse('https://api.stripe.com/v1/accounts'),
    headers: {
      'Authorization':
          'Bearer sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'type': 'express',
      'country': 'US',
      'email': hostEmail,
    },
  );

  if (response.statusCode == 200) {
    final accountData = json.decode(response.body);
    final accountId = accountData['id'];
    print('Host account created: $accountId');
  } else {
    print('Failed to create account: ${response.body}');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
