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

Future<String?> onboardConnectExpress(String accountId) async {
  final url =
      'YOUR_CLOUD_FUNCTION_URL/onboardConnectExpress'; // Replace with your Cloud Function URL
  final body = jsonEncode({'accountId': accountId});

  try {
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['url']; // Return account link URL
    } else {
      // Handle error
      print('Failed to onboard Connect Express account: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Error onboarding Connect Express account: $error');
    return null; // Return null or handle error case as needed
  }
}
