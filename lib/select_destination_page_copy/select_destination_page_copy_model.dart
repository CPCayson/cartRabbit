import '/backend/backend.dart';
import '/components/ride_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'select_destination_page_copy_widget.dart'
    show SelectDestinationPageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectDestinationPageCopyModel
    extends FlutterFlowModel<SelectDestinationPageCopyWidget> {
  ///  Local state fields for this page.

  List<LatLng> origin = [];
  void addToOrigin(LatLng item) => origin.add(item);
  void removeFromOrigin(LatLng item) => origin.remove(item);
  void removeAtIndexFromOrigin(int index) => origin.removeAt(index);
  void insertAtIndexInOrigin(int index, LatLng item) =>
      origin.insert(index, item);
  void updateOriginAtIndex(int index, Function(LatLng) updateFn) =>
      origin[index] = updateFn(origin[index]);

  List<LatLng> destination = [];
  void addToDestination(LatLng item) => destination.add(item);
  void removeFromDestination(LatLng item) => destination.remove(item);
  void removeAtIndexFromDestination(int index) => destination.removeAt(index);
  void insertAtIndexInDestination(int index, LatLng item) =>
      destination.insert(index, item);
  void updateDestinationAtIndex(int index, Function(LatLng) updateFn) =>
      destination[index] = updateFn(destination[index]);

  bool click = false;

  String? duration;

  String? time;

  bool focus = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ride component.
  late RideModel rideModel;

  @override
  void initState(BuildContext context) {
    rideModel = createModel(context, () => RideModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    rideModel.dispose();
  }

  /// Action blocks.
  Future createrate(BuildContext context) async {}
}
