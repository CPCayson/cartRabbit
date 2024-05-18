import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav/nav_widget.dart';
import '/dashes/user_dash/checkout/checkout_widget.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/notyetneeded/amenitity_indicator/amenitity_indicator_widget.dart';
import '/notyetneeded/scan_cart_button/scan_cart_button_widget.dart';
import '/notyetneeded/waiting/waiting_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'user_dash_copy2_widget.dart' show UserDashCopy2Widget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class UserDashCopy2Model extends FlutterFlowModel<UserDashCopy2Widget> {
  ///  Local state fields for this page.

  DocumentReference? userRef;

  List<DocumentReference> friendsList = [];
  void addToFriendsList(DocumentReference item) => friendsList.add(item);
  void removeFromFriendsList(DocumentReference item) =>
      friendsList.remove(item);
  void removeAtIndexFromFriendsList(int index) => friendsList.removeAt(index);
  void insertAtIndexInFriendsList(int index, DocumentReference item) =>
      friendsList.insert(index, item);
  void updateFriendsListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendsList[index] = updateFn(friendsList[index]);

  int? cartIDSelected;

  bool map = false;

  int? countdown = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for nav component.
  late NavModel navModel;

  @override
  void initState(BuildContext context) {
    navModel = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navModel.dispose();
  }
}
