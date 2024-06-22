import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/waiting/waiting_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'ridee_widget.dart' show RideeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RideeModel extends FlutterFlowModel<RideeWidget> {
  ///  Local state fields for this component.

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
