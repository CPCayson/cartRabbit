import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/guest_options_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'new_rabbit_widget.dart' show NewRabbitWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NewRabbitModel extends FlutterFlowModel<NewRabbitWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourAge widget.
  FocusNode? yourAgeFocusNode;
  TextEditingController? yourAgeTextController;
  final yourAgeMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? yourAgeTextControllerValidator;
  // State field(s) for yourEmail widget.
  FocusNode? yourEmailFocusNode;
  TextEditingController? yourEmailTextController;
  String? Function(BuildContext, String?)? yourEmailTextControllerValidator;
  // State field(s) for bio widget.
  FocusNode? bioFocusNode;
  TextEditingController? bioTextController;
  String? Function(BuildContext, String?)? bioTextControllerValidator;
  // Stores action output result for [Custom Action - createCustomer] action in Button widget.
  String? cid;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourAgeFocusNode?.dispose();
    yourAgeTextController?.dispose();

    yourEmailFocusNode?.dispose();
    yourEmailTextController?.dispose();

    bioFocusNode?.dispose();
    bioTextController?.dispose();
  }
}
