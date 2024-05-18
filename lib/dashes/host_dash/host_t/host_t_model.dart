import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'host_t_widget.dart' show HostTWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HostTModel extends FlutterFlowModel<HostTWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (Accounts)] action in Button widget.
  ApiCallResponse? createStripeAccount;
  // Stores action output result for [Backend Call - API (createAccountLink)] action in Button widget.
  ApiCallResponse? getlink;
  // Stores action output result for [Backend Call - API (retrieveAccountInformation)] action in Button widget.
  ApiCallResponse? retrieve;
  // Stores action output result for [Backend Call - API (createAccountLink)] action in Button widget.
  ApiCallResponse? continueOnboarding;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TransactionsRecord? transactionOutput;
  // Stores action output result for [Backend Call - API (CheckoutSessions)] action in Button widget.
  ApiCallResponse? apiResult2tc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
