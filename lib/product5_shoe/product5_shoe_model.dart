import '/backend/supabase/supabase.dart';
import '/components/toprevview_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'product5_shoe_widget.dart' show Product5ShoeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Product5ShoeModel extends FlutterFlowModel<Product5ShoeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // Model for toprevview component.
  late ToprevviewModel toprevviewModel;

  @override
  void initState(BuildContext context) {
    toprevviewModel = createModel(context, () => ToprevviewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    toprevviewModel.dispose();
  }
}
