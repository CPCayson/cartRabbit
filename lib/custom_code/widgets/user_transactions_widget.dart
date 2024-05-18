// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserTransactionsWidget extends StatefulWidget {
  final double width;
  final double height;

  UserTransactionsWidget({required this.width, required this.height});

  @override
  _UserTransactionsWidgetState createState() => _UserTransactionsWidgetState();
}

class _UserTransactionsWidgetState extends State<UserTransactionsWidget> {
  double currentBalance = 0.0;
  List transactions = [];

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  Future<void> fetchTransactions() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-rabbit-2ba47.cloudfunctions.net/function-1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        currentBalance = data['balance'];
        transactions = data['transactions'];
      });
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Current Balance: \$${currentBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction['description']),
                  subtitle: Text(transaction['date']),
                  trailing: Text('\$${transaction['amount']}'),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: fetchTransactions,
            child: Text('Refresh Transactions'),
          ),
        ],
      ),
    );
  }
}
