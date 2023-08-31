import '/backend/backend.dart';
import '/components/cart_stack/cart_stack_widget.dart';
import '/components/name/name_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/user_account/checkout1_products/checkout1_products_widget.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';

class UserDashModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? start;

  int? end;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Model for name component.
  late NameModel nameModel;
  // State field(s) for ad1 widget.
  List<String>? ad1Value;
  FormFieldController<String>? ad1ValueController;
  // Model for cartStack component.
  late CartStackModel cartStackModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameModel = createModel(context, () => NameModel());
    cartStackModel = createModel(context, () => CartStackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    nameModel.dispose();
    cartStackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
