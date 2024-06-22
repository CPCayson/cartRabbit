import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/toprevview_widget.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'finding_ride_page_widget.dart' show FindingRidePageWidget;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FindingRidePageModel extends FlutterFlowModel<FindingRidePageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> friendslist = [];
  void addToFriendslist(DocumentReference item) => friendslist.add(item);
  void removeFromFriendslist(DocumentReference item) =>
      friendslist.remove(item);
  void removeAtIndexFromFriendslist(int index) => friendslist.removeAt(index);
  void insertAtIndexInFriendslist(int index, DocumentReference item) =>
      friendslist.insert(index, item);
  void updateFriendslistAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendslist[index] = updateFn(friendslist[index]);

  List<DocumentReference> friendlist = [];
  void addToFriendlist(DocumentReference item) => friendlist.add(item);
  void removeFromFriendlist(DocumentReference item) => friendlist.remove(item);
  void removeAtIndexFromFriendlist(int index) => friendlist.removeAt(index);
  void insertAtIndexInFriendlist(int index, DocumentReference item) =>
      friendlist.insert(index, item);
  void updateFriendlistAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      friendlist[index] = updateFn(friendlist[index]);

  bool toggle = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
