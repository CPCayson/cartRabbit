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

import 'package:http/http.dart' as http;
import 'dart:convert';

class WalletPage extends StatefulWidget {
  const WalletPage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  double currentBalance = 100.0;
  double balanceInput = 0.0;
  String selectedPaymentMethod = 'Credit Card';
  String recipientEmail = '';
  List<String> paymentMethods = ['Credit Card', 'Bank Transfer', 'PayPal'];
  List<Transaction> transactions = [];

  void addFunds() async {
    final response =
        await walletService('userId', selectedPaymentMethod, balanceInput);
    if (response) {
      setState(() {
        currentBalance += balanceInput;
        transactions.add(Transaction(
          amount: balanceInput,
          type: TransactionType.credit,
          description: 'Funds added via $selectedPaymentMethod',
          date: DateTime.now(),
        ));
        balanceInput = 0.0;
      });
    }
  }

  void withdrawFunds() {
    if (balanceInput <= currentBalance) {
      setState(() {
        currentBalance -= balanceInput;
        transactions.add(Transaction(
          amount: balanceInput,
          type: TransactionType.debit,
          description: 'Funds withdrawn via $selectedPaymentMethod',
          date: DateTime.now(),
        ));
        balanceInput = 0.0;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Insufficient balance')),
      );
    }
  }

  void transferFunds() {
    // Implement transfer funds logic
  }

  void addPaymentMethod(String method) {
    setState(() {
      paymentMethods.add(method);
    });
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: "Widget constructor not found.",
          description: "Are you sure you want to save?",
          primaryButtonText: "Yes, Save",
          primaryButtonFunc: () {
            Navigator.of(context).pop();
            // Add your save functionality here
          },
          secondaryButtonText: "Cancel",
          secondaryButtonFunc: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet Page'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Current Balance',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text('\$${currentBalance.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 32, color: Colors.teal)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            balanceInput = double.tryParse(value) ?? 0.0;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedPaymentMethod,
                        items: paymentMethods.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPaymentMethod = value!;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: addFunds,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Add Funds'),
                          ),
                          ElevatedButton(
                            onPressed: withdrawFunds,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text('Withdraw Funds'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Recipient Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            recipientEmail = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: transferFunds,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(child: Text('Transfer Funds')),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Transaction History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Container(
                height: 300, // Adjust as needed
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(transactions[index].description),
                          subtitle: Text(transactions[index].date.toString()),
                          trailing: Text(
                            '${transactions[index].type == TransactionType.credit ? '+' : '-'}\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: transactions[index].type ==
                                      TransactionType.credit
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCustomDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class Transaction {
  final double amount;
  final TransactionType type;
  final String description;
  final DateTime date;

  Transaction({
    required this.amount,
    required this.type,
    required this.description,
    required this.date,
  });
}

enum TransactionType { credit, debit }

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String primaryButtonText;
  final Function primaryButtonFunc;
  final String secondaryButtonText;
  final Function secondaryButtonFunc;

  CustomDialog({
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.primaryButtonFunc,
    required this.secondaryButtonText,
    required this.secondaryButtonFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 300.0,
        height: 200.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Text(description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () => secondaryButtonFunc(),
                  child: Text(secondaryButtonText),
                ),
                ElevatedButton(
                  onPressed: () => primaryButtonFunc(),
                  child: Text(primaryButtonText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> walletService(
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
      'amount': amount,
      'paymentMethod': paymentMethod,
    }),
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final newBalance = responseData['newBalance'];
    print('New Balance: $newBalance');
    return true;
  } else {
    print('Failed to add funds: ${response.body}');
    return false;
  }
}
