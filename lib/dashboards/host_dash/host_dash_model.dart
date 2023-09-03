import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/action2_sheet_simple_widget.dart';
import '/components/active_look_widget.dart';
import '/dashboards/navigation_host/navigation_host_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostDashModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String selectedCartID = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for activeLook dynamic component.
  late FlutterFlowDynamicModels<ActiveLookModel> activeLookModels;
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  // Model for navigationHost component.
  late NavigationHostModel navigationHostModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    activeLookModels = FlutterFlowDynamicModels(() => ActiveLookModel());
    navigationHostModel = createModel(context, () => NavigationHostModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    activeLookModels.dispose();
    timerController.dispose();
    navigationHostModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
