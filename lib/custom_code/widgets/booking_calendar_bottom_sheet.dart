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

import 'package:cloud_firestore/cloud_firestore.dart';

class BookingCalendarBottomSheet extends StatefulWidget {
  final DocumentReference cartRef; // Cart document reference
  final double? height;
  final double? width;

  BookingCalendarBottomSheet({required this.cartRef, this.height, this.width});

  @override
  _BookingCalendarBottomSheetState createState() =>
      _BookingCalendarBottomSheetState();
}

class _BookingCalendarBottomSheetState
    extends State<BookingCalendarBottomSheet> {
  late Future<List<BookingsRecord>> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _bookingsFuture = fetchBookings(widget.cartRef);
  }

  Future<List<BookingsRecord>> fetchBookings(DocumentReference cartRef) async {
    try {
      DocumentSnapshot cartDoc = await cartRef.get();

      if (cartDoc.exists && cartDoc.data() != null) {
        List<dynamic> bookingList = cartDoc.get('bookings') as List<dynamic>;
        return bookingList.map((bookingData) {
          DateTime startTime = (bookingData['startTime'] as Timestamp).toDate();
          DateTime endTime = (bookingData['endTime'] as Timestamp).toDate();
          int colorValue = bookingData['color'] ?? Colors.red.value;
          Color color = Color(colorValue); // Use stored color or default

          return BookingsRecord(
            startTime: startTime,
            endTime: endTime,
            color: color,
          );
        }).toList();
      } else {
        print('No bookings found');
        return [];
      }
    } catch (e) {
      print('Error fetching bookings: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = 800;
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
                    height: height,
                    color: isBooked
                        ? bookings.firstWhere((booking) {
                            final startTime =
                                booking.startTime ?? DateTime.now();
                            final endTime = booking.endTime ?? DateTime.now();
                            return time.isAfter(startTime) &&
                                time.isBefore(endTime);
                          }).color
                        : Colors.green,
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
  final Color color;

  BookingsRecord({this.startTime, this.endTime, this.color = Colors.red});

  factory BookingsRecord.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BookingsRecord(
      startTime: (data['startTime'] as Timestamp?)?.toDate(),
      endTime: (data['endTime'] as Timestamp?)?.toDate(),
      color: data['color'] != null ? Color(data['color']) : Colors.red,
    );
  }
}
