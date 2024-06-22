import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart';
import '/notyetneeded/amenitity_indicator/amenitity_indicator_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'jjjk_model.dart';
export 'jjjk_model.dart';

class JjjkWidget extends StatefulWidget {
  const JjjkWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
  });

  final String? parameter1;
  final int? parameter2;
  final bool? parameter3;
  final bool? parameter4;
  final bool? parameter5;
  final bool? parameter6;
  final LatLng? parameter7;

  @override
  State<JjjkWidget> createState() => _JjjkWidgetState();
}

class _JjjkWidgetState extends State<JjjkWidget> with TickerProviderStateMixin {
  late JjjkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JjjkModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment(0.0, 0),
              child: FlutterFlowButtonTabBar(
                useToggleButtonStyle: false,
                labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                    ),
                unselectedLabelStyle: TextStyle(),
                labelColor: FlutterFlowTheme.of(context).turquoise,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                unselectedBackgroundColor:
                    FlutterFlowTheme.of(context).alternate,
                borderColor: FlutterFlowTheme.of(context).primaryText,
                unselectedBorderColor: FlutterFlowTheme.of(context).alternate,
                borderWidth: 3.0,
                borderRadius: 8.0,
                elevation: 6.0,
                buttonMargin:
                    EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                padding: EdgeInsets.all(24.0),
                tabs: [
                  Tab(
                    text: 'Today',
                  ),
                ],
                controller: _model.tabBarController,
                onTap: (i) async {
                  [() async {}][i]();
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _model.tabBarController,
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 3.93,
                        height: 796.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).darkText,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 44.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 30.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 350.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 9.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                  child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 590),
                                                    curve: Curves.bounceOut,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.148,
                                                    height: 337.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (loggedIn) {
                                                          Navigator.pop(
                                                              context);
                                                        } else {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    AuthorizationWidget(),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        }
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          12.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                child: Text(
                                                                                  '210 feet Away  ',
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 15.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              AlignedTooltip(
                                                                            content:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Text(
                                                                                'Available',
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            offset:
                                                                                4.0,
                                                                            preferredDirection:
                                                                                AxisDirection.left,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            tailBaseWidth:
                                                                                24.0,
                                                                            tailLength:
                                                                                12.0,
                                                                            waitDuration:
                                                                                Duration(milliseconds: 100),
                                                                            showDuration:
                                                                                Duration(milliseconds: 1500),
                                                                            triggerMode:
                                                                                TooltipTriggerMode.tap,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 25.0,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            2.0,
                                                                                          ),
                                                                                          spreadRadius: 2.0,
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 10.0),
                                                                                    child: Text(
                                                                                      'online',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: FlutterFlowTheme.of(context).turquoise,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              AlignedTooltip(
                                                                            content:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Text(
                                                                                'Booked',
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            offset:
                                                                                4.0,
                                                                            preferredDirection:
                                                                                AxisDirection.left,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            tailBaseWidth:
                                                                                24.0,
                                                                            tailLength:
                                                                                12.0,
                                                                            waitDuration:
                                                                                Duration(milliseconds: 100),
                                                                            showDuration:
                                                                                Duration(milliseconds: 1500),
                                                                            triggerMode:
                                                                                TooltipTriggerMode.tap,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 25.0,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            2.0,
                                                                                          ),
                                                                                          spreadRadius: 2.0,
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 10.0),
                                                                                    child: Text(
                                                                                      'offline',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: FlutterFlowTheme.of(context).turquoise,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              AlignedTooltip(
                                                                            content:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Text(
                                                                                'Offline',
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            offset:
                                                                                4.0,
                                                                            preferredDirection:
                                                                                AxisDirection.left,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            tailBaseWidth:
                                                                                24.0,
                                                                            tailLength:
                                                                                12.0,
                                                                            waitDuration:
                                                                                Duration(milliseconds: 100),
                                                                            showDuration:
                                                                                Duration(milliseconds: 1500),
                                                                            triggerMode:
                                                                                TooltipTriggerMode.tap,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 25.0,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 4.0,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          offset: Offset(
                                                                                            0.0,
                                                                                            2.0,
                                                                                          ),
                                                                                          spreadRadius: 2.0,
                                                                                        )
                                                                                      ],
                                                                                      shape: BoxShape.circle,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(1.0, -1.0),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 15.0, 10.0),
                                                                                    child: Text(
                                                                                      'busy',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: FlutterFlowTheme.of(context).turquoise,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              GradientText(
                                                                            '${widget.parameter1}   '.maybeHandleOverflow(maxChars: 15),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Urbanist',
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w900,
                                                                                ),
                                                                            colors: [
                                                                              FlutterFlowTheme.of(context).primary,
                                                                              FlutterFlowTheme.of(context).secondary
                                                                            ],
                                                                            gradientDirection:
                                                                                GradientDirection.ltr,
                                                                            gradientType:
                                                                                GradientType.linear,
                                                                          ),
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .settings_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              GradientText(
                                                                            '62/hr',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Urbanist',
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w900,
                                                                                ),
                                                                            colors: [
                                                                              FlutterFlowTheme.of(context).primary,
                                                                              FlutterFlowTheme.of(context).secondary
                                                                            ],
                                                                            gradientDirection:
                                                                                GradientDirection.ltr,
                                                                            gradientType:
                                                                                GradientType.linear,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            GradientText(
                                                                          '150/day',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Urbanist',
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w900,
                                                                              ),
                                                                          colors: [
                                                                            FlutterFlowTheme.of(context).primary,
                                                                            FlutterFlowTheme.of(context).secondary
                                                                          ],
                                                                          gradientDirection:
                                                                              GradientDirection.ltr,
                                                                          gradientType:
                                                                              GradientType.linear,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child: Lottie
                                                                        .asset(
                                                                      'assets/lottie_animations/Animation_-_1699416210743.json',
                                                                      width:
                                                                          66.0,
                                                                      height:
                                                                          46.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      animate:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Container(
                                                              width: 373.0,
                                                              height: 114.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              AlignedTooltip(
                                                                            content:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(4.0),
                                                                              child: Text(
                                                                                'AC',
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            offset:
                                                                                4.0,
                                                                            preferredDirection:
                                                                                AxisDirection.right,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                4.0,
                                                                            tailBaseWidth:
                                                                                24.0,
                                                                            tailLength:
                                                                                12.0,
                                                                            waitDuration:
                                                                                Duration(milliseconds: 100),
                                                                            showDuration:
                                                                                Duration(milliseconds: 1500),
                                                                            triggerMode:
                                                                                TooltipTriggerMode.tap,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                wrapWithModel(
                                                                                  model: _model.acModel,
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: AmenitityIndicatorWidget(
                                                                                    icon: Icon(
                                                                                      Icons.ac_unit_outlined,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                    background: widget.parameter3! ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    'A/C',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Urbanist',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Storage',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              4.0,
                                                                          preferredDirection:
                                                                              AxisDirection.down,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              24.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              wrapWithModel(
                                                                                model: _model.storageModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: AmenitityIndicatorWidget(
                                                                                  icon: Icon(
                                                                                    Icons.local_grocery_store_outlined,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                  background: widget.parameter4! ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '+ Storage',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Message...',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              4.0,
                                                                          preferredDirection:
                                                                              AxisDirection.down,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              24.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              wrapWithModel(
                                                                                model: _model.radioModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: AmenitityIndicatorWidget(
                                                                                  icon: Icon(
                                                                                    Icons.audiotrack,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                  background: widget.parameter5! ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Radio',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Urbanist',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Gas Powered',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              4.0,
                                                                          preferredDirection:
                                                                              AxisDirection.right,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              24.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              wrapWithModel(
                                                                                model: _model.gasModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: AmenitityIndicatorWidget(
                                                                                  icon: Icon(
                                                                                    Icons.local_gas_station,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                  background: Color(0x00000000),
                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Gas',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Urbanist',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        AlignedTooltip(
                                                                          content:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(4.0),
                                                                            child:
                                                                                Text(
                                                                              'Electric Powered',
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          offset:
                                                                              4.0,
                                                                          preferredDirection:
                                                                              AxisDirection.right,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              4.0,
                                                                          tailBaseWidth:
                                                                              24.0,
                                                                          tailLength:
                                                                              12.0,
                                                                          waitDuration:
                                                                              Duration(milliseconds: 100),
                                                                          showDuration:
                                                                              Duration(milliseconds: 1500),
                                                                          triggerMode:
                                                                              TooltipTriggerMode.tap,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              wrapWithModel(
                                                                                model: _model.electricModel,
                                                                                updateCallback: () => setState(() {}),
                                                                                child: AmenitityIndicatorWidget(
                                                                                  icon: Icon(
                                                                                    Icons.electric_bolt,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                  background: widget.parameter6! ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'Electric',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Urbanist',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.12,
                                                                    0.03),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/2vqf7_',
                                                                width: 157.0,
                                                                height: 129.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        -1.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.89,
                                                                    -0.66),
                                                            child:
                                                                FlutterFlowStaticMap(
                                                              location: widget
                                                                  .parameter7!,
                                                              apiKey:
                                                                  'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2c1NGhuMHg2djNlcWoxaGtpZnI5ciJ9.Ii17AAUzJUtFJAcvYbw5Mw',
                                                              style: mapbox
                                                                  .MapBoxStyle
                                                                  .Outdoors,
                                                              width: 150.0,
                                                              height: 100.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              markerColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              zoom: 15,
                                                              tilt: 60,
                                                              rotation: 0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
