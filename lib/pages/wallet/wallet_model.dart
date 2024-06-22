import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/wallet3_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'wallet_widget.dart' show WalletWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WalletModel extends FlutterFlowModel<WalletWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for wallet3 component.
  late Wallet3Model wallet3Model;

  @override
  void initState(BuildContext context) {
    wallet3Model = createModel(context, () => Wallet3Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wallet3Model.dispose();
  }
}
