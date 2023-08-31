import '/components/appdia_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPinModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for appdia component.
  late AppdiaModel appdiaModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appdiaModel = createModel(context, () => AppdiaModel());
  }

  void dispose() {
    appdiaModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
