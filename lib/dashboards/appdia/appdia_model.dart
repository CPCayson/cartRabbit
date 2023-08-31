import '/auth/firebase_auth/auth_util.dart';
import '/components/logo/logo_widget.dart';
import '/dashboards/name/name_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppdiaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for name component.
  late NameModel nameModel;
  // State field(s) for phoneNumber widget.
  final phoneNumberKey = GlobalKey();
  TextEditingController? phoneNumberController;
  String? phoneNumberSelectedOption;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // Model for logo component.
  late LogoModel logoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameModel = createModel(context, () => NameModel());
    logoModel = createModel(context, () => LogoModel());
  }

  void dispose() {
    nameModel.dispose();
    logoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
