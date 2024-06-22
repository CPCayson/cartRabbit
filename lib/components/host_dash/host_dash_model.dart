import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/dashes/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/notyetneeded/ridee/ridee_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'host_dash_widget.dart' show HostDashWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HostDashModel extends FlutterFlowModel<HostDashWidget> {
  ///  Local state fields for this page.

  bool countFocus = false;

  int? selectedCart;

  int? cartPricer;

  bool toggle = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav component.
  late NavModel navModel;
  // Model for ridee component.
  late RideeModel rideeModel;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    navModel = createModel(context, () => NavModel());
    rideeModel = createModel(context, () => RideeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navModel.dispose();
    rideeModel.dispose();
  }
}
