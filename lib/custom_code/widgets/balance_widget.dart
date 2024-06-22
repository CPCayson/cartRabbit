// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({
    super.key,
    this.width,
    this.height,
    required this.accountId,
  });

  final double? width;
  final double? height;
  final String accountId;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  late Future<Map<String, dynamic>> balanceDetails;

  @override
  void initState() {
    super.initState();
    balanceDetails = fetchBalance(widget.accountId);
  }

  Future<Map<String, dynamic>> fetchBalance(String accountId) async {
    final response = await http.post(
      Uri.parse(
          'https://us-central1-rabbit-2ba47.cloudfunctions.net/addFunds/getBalance'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'accountId': accountId}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load balance');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FutureBuilder<Map<String, dynamic>>(
        future: balanceDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Available Balance: ${data['available'][0]['amount']}',
                    style: FlutterFlowTheme.of(context).title3),
                SizedBox(height: 8.0),
                Text('Pending Balance: ${data['pending'][0]['amount']}',
                    style: FlutterFlowTheme.of(context).bodyText1),
                // Add more balance details here
              ],
            );
          }
        },
      ),
    );
  }
}
