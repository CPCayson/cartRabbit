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

class HostDashboardPage extends StatefulWidget {
  const HostDashboardPage({
    super.key,
    this.width,
    this.height,
    required this.accountId,
  });

  final double? width;
  final double? height;
  final String accountId;

  @override
  State<HostDashboardPage> createState() => _HostDashboardPageState();
}

class _HostDashboardPageState extends State<HostDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Host Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FetchAccountDetails(
              width: widget.width ?? double.infinity,
              height: 100.0,
              accountId: widget.accountId,
            ),
            SizedBox(height: 20),
            BalanceWidget(
              width: widget.width ?? double.infinity,
              height: 100.0,
              accountId: widget.accountId,
            ),
            SizedBox(height: 20),
            Expanded(
              child: TransactionsWidget(
                width: widget.width ?? double.infinity,
                height: widget.height ?? double.infinity,
                accountId: widget.accountId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
