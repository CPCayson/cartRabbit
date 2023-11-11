import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'host_tutorial_widget.dart' show HostTutorialWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostTutorialModel extends FlutterFlowModel<HostTutorialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for cartName widget.
  FocusNode? cartNameFocusNode1;
  TextEditingController? cartNameController1;
  String? Function(BuildContext, String?)? cartNameController1Validator;
  // State field(s) for cartName widget.
  FocusNode? cartNameFocusNode2;
  TextEditingController? cartNameController2;
  String? Function(BuildContext, String?)? cartNameController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    cartNameFocusNode1?.dispose();
    cartNameController1?.dispose();

    cartNameFocusNode2?.dispose();
    cartNameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
