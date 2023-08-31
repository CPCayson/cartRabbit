import '/auth/firebase_auth/auth_util.dart';
import '/components/name/name_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PinCodeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String phonenumber = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Model for name component.
  late NameModel nameModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    nameModel = createModel(context, () => NameModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
    nameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
