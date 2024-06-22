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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

Future<int> getUserBalance() async {
  final firebase_auth.User? user =
      firebase_auth.FirebaseAuth.instance.currentUser;
  if (user != null) {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('balances')
        .doc(user.uid)
        .get();
    if (userDoc.exists) {
      return userDoc['balance'] ?? 0;
    }
  }
  return 0;
}

Future<void> setUserBalance(int balance) async {
  final firebase_auth.User? user =
      firebase_auth.FirebaseAuth.instance.currentUser;
  if (user != null) {
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('balances').doc(user.uid);
    await userRef.set({
      'balance': balance,
    });
  }
}
