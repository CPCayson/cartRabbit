import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'addcart_widget.dart' show AddcartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddcartModel extends FlutterFlowModel<AddcartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for cartName widget.
  FocusNode? cartNameFocusNode;
  TextEditingController? cartNameTextController;
  String? Function(BuildContext, String?)? cartNameTextControllerValidator;
  String? _cartNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Requires at least 4 characters.';
    }
    if (val.length > 12) {
      return 'Maximum 12 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in cartName widget.
  int? count;
  // Stores action output result for [Firestore Query - Query a collection] action in cartName widget.
  int? countCopy;
  // State field(s) for tagNumber widget.
  FocusNode? tagNumberFocusNode;
  TextEditingController? tagNumberTextController;
  String? Function(BuildContext, String?)? tagNumberTextControllerValidator;
  String? _tagNumberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in tagNumber widget.
  int? countTag;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button-Login widget.
  CartsRecord? cart;

  @override
  void initState(BuildContext context) {
    cartNameTextControllerValidator = _cartNameTextControllerValidator;
    tagNumberTextControllerValidator = _tagNumberTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartNameFocusNode?.dispose();
    cartNameTextController?.dispose();

    tagNumberFocusNode?.dispose();
    tagNumberTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
