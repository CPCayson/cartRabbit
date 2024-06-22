import '/components/modal02_create_message_image_widget.dart';
import '/components/ride_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/chat_groupwbubbles/rent/rent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'ljnklkj_model.dart';
export 'ljnklkj_model.dart';

class LjnklkjWidget extends StatefulWidget {
  const LjnklkjWidget({super.key});

  @override
  State<LjnklkjWidget> createState() => _LjnklkjWidgetState();
}

class _LjnklkjWidgetState extends State<LjnklkjWidget>
    with TickerProviderStateMixin {
  late LjnklkjModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LjnklkjModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).turquoise,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Urbanist',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding: EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: 'Rent',
                          ),
                          Tab(
                            text: 'Ride',
                          ),
                          Tab(
                            text: 'Task',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          wrapWithModel(
                            model: _model.rideModel,
                            updateCallback: () => setState(() {}),
                            child: RideWidget(
                              parameter1: false,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.rentModel,
                                updateCallback: () => setState(() {}),
                                child: RentWidget(),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Text(
                                'Tab View 3',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              wrapWithModel(
                                model: _model.modal02CreateMessageImageModel,
                                updateCallback: () => setState(() {}),
                                child: Modal02CreateMessageImageWidget(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.84, 0.13),
                    child: Text(
                      'cartRABBIT',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).turquoise,
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        'assets/images/cart.png',
                        width: 160.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.66, -0.97),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
                      child: Lottie.asset(
                        'assets/lottie_animations/Animation_-_1699416210743.json',
                        width: 150.0,
                        height: 63.0,
                        fit: BoxFit.contain,
                        animate: true,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Privacy');
                          },
                          child: Text(
                            'Privacy',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('tTerms');
                          },
                          child: Text(
                            'Terms of Service ToS',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Text(
                            'CaysonPointStudio LLC 2024',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
      ),
    );
  }
}
