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

import 'package:intl/intl.dart';

class DurationSelector extends StatefulWidget {
  final double width;
  final double height;

  const DurationSelector({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _DurationSelectorState createState() => _DurationSelectorState();
}

class _DurationSelectorState extends State<DurationSelector> {
  bool isHourMode = true;
  double selectedHours = 1;
  double selectedDays = 1;
  DateTime? startDate;
  DateTime? endDate;

  void toggleMode(bool hourMode) {
    setState(() {
      isHourMode = hourMode;
    });
  }

  Future<void> selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDateRange: DateTimeRange(
        start: startDate ?? DateTime.now(),
        end: endDate ?? DateTime.now().add(Duration(days: 1)),
      ),
    );
    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
        selectedDays = picked.duration.inDays.toDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => toggleMode(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isHourMode ? Theme.of(context).primaryColor : Colors.grey,
                ),
                child: Text('Hour Mode'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => toggleMode(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isHourMode
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                ),
                child: Text('Day Mode'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            isHourMode
                ? 'Select your trip duration in hours:'
                : 'Select your trip duration in days:',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Slider(
            value: isHourMode ? selectedHours : selectedDays,
            min: 1,
            max: isHourMode ? 12 : 7,
            divisions: isHourMode ? 11 : 6,
            label: isHourMode
                ? '${selectedHours.round()} hours'
                : '${selectedDays.round()} days',
            onChanged: (double value) {
              setState(() {
                if (isHourMode) {
                  selectedHours = value;
                } else {
                  selectedDays = value;
                }
              });
            },
          ),
          Text(
            isHourMode
                ? 'Selected: ${selectedHours.round()} hours'
                : 'Selected: ${selectedDays.round()} days',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          if (!isHourMode) ...[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectDateRange(context),
              child: Text(
                startDate != null && endDate != null
                    ? 'Selected Dates: ${DateFormat('MM/dd/yyyy').format(startDate!)} - ${DateFormat('MM/dd/yyyy').format(endDate!)}'
                    : 'Select Date Range',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
