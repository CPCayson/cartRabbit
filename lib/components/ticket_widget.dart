import '/backend/backend.dart';
import '/components/connect_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'ticket_model.dart';
export 'ticket_model.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    required this.parameter5,
  }) : super(key: key);

  final String? parameter1;
  final String? parameter2;
  final int? parameter3;
  final int? parameter4;
  final String? parameter5;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget>
    with TickerProviderStateMixin {
  late TicketModel _model;

  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CartsRecord>>(
      stream: queryCartsRecord(
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
                color: FlutterFlowTheme.of(context).turquoise,
                size: 50.0,
              ),
            ),
          );
        }
        List<CartsRecord> stackCartsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final stackCartsRecord =
            stackCartsRecordList.isNotEmpty ? stackCartsRecordList.first : null;
        return Stack(
          children: [
            Container(
              width: 496.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectionArea(
                          child: Text(
                        'My Ticket',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                      )),
                      Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: Color(0x34FFFFFF),
                          icon: FaIcon(
                            FontAwesomeIcons.codeBranch,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            await Share.share(
                              '',
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Container(
                    width: double.infinity,
                    height: 650.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 852.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF512086),
                                              Color(0xFFFF9C70)
                                            ],
                                            stops: [0.4, 1.0],
                                            begin: AlignmentDirectional(
                                                -1.0, -0.87),
                                            end:
                                                AlignmentDirectional(1.0, 0.87),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SelectionArea(
                                                  child: Text(
                                                'Ticket',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              )),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 1.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<TripsRecord>>(
                                                    stream: queryTripsRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitWave(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .turquoise,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TripsRecord>
                                                          barcodeTripsRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final barcodeTripsRecord =
                                                          barcodeTripsRecordList
                                                                  .isNotEmpty
                                                              ? barcodeTripsRecordList
                                                                  .first
                                                              : null;
                                                      return BarcodeWidget(
                                                        data:
                                                            widget.parameter1!,
                                                        barcode:
                                                            Barcode.code128(),
                                                        width: 200.0,
                                                        height: 90.0,
                                                        color:
                                                            Color(0xCD41FFEA),
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        errorBuilder: (_context,
                                                                _error) =>
                                                            SizedBox(
                                                          width: 200.0,
                                                          height: 90.0,
                                                        ),
                                                        drawText: false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 30.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: Image.asset(
                                                    'assets/images/rooster.png',
                                                    width: 300.0,
                                                    height: 171.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 30.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SelectionArea(
                                                            child: Text(
                                                          'Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: Color(
                                                                    0x80FFFFFF),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        stackCartsRecord!
                                                            .ownersName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Urbanist',
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 50.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.00, 0.00),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SelectionArea(
                                                              child: Text(
                                                            'Location',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0x80FFFFFF),
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SelectionArea(
                                                  child: Text(
                                                getCurrentTimestamp.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              )),
                                              SelectionArea(
                                                  child: Text(
                                                'Date',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Urbanist',
                                                      color: Color(0x80FFFFFF),
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              )),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SelectionArea(
                                                              child: Text(
                                                            'Start Time',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0x80FFFFFF),
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                          SelectionArea(
                                                              child: Text(
                                                            formatNumber(
                                                              widget.parameter3! *
                                                                  widget
                                                                      .parameter4!,
                                                              formatType:
                                                                  FormatType
                                                                      .compactLong,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                          SelectionArea(
                                                              child: Text(
                                                            'Stop Time',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0x80FFFFFF),
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              widget
                                                                  .parameter5!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 1.00),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Color(0xFFFFA500),
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        icon: Icon(
                                                          Icons.phone_in_talk,
                                                          color: Colors.white,
                                                          size: 30.0,
                                                        ),
                                                        onPressed: () async {
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
                                                                    Container(
                                                                  height: 386.0,
                                                                  child:
                                                                      ConnectWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'iconButtonOnPageLoadAnimation']!),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 500.0, 5.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1D0526),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Flexible(
                                        child: SelectionArea(
                                            child: Text(
                                          '---------------------------',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color: Color(0xFF1D0526),
                                                letterSpacing: 3.0,
                                              ),
                                        )),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1D0526),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, -0.58),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 300.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1D0526),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SelectionArea(
                                            child: Text(
                                          '---------------------------',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color: Color(0xFF1D0526),
                                                letterSpacing: 3.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )),
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF1D0526),
                                            shape: BoxShape.circle,
                                          ),
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
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
