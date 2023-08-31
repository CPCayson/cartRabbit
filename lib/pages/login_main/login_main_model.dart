import '/auth/firebase_auth/auth_util.dart';
import '/dashboards/name/name_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginMainModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for name component.
  late NameModel nameModel;
  // State field(s) for emailAddress widget.
  final emailAddressKey = GlobalKey();
  TextEditingController? emailAddressController;
  String? emailAddressSelectedOption;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  final passwordKey = GlobalKey();
  TextEditingController? passwordController;
  String? passwordSelectedOption;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameModel = createModel(context, () => NameModel());
    passwordVisibility = false;
  }

  void dispose() {
    nameModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
