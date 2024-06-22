import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/lat_lng.dart';
import '/notyetneeded/amenitity_indicator/amenitity_indicator_widget.dart';
import '/notyetneeded/waiting/waiting_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'rent_model.dart';
export 'rent_model.dart';

class RentWidget extends StatefulWidget {
  const RentWidget({super.key});

  @override
  State<RentWidget> createState() => _RentWidgetState();
}

class _RentWidgetState extends State<RentWidget> {
  late RentModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RentModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitWave(
              color: FlutterFlowTheme.of(context).turquoise,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        height: 631.0,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: StreamBuilder<List<CartsRecord>>(
                stream: queryCartsRecord(
                  queryBuilder: (cartsRecord) => cartsRecord.where(
                    'hostRef',
                    isNotEqualTo: currentUserReference,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitWave(
                          color: FlutterFlowTheme.of(context).turquoise,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<CartsRecord> cartsCartsRecordList = snapshot.data!;
                  if (cartsCartsRecordList.isEmpty) {
                    return WaitingWidget();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: cartsCartsRecordList.length,
                    itemBuilder: (context, cartsIndex) {
                      final cartsCartsRecord = cartsCartsRecordList[cartsIndex];
                      return Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 374.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 9.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 590),
                                  curve: Curves.bounceOut,
                                  width:
                                      MediaQuery.sizeOf(context).width * 1.148,
                                  height: 337.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      width: 2.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: RentWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Text(
                                                                '${formatNumber(
                                                                  functions.cartDist(
                                                                      currentUserLocationValue,
                                                                      cartsCartsRecord
                                                                          .cartLoc),
                                                                  formatType:
                                                                      FormatType
                                                                          .compactLong,
                                                                )} feet Away  ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if ((cartsCartsRecord
                                                                  .isAvailable ==
                                                              true) &&
                                                          (cartsCartsRecord
                                                                  .isBooked ==
                                                              false))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: AlignedTooltip(
                                                            content: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                'Available',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            offset: 4.0,
                                                            preferredDirection:
                                                                AxisDirection
                                                                    .left,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            elevation: 4.0,
                                                            tailBaseWidth: 24.0,
                                                            tailLength: 12.0,
                                                            waitDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        100),
                                                            showDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        1500),
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .tap,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            15.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      'online',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).turquoise,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      if ((cartsCartsRecord
                                                                  .isAvailable ==
                                                              false) &&
                                                          (cartsCartsRecord
                                                                  .isBooked ==
                                                              false))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: AlignedTooltip(
                                                            content: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                'Booked',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            offset: 4.0,
                                                            preferredDirection:
                                                                AxisDirection
                                                                    .left,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            elevation: 4.0,
                                                            tailBaseWidth: 24.0,
                                                            tailLength: 12.0,
                                                            waitDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        100),
                                                            showDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        1500),
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .tap,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            15.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      'offline',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).turquoise,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      if ((cartsCartsRecord
                                                                  .isBooked ==
                                                              true) &&
                                                          (cartsCartsRecord
                                                                  .isAvailable ==
                                                              false))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: AlignedTooltip(
                                                            content: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                'Offline',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            offset: 4.0,
                                                            preferredDirection:
                                                                AxisDirection
                                                                    .left,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            elevation: 4.0,
                                                            tailBaseWidth: 24.0,
                                                            tailLength: 12.0,
                                                            waitDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        100),
                                                            showDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        1500),
                                                            triggerMode:
                                                                TooltipTriggerMode
                                                                    .tap,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 25.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                          spreadRadius:
                                                                              2.0,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            -1.0),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            15.0,
                                                                            10.0),
                                                                    child: Text(
                                                                      'busy',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).turquoise,
                                                                            letterSpacing:
                                                                                0.0,
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
                                                          1.0, -1.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: GradientText(
                                                          '${cartsCartsRecord.name}   '
                                                              .maybeHandleOverflow(
                                                                  maxChars: 15),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary
                                                          ],
                                                          gradientDirection:
                                                              GradientDirection
                                                                  .ltr,
                                                          gradientType:
                                                              GradientType
                                                                  .linear,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.settings_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      Text(
                                                        cartsCartsRecord.seats
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: GradientText(
                                                          '62/hr',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary
                                                          ],
                                                          gradientDirection:
                                                              GradientDirection
                                                                  .ltr,
                                                          gradientType:
                                                              GradientType
                                                                  .linear,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: GradientText(
                                                        '150/day',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                ),
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary
                                                        ],
                                                        gradientDirection:
                                                            GradientDirection
                                                                .ltr,
                                                        gradientType:
                                                            GradientType.linear,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 1.0),
                                                  child: Lottie.asset(
                                                    'assets/lottie_animations/Animation_-_1699416210743.json',
                                                    width: 66.0,
                                                    height: 46.0,
                                                    fit: BoxFit.contain,
                                                    animate: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            width: 373.0,
                                            height: 114.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: AlignedTooltip(
                                                          content: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'AC',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          offset: 4.0,
                                                          preferredDirection:
                                                              AxisDirection
                                                                  .right,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          elevation: 4.0,
                                                          tailBaseWidth: 24.0,
                                                          tailLength: 12.0,
                                                          waitDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                          showDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      1500),
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .tap,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              AmenitityIndicatorWidget(
                                                                key: Key(
                                                                    'Keywlj_${cartsIndex}_of_${cartsCartsRecordList.length}'),
                                                                icon: Icon(
                                                                  Icons
                                                                      .ac_unit_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 30.0,
                                                                ),
                                                                background: cartsCartsRecord
                                                                        .air
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .turquoise
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent3,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'A/C',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            'Storage',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.down,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        elevation: 4.0,
                                                        tailBaseWidth: 24.0,
                                                        tailLength: 12.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            AmenitityIndicatorWidget(
                                                              key: Key(
                                                                  'Keynuu_${cartsIndex}_of_${cartsCartsRecordList.length}'),
                                                              icon: Icon(
                                                                Icons
                                                                    .local_grocery_store_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 30.0,
                                                              ),
                                                              background: cartsCartsRecord
                                                                      .storage
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .turquoise
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '+ Storage',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            'Message...',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.down,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        elevation: 4.0,
                                                        tailBaseWidth: 24.0,
                                                        tailLength: 12.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            AmenitityIndicatorWidget(
                                                              key: Key(
                                                                  'Keyn1v_${cartsIndex}_of_${cartsCartsRecordList.length}'),
                                                              icon: Icon(
                                                                Icons
                                                                    .audiotrack,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 30.0,
                                                              ),
                                                              background: cartsCartsRecord
                                                                      .radio
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .turquoise
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            Text(
                                                              'Radio',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            'Gas Powered',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.right,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        elevation: 4.0,
                                                        tailBaseWidth: 24.0,
                                                        tailLength: 12.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            AmenitityIndicatorWidget(
                                                              key: Key(
                                                                  'Keyat1_${cartsIndex}_of_${cartsCartsRecordList.length}'),
                                                              icon: Icon(
                                                                Icons
                                                                    .local_gas_station,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 30.0,
                                                              ),
                                                              background: !cartsCartsRecord.isElectric
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .turquoise
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            Text(
                                                              'Gas',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      AlignedTooltip(
                                                        content: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  4.0),
                                                          child: Text(
                                                            'Electric Powered',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        offset: 4.0,
                                                        preferredDirection:
                                                            AxisDirection.right,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        elevation: 4.0,
                                                        tailBaseWidth: 24.0,
                                                        tailLength: 12.0,
                                                        waitDuration: Duration(
                                                            milliseconds: 100),
                                                        showDuration: Duration(
                                                            milliseconds: 1500),
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            AmenitityIndicatorWidget(
                                                              key: Key(
                                                                  'Keypo2_${cartsIndex}_of_${cartsCartsRecordList.length}'),
                                                              icon: Icon(
                                                                Icons
                                                                    .electric_bolt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 30.0,
                                                              ),
                                                              background: cartsCartsRecord.isElectric
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .turquoise
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                            ),
                                                            Text(
                                                              'Electric',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    letterSpacing:
                                                                        0.0,
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
                                          alignment: AlignmentDirectional(
                                              -0.89, -0.66),
                                          child: FlutterFlowStaticMap(
                                            location: cartsCartsRecord.cartLoc!,
                                            apiKey:
                                                'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2c1NGhuMHg2djNlcWoxaGtpZnI5ciJ9.Ii17AAUzJUtFJAcvYbw5Mw',
                                            style: mapbox.MapBoxStyle
                                                .Satellite_Street_V11,
                                            width: 150.0,
                                            height: 100.0,
                                            fit: BoxFit.contain,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                            markerColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            zoom: 15,
                                            tilt: 60,
                                            rotation: 0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.12, 0.03),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            child: Image.asset(
                                              'assets/images/cart.png',
                                              width: 157.0,
                                              height: 129.0,
                                              fit: BoxFit.contain,
                                              alignment: Alignment(0.0, -1.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
