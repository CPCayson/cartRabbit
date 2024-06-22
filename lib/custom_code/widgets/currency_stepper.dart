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

class CurrencyStepper extends StatefulWidget {
  final double initialValue;
  final double step;
  final double min;
  final double max;
  final Function(double) onValueChanged;

  const CurrencyStepper({
    Key? key,
    required this.initialValue,
    required this.step,
    required this.min,
    required this.max,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _CurrencyStepperState createState() => _CurrencyStepperState();
}

class _CurrencyStepperState extends State<CurrencyStepper> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _increment() {
    if (_value < widget.max) {
      setState(() {
        _value = (_value + widget.step <= widget.max)
            ? _value + widget.step
            : widget.max;
        widget.onValueChanged(_value);
      });
    }
  }

  void _decrement() {
    if (_value > widget.min) {
      setState(() {
        _value = (_value - widget.step >= widget.min)
            ? _value - widget.step
            : widget.min;
        widget.onValueChanged(_value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: _decrement,
        ),
        Text('\$${_value.toStringAsFixed(2)}'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _increment,
        ),
      ],
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
