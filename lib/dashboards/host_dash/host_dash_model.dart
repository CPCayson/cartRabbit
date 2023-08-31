import '/backend/backend.dart';
import '/components/active_widget.dart';
import '/components/navigation_host/navigation_host_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/accept_service/accept_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostDashModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for navigationHost component.
  late NavigationHostModel navigationHostModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navigationHostModel = createModel(context, () => NavigationHostModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navigationHostModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
