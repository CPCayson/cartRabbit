import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/change_main_photo/change_main_photo_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRentalModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String selectedCartID = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for pricePerHour widget.
  TextEditingController? pricePerHourController1;
  String? Function(BuildContext, String?)? pricePerHourController1Validator;
  // State field(s) for cartName widget.
  TextEditingController? cartNameController;
  String? Function(BuildContext, String?)? cartNameControllerValidator;
  String? _cartNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'We need to know the name of the place...';
    }

    return null;
  }

  // State field(s) for cartAddress widget.
  TextEditingController? cartAddressController;
  String? Function(BuildContext, String?)? cartAddressControllerValidator;
  // State field(s) for pricePerHour widget.
  TextEditingController? pricePerHourController2;
  String? Function(BuildContext, String?)? pricePerHourController2Validator;
  // State field(s) for pricePerClean widget.
  TextEditingController? pricePerCleanController;
  String? Function(BuildContext, String?)? pricePerCleanControllerValidator;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;
  // State field(s) for notes widget.
  TextEditingController? notesController;
  String? Function(BuildContext, String?)? notesControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cartNameControllerValidator = _cartNameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    pricePerHourController1?.dispose();
    cartNameController?.dispose();
    cartAddressController?.dispose();
    pricePerHourController2?.dispose();
    pricePerCleanController?.dispose();
    notesController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
