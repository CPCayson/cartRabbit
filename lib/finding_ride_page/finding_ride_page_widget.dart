import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/components/toprevview_widget.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'finding_ride_page_model.dart';
export 'finding_ride_page_model.dart';

class FindingRidePageWidget extends StatefulWidget {
  const FindingRidePageWidget({
    super.key,
    this.rideDetailsReference,
    this.chatRef,
  });

  final DocumentReference? rideDetailsReference;
  final ChatsRecord? chatRef;

  @override
  State<FindingRidePageWidget> createState() => _FindingRidePageWidgetState();
}

class _FindingRidePageWidgetState extends State<FindingRidePageWidget> {
  late FindingRidePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FindingRidePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<ChatsRecord> findingRidePageChatsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (loggedIn)
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 250.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          alignment: AlignmentDirectional(0.0, -1.0),
                        ),
                      ),
                    ),
                  FlutterFlowStaticMap(
                    location: LatLng(30.0, 80.0),
                    apiKey:
                        'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2cyb2ptMHZzaDNkbnZpdXE1dXJuYiJ9.9SyfRX56W4cMI3uGknvffQ',
                    style: mapbox.MapBoxStyle.Satellite_Street_V11,
                    width: double.infinity,
                    height: 300.0,
                    fit: BoxFit.fill,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    markerColor: FlutterFlowTheme.of(context).primaryText,
                    zoom: 5,
                    tilt: 0,
                    rotation: 0,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (loggedIn)
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: double.infinity,
                              height: 90.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Found Ride',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitWave(
                                      color: FlutterFlowTheme.of(context)
                                          .turquoise,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<UsersRecord> containerUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final containerUsersRecord =
                                  containerUsersRecordList.isNotEmpty
                                      ? containerUsersRecordList.first
                                      : null;
                              return Container(
                                width: 464.0,
                                height: 260.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x34090F13),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Stack(
                                  children: [
                                    if (_model.toggle == true)
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            singleRecord: true,
                                          ),
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
                                            List<UsersRecord>
                                                columnUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final columnUsersRecord =
                                                columnUsersRecordList.isNotEmpty
                                                    ? columnUsersRecordList
                                                        .first
                                                    : null;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'chatDetails',
                                                      queryParameters: {
                                                        'chatRef':
                                                            serializeParam(
                                                          widget.chatRef
                                                              ?.reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'chatUser':
                                                            serializeParam(
                                                          columnUsersRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatUser':
                                                            columnUsersRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.sms,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .turquoise,
                                                    size: 50.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    child: Image.asset(
                                                      'assets/images/Untitled-3.png',
                                                      width: 119.0,
                                                      height: 125.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Tip',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Hello World',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          columnUsersRecord
                                                              ?.location
                                                              ?.toString(),
                                                          'hop hop hop',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  300.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .turquoise,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, -1.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.41, -1.39),
                                      child: Lottie.asset(
                                        'assets/lottie_animations/Animation_-_1718672451739.json',
                                        width: 197.0,
                                        height: 119.0,
                                        fit: BoxFit.cover,
                                        frameRate: FrameRate(300.0),
                                        animate: true,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        if (loggedIn)
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 30.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (valueOrDefault<bool>(
                                    loggedIn,
                                    true,
                                  ))
                                    Container(
                                      width: double.infinity,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: wrapWithModel(
                                        model: _model.toprevviewModel,
                                        updateCallback: () => setState(() {}),
                                        child: ToprevviewWidget(),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.toggle = !_model.toggle;
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.settings_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            'Arriving in',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 8.0, 16.0, 0.0),
                                                child: Text(
                                                  '10 mins',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 8.0),
                                                child: Text(
                                                  '10 mins',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFAFAFAF),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.carrot,
                                              color: Color(0xFFF2AA8A),
                                              size: 39.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.carrot,
                                              color: Color(0xFFF2AA8A),
                                              size: 39.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.carrot,
                                              color: Color(0xFFF2AA8A),
                                              size: 39.0,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.carrot,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 39.0,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Color(0xFFACACAC),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
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
