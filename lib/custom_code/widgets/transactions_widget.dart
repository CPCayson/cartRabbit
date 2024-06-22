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

class TransactionsWidget extends StatefulWidget {
  const TransactionsWidget({
    super.key,
    this.width,
    this.height,
    required this.accountId,
  });

  final double? width;
  final double? height;
  final String accountId;

  @override
  State<TransactionsWidget> createState() => _TransactionsWidgetState();
}

class _TransactionsWidgetState extends State<TransactionsWidget> {
  late Future<List<dynamic>> transactions;

  @override
  void initState() {
    super.initState();
    transactions = fetchTransactions(widget.accountId);
  }

  Future<List<dynamic>> fetchTransactions(String accountId) async {
    final response = await http.post(
      Uri.parse(
          'https://us-central1-rabbit-2ba47.cloudfunctions.net/addFunds/getTransactions'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'accountId': accountId}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']; // Assuming the transactions are in a 'data' field
    } else {
      throw Exception('Failed to load transactions');
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
      child: FutureBuilder<List<dynamic>>(
        future: transactions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final transaction = data[index];
                return ListTile(
                  title: Text('Transaction ID: ${transaction['id']}'),
                  subtitle: Text('Amount: ${transaction['amount']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
