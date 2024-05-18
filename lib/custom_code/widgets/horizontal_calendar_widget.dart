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

import 'package:cloud_firestore/cloud_firestore.dart';

class HorizontalCalendarWidget extends StatefulWidget {
  const HorizontalCalendarWidget({
    super.key,
    this.width,
    this.height,
    required this.cartID, // Add cartID parameter
  });

  final double? width;
  final double? height;
  final String cartID; // Cart ID parameter

  @override
  State<HorizontalCalendarWidget> createState() =>
      _HorizontalCalendarWidgetState();
}

class _HorizontalCalendarWidgetState extends State<HorizontalCalendarWidget> {
  late Future<List<BookingsRecord>> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _bookingsFuture = fetchBookings(
        DateTime(2024, 5, 17), widget.cartID); // Update to your specific date
  }

  Future<List<BookingsRecord>> fetchBookings(
      DateTime date, String cartID) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('bookings')
          .where('cartID', isEqualTo: cartID) // Filter by cartID
          .where('startTime',
              isGreaterThanOrEqualTo:
                  Timestamp.fromDate(DateTime(date.year, date.month, date.day)))
          .where('startTime',
              isLessThan: Timestamp.fromDate(
                  DateTime(date.year, date.month, date.day + 1)))
          .get();

      if (snapshot.docs.isEmpty) {
        print('No documents found');
      } else {
        snapshot.docs.forEach((doc) {
          print('Document data: ${doc.data()}');
        });
      }

      return snapshot.docs
          .map((doc) => BookingsRecord.fromSnapshot(doc))
          .toList();
    } catch (e) {
      print('Error fetching bookings: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = widget.width ?? MediaQuery.of(context).size.width;
    final double height = widget.height ?? 200; // default height

    return FutureBuilder<List<BookingsRecord>>(
      future: _bookingsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error loading bookings: ${snapshot.error}');
          return Center(child: Text('Error loading bookings'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          print('No bookings available');
          return Center(child: Text('No bookings available'));
        } else {
          final bookings = snapshot.data!;
          print('Fetched ${bookings.length} bookings');
          bookings.forEach((booking) {
            print('Booking from ${booking.startTime} to ${booking.endTime}');
          });
          return Container(
            width: width,
            height: height,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(24 * 2, (index) {
                  final time =
                      DateTime(2024, 5, 17, index ~/ 2, (index % 2) * 30);
                  final isBooked = bookings.any((booking) {
                    final startTime = booking.startTime ?? DateTime.now();
                    final endTime = booking.endTime ?? DateTime.now();
                    return time.isAfter(startTime) && time.isBefore(endTime);
                  });

                  return Container(
                    width: width / 24, // Adjust the width to fit 24 hours
                    color: isBooked ? Colors.red : Colors.green,
                    child: Center(
                      child: Text(
                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        }
      },
    );
  }
}

class BookingsRecord {
  final DateTime? startTime;
  final DateTime? endTime;

  BookingsRecord({this.startTime, this.endTime});

  factory BookingsRecord.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BookingsRecord(
      startTime: (data['startTime'] as Timestamp?)?.toDate(),
      endTime: (data['endTime'] as Timestamp?)?.toDate(),
    );
  }
}
