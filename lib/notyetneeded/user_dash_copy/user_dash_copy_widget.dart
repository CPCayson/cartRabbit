import '/backend/schema/structs/index.dart';
import '/components/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/scan_cart_button/scan_cart_button_widget.dart';
import '/notyetneeded/waiting/waiting_widget.dart';
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
import 'user_dash_copy_model.dart';
export 'user_dash_copy_model.dart';

class UserDashCopyWidget extends StatefulWidget {
  const UserDashCopyWidget({super.key});

  @override
  State<UserDashCopyWidget> createState() => _UserDashCopyWidgetState();
}

class _UserDashCopyWidgetState extends State<UserDashCopyWidget> {
  late UserDashCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDashCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      setState(() {
        FFAppState().APPUSER = UserStruct(
          userCurrentLocation: currentUserLocationValue,
        );
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
    context.watch<FFAppState>();

    return Title(
        title: 'userDashCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).turquoise,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.navModel,
                updateCallback: () => setState(() {}),
                child: NavWidget(),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).tertiary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: Icon(
                    Icons.sort,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 50.0,
                  ),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('mapPage');
                          },
                          text: 'Map View',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            height: 34.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).turquoise,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('cartslist');
                                },
                                child: AutoSizeText(
                                  'cartRABBIT',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 60.0, 0.0),
                                child: Container(
                                  width: 43.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height: 300.0,
                                                  child: ScanCartButtonWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: BarcodeWidget(
                                        data: 'Barcode',
                                        barcode: Barcode.qrCode(),
                                        width: 90.0,
                                        height: 90.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        backgroundColor: Colors.transparent,
                                        errorBuilder: (_context, _error) =>
                                            SizedBox(
                                          width: 90.0,
                                          height: 90.0,
                                        ),
                                        drawText: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 150.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Container(
                  height: 631.0,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final localCarts = FFAppState().LOCALCARTS.toList();
                            if (localCarts.isEmpty) {
                              return WaitingWidget();
                            }
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: localCarts.length,
                              itemBuilder: (context, localCartsIndex) {
                                final localCartsItem =
                                    localCarts[localCartsIndex];
                                return Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 590),
                                            curve: Curves.bounceOut,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.148,
                                            height: 337.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
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
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {},
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Text(
                                                                          localCartsItem
                                                                              .cartId,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .event_seat,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    localCartsItem
                                                                        .cartCapacity
                                                                        .toString(),
                                                                    '0',
                                                                  ),
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
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      GradientText(
                                                                    '62/hr',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w900,
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
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    GradientText(
                                                                  '150/day',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w900,
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
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 1.0),
                                                            child: Lottie.asset(
                                                              'assets/lottie_animations/Animation_-_1699416210743.json',
                                                              width: 66.0,
                                                              height: 46.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              animate: true,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.12, 0.03),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0),
                                                        topRight:
                                                            Radius.circular(
                                                                8.0),
                                                      ),
                                                      child: Image.network(
                                                        localCartsItem
                                                            .chartPhoto,
                                                        width: 157.0,
                                                        height: 129.0,
                                                        fit: BoxFit.contain,
                                                        alignment: Alignment(
                                                            0.0, -1.0),
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
              ),
            ),
          ),
        ));
  }
}
