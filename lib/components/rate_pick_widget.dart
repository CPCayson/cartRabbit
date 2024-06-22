import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rate_pick_model.dart';
export 'rate_pick_model.dart';

class RatePickWidget extends StatefulWidget {
  const RatePickWidget({super.key});

  @override
  State<RatePickWidget> createState() => _RatePickWidgetState();
}

class _RatePickWidgetState extends State<RatePickWidget> {
  late RatePickModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatePickModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 502.0,
      height: 220.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: StreamBuilder<List<CartsRecord>>(
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
                List<CartsRecord> containerCartsRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerCartsRecord = containerCartsRecordList.isNotEmpty
                    ? containerCartsRecordList.first
                    : null;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 110.0,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<CartsRecord>>(
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .turquoise,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CartsRecord>
                                                countControllerCartsRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final countControllerCartsRecord =
                                                countControllerCartsRecordList
                                                        .isNotEmpty
                                                    ? countControllerCartsRecordList
                                                        .first
                                                    : null;
                                            return Material(
                                              color: Colors.transparent,
                                              child: Container(
                                                width: 300.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child:
                                                    FlutterFlowCountController(
                                                  decrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons
                                                        .keyboard_double_arrow_down_rounded,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .redApple
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 90.0,
                                                  ),
                                                  incrementIconBuilder:
                                                      (enabled) => Icon(
                                                    Icons
                                                        .keyboard_double_arrow_up,
                                                    color: enabled
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .turquoise
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    size: 90.0,
                                                  ),
                                                  countBuilder: (count) => Text(
                                                    count.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  count: _model
                                                          .countControllerValue ??=
                                                      countControllerCartsRecord!
                                                          .cartPricer,
                                                  updateCount: (count) async {
                                                    setState(() => _model
                                                            .countControllerValue =
                                                        count);
                                                    setState(() {});
                                                  },
                                                  stepSize: 1,
                                                  minimum: 2,
                                                  maximum: 15,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.15, -0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            115.0, 31.0, 0.0, 0.0),
                                        child: Text(
                                          '\$',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                fontSize: 25.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.14, -5.69),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            108.0, 67.0, 0.0, 0.0),
                                        child: Text(
                                          'Price Per Hour',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.15, -0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            115.0, 31.0, 0.0, 0.0),
                                        child: Text(
                                          '\$',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                fontSize: 25.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.14, -5.69),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            108.0, 67.0, 0.0, 0.0),
                                        child: Text(
                                          'Price Per Hour',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                letterSpacing: 0.0,
                                              ),
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
                              0.0, 20.0, 0.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {});
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'Price',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark600,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '70%',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        'taxes',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineGray,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '0.06%',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .customColor4,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        '\$\$\$ per hour',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.black,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      functions
                                          .stepcont(_model.countControllerValue)
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
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
            ),
          ),
        ],
      ),
    );
  }
}
