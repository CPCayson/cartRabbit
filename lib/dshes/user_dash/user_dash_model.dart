import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/pages/dashboards/user/book_rejected_user/book_rejected_user_widget.dart';
import '/pages/dashboards/user/user_b_p/rabbit_confirms/rabbit_confirms_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'user_dash_widget.dart' show UserDashWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';

class UserDashModel extends FlutterFlowModel<UserDashWidget> {
  ///  Local state fields for this page.

  int? start;

  int? end;

  DocumentReference? userRef;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<TripsRecord>? userDashPreviousSnapshot;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
