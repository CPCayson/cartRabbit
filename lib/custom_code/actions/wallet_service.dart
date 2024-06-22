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

Future walletService(
  String userId,
  String paymentMethod,
  double amount,
) async {
  final url =
      Uri.parse('https://us-central1-rabbit-2ba47.cloudfunctions.net/addFunds');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'userId': userId,
      'amount': (amount * 100).toInt(), // Convert to cents
      'paymentMethod': paymentMethod,
    }),
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final newBalance = responseData['newBalance'];
    final transactions = responseData['transactions'];
    // Return the new balance and transactions
    return {
      'newBalance': newBalance,
      'transactions': transactions,
    };
  } else {
    throw Exception('Failed to add funds: ${response.body}');
  }
}
