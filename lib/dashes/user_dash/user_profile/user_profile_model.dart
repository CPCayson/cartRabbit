import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rabbit_profile/rabbit_profile_widget.dart';
import '/components/wallet3_widget.dart';
import '/dashes/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'dart:math';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for authorization component.
  late AuthorizationModel authorizationModel;
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    authorizationModel = createModel(context, () => AuthorizationModel());
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    authorizationModel.dispose();
    navModel.dispose();
  }
}
