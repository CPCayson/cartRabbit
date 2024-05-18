import '/auth/firebase_auth/auth_util.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'select_destination_page_widget.dart' show SelectDestinationPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectDestinationPageModel
    extends FlutterFlowModel<SelectDestinationPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> origin = [];
  void addToOrigin(dynamic item) => origin.add(item);
  void removeFromOrigin(dynamic item) => origin.remove(item);
  void removeAtIndexFromOrigin(int index) => origin.removeAt(index);
  void insertAtIndexInOrigin(int index, dynamic item) =>
      origin.insert(index, item);
  void updateOriginAtIndex(int index, Function(dynamic) updateFn) =>
      origin[index] = updateFn(origin[index]);

  List<dynamic> destination = [];
  void addToDestination(dynamic item) => destination.add(item);
  void removeFromDestination(dynamic item) => destination.remove(item);
  void removeAtIndexFromDestination(int index) => destination.removeAt(index);
  void insertAtIndexInDestination(int index, dynamic item) =>
      destination.insert(index, item);
  void updateDestinationAtIndex(int index, Function(dynamic) updateFn) =>
      destination[index] = updateFn(destination[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
