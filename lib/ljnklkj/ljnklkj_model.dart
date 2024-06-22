import '/components/modal02_create_message_image_widget.dart';
import '/components/ride_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/chat_groupwbubbles/rent/rent_widget.dart';
import 'ljnklkj_widget.dart' show LjnklkjWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LjnklkjModel extends FlutterFlowModel<LjnklkjWidget> {
  ///  Local state fields for this page.

  bool toggle = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ride component.
  late RideModel rideModel;
  // Model for rent component.
  late RentModel rentModel;
  // Model for Modal02CreateMessageImage component.
  late Modal02CreateMessageImageModel modal02CreateMessageImageModel;

  @override
  void initState(BuildContext context) {
    rideModel = createModel(context, () => RideModel());
    rentModel = createModel(context, () => RentModel());
    modal02CreateMessageImageModel =
        createModel(context, () => Modal02CreateMessageImageModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    rideModel.dispose();
    rentModel.dispose();
    modal02CreateMessageImageModel.dispose();
  }
}
