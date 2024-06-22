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

// Begin custom widget codes

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    super.key,
    this.width,
    this.height,
    this.textbutton,
    this.textColorbutton,
    this.backgroundcolorbutton,
    required this.rebuildpage,
  });

  final double? width;
  final double? height;
  final String? textbutton;
  final Color? textColorbutton;
  final Color? backgroundcolorbutton;
  final Future Function() rebuildpage;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
