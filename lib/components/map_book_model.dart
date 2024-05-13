import '/auth/base_auth_user_provider.dart';
import '/components/reserve/reserve_widget.dart';
import '/dashes/user_dash/checkout/checkout_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'dart:math';
import 'map_book_widget.dart' show MapBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapBookModel extends FlutterFlowModel<MapBookWidget> {
  ///  Local state fields for this component.

  bool isflipped = false;

  ///  State fields for stateful widgets in this component.

  // Model for reserve component.
  late ReserveModel reserveModel;

  @override
  void initState(BuildContext context) {
    reserveModel = createModel(context, () => ReserveModel());
  }

  @override
  void dispose() {
    reserveModel.dispose();
  }
}
