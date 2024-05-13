import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/schedule/addeventt/addeventt_widget.dart';
import 'addevent_widget.dart' show AddeventWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddeventModel extends FlutterFlowModel<AddeventWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addeventt component.
  late AddeventtModel addeventtModel;

  @override
  void initState(BuildContext context) {
    addeventtModel = createModel(context, () => AddeventtModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addeventtModel.dispose();
  }
}
