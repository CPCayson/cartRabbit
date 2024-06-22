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

Future<String?> createCustomer(String email, String name) async {
  final url =
      'https://us-central1-rabbit-2ba47.cloudfunctions.net/createCustomer';
  final body = jsonEncode({'email': email, 'name': name});

  try {
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return json['customerId']
          as String?; // Ensure customerId is returned as String?
    } else {
      print('Failed to create customer: ${response.body}');
      return null; // Handle error by returning null
    }
  } catch (error) {
    print('Error creating customer: $error');
    return null; // Handle error by returning null
  }
}
