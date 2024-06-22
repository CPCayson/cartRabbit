import '/backend/api_requests/api_calls.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_cart_widget.dart' show EditCartWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditCartModel extends FlutterFlowModel<EditCartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for cartName widget.
  FocusNode? cartNameFocusNode;
  TextEditingController? cartNameTextController;
  String? Function(BuildContext, String?)? cartNameTextControllerValidator;
  // State field(s) for tagNumber widget.
  FocusNode? tagNumberFocusNode;
  TextEditingController? tagNumberTextController;
  String? Function(BuildContext, String?)? tagNumberTextControllerValidator;
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

  @override
  void initState(BuildContext context) {}

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
