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

import 'package:syncfusion_flutter_calendar/calendar.dart';

class SyncfusionCalendarWidget extends StatefulWidget {
  const SyncfusionCalendarWidget({
    Key? key,
    this.width,
    this.height,
    required this.rebuildpage,
    this.actionAfterChange,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() rebuildpage;
  final Future<dynamic> Function()? actionAfterChange;

  @override
  _SyncfusionCalendarWidgetState createState() =>
      _SyncfusionCalendarWidgetState();
}

class _SyncfusionCalendarWidgetState extends State<SyncfusionCalendarWidget> {
  late CalendarController _calendarController;
  late AppointmentDataSource _dataSource;
  CalendarView currentView = CalendarView.day; // Initial view
  List<CalendarView> availableViews = [
    CalendarView.day,
    CalendarView.week,
    CalendarView.workWeek,
    CalendarView.month,
    CalendarView.timelineDay,
    CalendarView.timelineWeek,
    CalendarView.timelineWorkWeek,
    CalendarView.timelineMonth,
    CalendarView.schedule,
  ];

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  Future<List<Appointment>> getAppointments() async {
    List<Appointment> meetings = <Appointment>[];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('bookings').get();
    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DateTime start = (data['startTime'] as Timestamp).toDate();
      DateTime end = (data['endTime'] as Timestamp).toDate();
      String userId = data['userId'];
      String cartId = data['cartId'];
      meetings.add(Appointment(
        startTime: start,
        endTime: end,
        id: doc.id,
        subject: 'Booking',
        color: Colors.blue,
        recurrenceRule: null,
      ));
    }
    return meetings;
  }

  bool isOverlappingBooking(DateTime start, DateTime end) {
    for (var meeting in _dataSource.appointments ?? []) {
      if (start.isBefore(meeting.endTime) && end.isAfter(meeting.startTime)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Appointment>>(
      future: getAppointments(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _dataSource = AppointmentDataSource(snapshot.data!);
          return Scaffold(
            appBar: AppBar(
                // ... (existing code)
                ),
            body: SfCalendar(
              controller: _calendarController,
              firstDayOfWeek: 6,
              dataSource: _dataSource,
              onTap: (CalendarTapDetails details) async {
                if (details.targetElement == CalendarElement.calendarCell) {
                  // Get the tapped date and time
                  DateTime start = details.date!;
                  DateTime end = start
                      .add(Duration(hours: 1)); // Adjust the duration as needed

                  // Check for overlapping bookings
                  bool isOverlapping = isOverlappingBooking(start, end);

                  if (!isOverlapping) {
                    // Create a new booking in Firestore
                    await FirebaseFirestore.instance
                        .collection('bookings')
                        .add({
                      'startTime': start,
                      'endTime': end,
                      'userId': 'current_user_id',
                      'cartId': 'selected_cart_id',
                      // ... add other booking fields as needed
                    });

                    setState(() {});
                  } else {
                    // Show an alert or message indicating overlapping booking
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Overlapping Booking'),
                          content: Text(
                              'The selected time slot overlaps with an existing booking.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  void _showQuickViewNavigationDialog(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        _calendarController.displayDate = selectedDate;
      });
    }
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
