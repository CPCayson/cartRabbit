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

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class StripeCheckoutBottomSheet extends StatefulWidget {
  final String publishableKey;
  final String secretKey;
  final String merchantDisplayName;
  final double width;
  final double height;

  const StripeCheckoutBottomSheet({
    Key? key,
    required this.publishableKey,
    required this.secretKey,
    required this.merchantDisplayName,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _StripeCheckoutBottomSheetState createState() =>
      _StripeCheckoutBottomSheetState();
}

class _StripeCheckoutBottomSheetState extends State<StripeCheckoutBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  String selectedPaymentMethod = 'Credit Card';

  @override
  void initState() {
    super.initState();
    Stripe.publishableKey = widget.publishableKey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              labelText: 'Amount',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedPaymentMethod,
            onChanged: (String? newValue) {
              setState(() {
                selectedPaymentMethod = newValue!;
              });
            },
            items: <String>['Credit Card', 'Google Pay']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _handlePayment,
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }

  Future<void> _handlePayment() async {
    int amount = (double.parse(_amountController.text) * 100).toInt();
    if (selectedPaymentMethod == 'Credit Card') {
      await _createPaymentLink(amount);
    } else if (selectedPaymentMethod == 'Google Pay') {
      await _handleGooglePayPayment(amount);
    }
  }

  Future<void> _createPaymentLink(int amount) async {
    final response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_links'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${widget.secretKey}',
      },
      body: {
        'line_items[0][price]': 'price_1PHKIbCox373OxMXDztuHW9C',
        'line_items[0][quantity]': '1000',
      },
    );

    if (response.statusCode == 200) {
      final paymentLinkData = json.decode(response.body);
      final paymentUrl = paymentLinkData['url'];

      // Open the payment link in a webview or external browser
      _launchURL(paymentUrl);
    } else {
      final errorData = json.decode(response.body);
      print('Failed to create payment link: ${errorData['error']['message']}');
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _handleGooglePayPayment(int amount) async {
    // Google Pay payment implementation
    // You can follow similar steps to Credit Card payment method
    // but using Google Pay specific APIs
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
