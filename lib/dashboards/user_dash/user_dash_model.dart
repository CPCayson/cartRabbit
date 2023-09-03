import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cart_stack/cart_stack_widget.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserDashModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? start;

  int? end;

  DocumentReference? userRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Model for cartStack component.
  late CartStackModel cartStackModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cartStackModel = createModel(context, () => CartStackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    cartStackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
