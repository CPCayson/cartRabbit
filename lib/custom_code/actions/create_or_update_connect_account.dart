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

import 'package:http/http.dart' as http;
import 'dart:convert';

const String stripeSecretKey =
    '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';

Future<String> getIpAddress() async {
  final response = await http.get(Uri.parse('http://httpbin.org/ip'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['origin'];
  } else {
    throw Exception('Failed to get IP address');
  }
}

Future<String?> createOrUpdateConnectAccount() async {
  final uri = Uri.parse('https://api.stripe.com/v1/accounts');

  // Get the user's IP address
  final ipAddress = await getIpAddress();

  // Predefined values for creating Connect account
  final firstName = "John";
  final lastName = "Doe";
  final dobDay = "01";
  final dobMonth = "01";
  final dobYear = "1990";
  final addressLine1 = "123 Main St";
  final city = "Anytown";
  final state = "CA";
  final postalCode = "12345";
  final country = "US";
  final email = "john.doe@example.com";
  final phone = "+1234567890";

  // Create Connect account with essential details
  final accountResponse = await http.post(
    uri,
    headers: {
      'Authorization': 'Bearer $stripeSecretKey',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'type': 'express',
      'country': country,
      'email': email,
      'business_type': 'individual',
      'individual[first_name]': firstName,
      'individual[last_name]': lastName,
      'individual[dob][day]': dobDay,
      'individual[dob][month]': dobMonth,
      'individual[dob][year]': dobYear,
      'individual[address][line1]': addressLine1,
      'individual[address][city]': city,
      'individual[address][state]': state,
      'individual[address][postal_code]': postalCode,
      'individual[address][country]': country,
      'individual[phone]': phone,
      'capabilities[transfers][requested]':
          'true', // Only request transfers capability
      'business_profile[url]':
          'https://your-app-website.com', // Replace with your actual URL
      'tos_acceptance[date]': '11/27/22',
      'tos_acceptance[ip]': ipAddress,
    },
  );

  if (accountResponse.statusCode == 200) {
    final accountData = json.decode(accountResponse.body);
    print('Connect account created: ${accountData['id']}');
    return accountData['id'];
  } else {
    print('Failed to create Connect account: ${accountResponse.body}');
    return null;
  }
}
// End custom action code
