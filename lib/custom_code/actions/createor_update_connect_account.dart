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

import 'package:http/http.dart' as http;
import 'dart:convert';

const String stripeSecretKey =
    'sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm';

Future<String?> createorUpdateConnectAccount(String customerId) async {
  final uri = Uri.parse('https://api.stripe.com/v1/accounts');

  // Retrieve customer details
  final customerResponse = await http.get(
    Uri.parse('https://api.stripe.com/v1/customers/$customerId'),
    headers: {
      'Authorization': 'Bearer $stripeSecretKey',
    },
  );

  if (customerResponse.statusCode != 200) {
    print('Failed to retrieve customer: ${customerResponse.body}');
    return null;
  }

  final customerData = json.decode(customerResponse.body);
  final customerName = customerData['name'] ?? '';
  final customerNameParts = customerName.split(' ');
  final firstName =
      customerNameParts.isNotEmpty ? customerNameParts.first : 'First';
  final lastName =
      customerNameParts.length > 1 ? customerNameParts.last : 'Last';

  final customerAddress = customerData['address'] ?? {};
  final addressLine1 = customerAddress['line1'] ?? '';
  final city = customerAddress['city'] ?? '';
  final state = customerAddress['state'] ?? '';
  final postalCode = customerAddress['postal_code'] ?? '';
  final country = customerAddress['country'] ?? 'US';

  // Create Connect account with prepopulated details
  final accountResponse = await http.post(
    uri,
    headers: {
      'Authorization': 'Bearer $stripeSecretKey',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'type': 'express',
      'country': 'US',
      'email': customerData['email'] ?? '',
      'business_type': 'individual',
      'individual[first_name]': firstName,
      'individual[last_name]': lastName,
      'individual[address][line1]': addressLine1,
      'individual[address][city]': city,
      'individual[address][state]': state,
      'individual[address][postal_code]': postalCode,
      'individual[address][country]': country,
      'individual[email]': customerData['email'] ?? '',
      'individual[phone]': customerData['phone'] ?? '',
      'capabilities[card_payments][requested]': 'true',
      'capabilities[transfers][requested]': 'true',
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
