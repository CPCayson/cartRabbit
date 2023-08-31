import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/future_features/ammens/ammens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRental2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for ammens component.
  late AmmensModel ammensModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    ammensModel = createModel(context, () => AmmensModel());
  }

  void dispose() {
    ammensModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
