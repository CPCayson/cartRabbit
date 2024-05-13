import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'stripe_widget.dart' show StripeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StripeModel extends FlutterFlowModel<StripeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Accounts)] action in Button widget.
  ApiCallResponse? apiResulthjx;
  // Stores action output result for [Backend Call - API (createAccountLink)] action in Button widget.
  ApiCallResponse? apiResulte14;
  // Stores action output result for [Backend Call - API (stripe payment link Made by Bluprycom Nocode marketplace custom template and support)] action in Button widget.
  ApiCallResponse? apiResultane;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
