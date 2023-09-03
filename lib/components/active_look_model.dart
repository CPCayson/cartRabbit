import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/accept_service/accept_service_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActiveLookModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // State field(s) for Timer widget.
  int timerMilliseconds = 300000;
  String timerValue = StopWatchTimer.getDisplayTime(
    300000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
