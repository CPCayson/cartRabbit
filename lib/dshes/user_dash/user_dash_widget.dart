import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/pages/dashboards/user/book_rejected_user/book_rejected_user_widget.dart';
import '/pages/dashboards/user/user_b_p/rabbit_confirms/rabbit_confirms_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'user_dash_model.dart';
export 'user_dash_model.dart';

class UserDashWidget extends StatefulWidget {
  const UserDashWidget({Key? key}) : super(key: key);

  @override
  _UserDashWidgetState createState() => _UserDashWidgetState();
}

class _UserDashWidgetState extends State<UserDashWidget> {
  late UserDashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().isBooked = false;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<TripsRecord>>(
      stream: queryTripsRecord(
        singleRecord: true,
      )..listen((snapshot) async {
          List<TripsRecord> userDashTripsRecordList = snapshot;
          final userDashTripsRecord = userDashTripsRecordList.isNotEmpty
              ? userDashTripsRecordList.first
              : null;
          if (_model.userDashPreviousSnapshot != null &&
              !const ListEquality(TripsRecordDocumentEquality()).equals(
                  userDashTripsRecordList, _model.userDashPreviousSnapshot)) {
            if (!FFAppState().isbookedHost) {
              Navigator.pop(context);
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: BookRejectedUserWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            }

            setState(() {});
          }
          _model.userDashPreviousSnapshot = snapshot;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).turquoise,
            body: Center(
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
        List<TripsRecord> userDashTripsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final userDashTripsRecord = userDashTripsRecordList.isNotEmpty
            ? userDashTripsRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).turquoise,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).darkText,
              automaticallyImplyLeading: false,
              title: StreamBuilder<List<CartsRecord>>(
                stream: queryCartsRecord(),
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
                  List<CartsRecord> containerCartsRecordList = snapshot.data!;
                  return Container(
                    width: 414.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).white,
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.92, 0.81),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 60.0, 0.0),
                                    child: Lottie.asset(
                                      'assets/lottie_animations/Animation_-_1699416210743.json',
                                      width: 150.0,
                                      height: 79.0,
                                      fit: BoxFit.contain,
                                      animate: true,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFAppState().isBooked.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.25, -0.50),
                                      child: AutoSizeText(
                                        'cartRABBIT',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .turquoise,
                                              fontSize: 40.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Container(
                                  height: 713.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: StreamBuilder<List<CartsRecord>>(
                                          stream: queryCartsRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitWave(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .turquoise,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CartsRecord>
                                                listViewCartsRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewCartsRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCartsRecord =
                                                    listViewCartsRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .btnText,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x32000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            scaffoldKey
                                                                .currentState!
                                                                .openDrawer();
                                                          },
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            13.0,
                                                                            24.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (FFAppState().cartlikes.contains(listViewCartsRecord.reference) ==
                                                                                true) {
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    setState(() {
                                                                                      FFAppState().addToSelectedcarts(listViewCartsRecord.reference);
                                                                                    });
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.carrot,
                                                                                    color: Color(0xFFEE8B60),
                                                                                    size: 50.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  setState(() {
                                                                                    FFAppState().removeFromSelectedcarts(listViewCartsRecord.reference);
                                                                                  });
                                                                                },
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.carrot,
                                                                                  color: FlutterFlowTheme.of(context).overlay,
                                                                                  size: 50.0,
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.00,
                                                                          0.00),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Text(
                                                                        functions
                                                                            .cartLoc(currentUserDocument?.currentLocation,
                                                                                currentUserDocument?.currentLocation)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Opacity(
                                                                        opacity:
                                                                            0.4,
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.00,
                                                                              -1.00),
                                                                          child:
                                                                              FlutterFlowStaticMap(
                                                                            location:
                                                                                LatLng(9.341465, -79.891704),
                                                                            apiKey:
                                                                                'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2cyb2ptMHZzaDNkbnZpdXE1dXJuYiJ9.9SyfRX56W4cMI3uGknvffQ',
                                                                            style:
                                                                                MapBoxStyle.Light,
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            markerColor:
                                                                                FlutterFlowTheme.of(context).turquoise,
                                                                            zoom:
                                                                                12,
                                                                            tilt:
                                                                                0,
                                                                            rotation:
                                                                                0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'hostPage');
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/gc2.jpg',
                                                                        width:
                                                                            223.0,
                                                                        height:
                                                                            137.0,
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (FFAppState()
                                                                        .isBooked) {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {},
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              177.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).grayIcon,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: FlutterFlowTheme.of(context).customColor4,
                                                                                offset: Offset(0.0, 4.0),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Booked',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            enableDrag:
                                                                                false,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: RabbitConfirmsWidget(
                                                                                    docRef: listViewCartsRecord.reference,
                                                                                    cartID: listViewCartsRecord.cartID,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              safeSetState(() {}));

                                                                          await listViewCartsRecord
                                                                              .reference
                                                                              .update(createCartsRecordData(
                                                                            isBooked:
                                                                                true,
                                                                          ));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              177.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xCD39E9D5),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: FlutterFlowTheme.of(context).turquoise,
                                                                                offset: Offset(0.0, 4.0),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Rent',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).titleLarge,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          23.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    listViewCartsRecord
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  listViewCartsRecord
                                                                      .cartPricer
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium,
                                                                ),
                                                                Text(
                                                                  listViewCartsRecord
                                                                      .description,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .location_pin,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    size: 15.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
