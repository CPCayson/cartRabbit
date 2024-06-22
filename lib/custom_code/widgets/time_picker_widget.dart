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

class TimePickerWidget extends StatefulWidget {
  final double width;
  final double height;

  const TimePickerWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // Hour Picker
              Container(
                width: widget.width / 2,
                height: widget.height * 0.6, // Constrained height
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHour = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 24),
                        ),
                      );
                    },
                    childCount: 24, // Number of hours in a day
                  ),
                ),
              ),
              // Minute Picker
              Container(
                width: widget.width / 2,
                height: widget.height * 0.6, // Constrained height
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedMinute = index;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 24),
                        ),
                      );
                    },
                    childCount: 60, // Number of minutes in an hour
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle OK action
                  print('Selected Time: $selectedHour:$selectedMinute');
                },
                child: Text('OK'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Cancel action
                  setState(() {
                    selectedHour = 0;
                    selectedMinute = 0;
                  });
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
