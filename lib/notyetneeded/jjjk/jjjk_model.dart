import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart';
import '/notyetneeded/amenitity_indicator/amenitity_indicator_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'jjjk_widget.dart' show JjjkWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class JjjkModel extends FlutterFlowModel<JjjkWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for AC.
  late AmenitityIndicatorModel acModel;
  // Model for storage.
  late AmenitityIndicatorModel storageModel;
  // Model for radio.
  late AmenitityIndicatorModel radioModel;
  // Model for gas.
  late AmenitityIndicatorModel gasModel;
  // Model for electric.
  late AmenitityIndicatorModel electricModel;

  @override
  void initState(BuildContext context) {
    acModel = createModel(context, () => AmenitityIndicatorModel());
    storageModel = createModel(context, () => AmenitityIndicatorModel());
    radioModel = createModel(context, () => AmenitityIndicatorModel());
    gasModel = createModel(context, () => AmenitityIndicatorModel());
    electricModel = createModel(context, () => AmenitityIndicatorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    acModel.dispose();
    storageModel.dispose();
    radioModel.dispose();
    gasModel.dispose();
    electricModel.dispose();
  }
}
