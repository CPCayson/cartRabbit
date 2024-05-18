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

class BookingCalendarWidget extends StatefulWidget {
  final double? height;
  final double? width;

  BookingCalendarWidget({this.height, this.width});

  @override
  _BookingCalendarWidgetState createState() => _BookingCalendarWidgetState();
}

class _BookingCalendarWidgetState extends State<BookingCalendarWidget> {
  List<Booking> bookings = [];

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  void fetchBookings() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('bookings').get();
    List<Booking> fetchedBookings = snapshot.docs.map((doc) {
      TimeOfDay startTime = TimeOfDay.fromDateTime(doc['startTime'].toDate());
      TimeOfDay endTime = TimeOfDay.fromDateTime(doc['endTime'].toDate());
      Color color =
          Colors.red; // Assign a default color or use a field from Firestore

      return Booking(
        startTime: startTime,
        endTime: endTime,
        color: color,
      );
    }).toList();

    setState(() {
      bookings = fetchedBookings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: BookingCalendar(bookings: bookings, height: widget.height),
    );
  }
}

class Booking {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final Color color;

  Booking(
      {required this.startTime, required this.endTime, required this.color});
}

double timeToProportion(TimeOfDay time) {
  return (time.hour * 60 + time.minute) / (24 * 60);
}

class BookingWidget extends StatelessWidget {
  final Booking booking;
  final double topOffset;
  final double height;

  BookingWidget(
      {required this.booking, required this.topOffset, required this.height});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topOffset,
      left: 0,
      right: 0,
      height: height,
      child: Container(
        color: booking.color,
      ),
    );
  }
}

class BookingCalendar extends StatelessWidget {
  final List<Booking> bookings;
  final double? height;

  BookingCalendar({required this.bookings, this.height});

  @override
  Widget build(BuildContext context) {
    double screenHeight = height ?? MediaQuery.of(context).size.height;

    // Sort bookings by start time
    bookings.sort((a, b) => (a.startTime.hour * 60 + a.startTime.minute)
        .compareTo(b.startTime.hour * 60 + b.startTime.minute));

    // Calculate positions and heights for each booking
    List<Widget> bookingWidgets = [];
    double previousEndProportion = 0;

    for (int i = 0; i < bookings.length; i++) {
      double startProportion = timeToProportion(bookings[i].startTime);
      double endProportion = timeToProportion(bookings[i].endTime);

      // Ensure no overlap
      if (startProportion < previousEndProportion) {
        startProportion = previousEndProportion;
      }

      double topOffset = startProportion * screenHeight;
      double height = (endProportion - startProportion) * screenHeight;

      bookingWidgets.add(
        BookingWidget(
          booking: bookings[i],
          topOffset: topOffset,
          height: height,
        ),
      );

      previousEndProportion = endProportion;
    }

    return Stack(
      children: bookingWidgets,
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
