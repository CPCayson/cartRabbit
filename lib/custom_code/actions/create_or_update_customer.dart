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

Future<String?> createOrUpdateCustomer(
    String name,
    String birthdate,
    String email,
    String phoneNumber,
    String description,
    String? customerId) async {
  final uri = (customerId != null && customerId.isNotEmpty)
      ? Uri.parse('https://api.stripe.com/v1/customers/$customerId')
      : Uri.parse('https://api.stripe.com/v1/customers');

  final response = await (customerId != null && customerId.isNotEmpty
      ? http.post(uri, headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        }, body: {
          'name': name,
          'email': email,
          'phone': phoneNumber,
          'description': description,
          'metadata[birthdate]': birthdate,
          'metadata[currency]': 'usd',
        })
      : http.post(uri, headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        }, body: {
          'name': name,
          'email': email,
          'phone': phoneNumber,
          'description': description,
          'preferred_locales[]': 'en',
          'metadata[birthdate]': birthdate,
          'metadata[currency]': 'usd',
        }));

  if (response.statusCode == 200) {
    final customerData = json.decode(response.body);
    final returnedCustomerId = customerData['id'];
    print((customerId != null && customerId.isNotEmpty)
        ? 'Customer updated: $returnedCustomerId'
        : 'Customer created: $returnedCustomerId');
    return returnedCustomerId;
  } else {
    print(
        'Failed to ${(customerId != null && customerId.isNotEmpty) ? 'update' : 'create'} customer: ${response.body}');
    return null;
  }
}

Future<void> updateCustomerBalance(String customerId, int amount) async {
  final uri = Uri.parse(
      'https://api.stripe.com/v1/customers/$customerId/balance_transactions');

  final response = await http.post(uri, headers: {
    'Authorization': 'Bearer $stripeSecretKey',
    'Content-Type': 'application/x-www-form-urlencoded',
  }, body: {
    'amount': amount.toString(),
    'currency': 'usd',
  });

  if (response.statusCode == 200) {
    print('Customer balance updated successfully');
  } else {
    print('Failed to update customer balance: ${response.body}');
  }
}
