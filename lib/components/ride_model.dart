import '/components/sea_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/legal/sea_copy/sea_copy_widget.dart';
import 'dart:math';
import 'ride_widget.dart' show RideWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RideModel extends FlutterFlowModel<RideWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for sea component.
  late SeaModel seaModel;
  // Model for seaCopy component.
  late SeaCopyModel seaCopyModel1;
  // Model for seaCopy component.
  late SeaCopyModel seaCopyModel2;

  @override
  void initState(BuildContext context) {
    seaModel = createModel(context, () => SeaModel());
    seaCopyModel1 = createModel(context, () => SeaCopyModel());
    seaCopyModel2 = createModel(context, () => SeaCopyModel());
  }

  @override
  void dispose() {
    seaModel.dispose();
    seaCopyModel1.dispose();
    seaCopyModel2.dispose();
  }
}
