import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/components/nav/nav_widget.dart';
import '/components/rate_picker/rate_picker_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/notyetneeded/amenitity_indicator/amenitity_indicator_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'dart:math';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'host_dash_model.dart';
export 'host_dash_model.dart';

class HostDashWidget extends StatefulWidget {
  const HostDashWidget({super.key});

  @override
  State<HostDashWidget> createState() => _HostDashWidgetState();
}

class _HostDashWidgetState extends State<HostDashWidget>
    with TickerProviderStateMixin {
  late HostDashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HostDashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn == false) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: AuthorizationWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 580.0.ms,
            duration: 1120.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.2, 1.2),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'hostDash',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.navModel,
                updateCallback: () => setState(() {}),
                child: NavWidget(),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).turquoise,
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
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 50.0,
                  ),
                ),
                title: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).turquoise,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'guestTracker',
                              queryParameters: {
                                'users': serializeParam(
                                  currentUserReference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: AutoSizeText(
                            'cartRABBIT',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: false,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              height: 670.0,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final myCarts =
                                          FFAppState().CARTS.toList();
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: myCarts.length,
                                        itemBuilder: (context, myCartsIndex) {
                                          final myCartsItem =
                                              myCarts[myCartsIndex];
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 60.0, 0.0, 0.0),
                                              child: Container(
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  child: ExpandableNotifier(
                                                    initialExpanded: false,
                                                    child: ExpandablePanel(
                                                      header: Text(
                                                        myCartsItem
                                                            .cartDisplayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Urbanist',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      collapsed: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 124.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing...',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Urbanist',
                                                                          color:
                                                                              Color(0x8A000000),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                RatePickerWidget(
                                                                  key: Key(
                                                                      'Key2yt_${myCartsIndex}_of_${myCarts.length}'),
                                                                  cartindex:
                                                                      myCartsIndex,
                                                                ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .updateCARTSAtIndex(
                                                                      myCartsIndex,
                                                                      (e) => e
                                                                        ..cartOnline =
                                                                            !e.cartOnline,
                                                                    );
                                                                  });
                                                                },
                                                                child: Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      30.0,
                                                                  shape:
                                                                      const CircleBorder(),
                                                                  child:
                                                                      Container(
                                                                    width: 55.0,
                                                                    height:
                                                                        55.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: myCartsItem.cartOnline
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .turquoise
                                                                          : FlutterFlowTheme.of(context)
                                                                              .redApple,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              14.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).background,
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            3.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .btnText,
                                                                      ),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .lock_open,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .white,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnActionTrigger(
                                                                animationsMap[
                                                                    'containerOnActionTriggerAnimation']!,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      expanded: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 9.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                                child:
                                                                    AnimatedContainer(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          590),
                                                                  curve: Curves
                                                                      .bounceOut,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.148,
                                                                  height: 425.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-0.04, -0.03),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {},
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(8.0),
                                                                                                                bottomRight: Radius.circular(8.0),
                                                                                                                topLeft: Radius.circular(8.0),
                                                                                                                topRight: Radius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Image.asset(
                                                                                                                'assets/images/Untitled-3.png',
                                                                                                                width: 124.0,
                                                                                                                height: 119.0,
                                                                                                                fit: BoxFit.contain,
                                                                                                                alignment: Alignment(0.0, -1.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {},
                                                                                                            child: FlutterFlowStaticMap(
                                                                                                              location: myCartsItem.cartLocation!,
                                                                                                              apiKey: 'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2c1NGhuMHg2djNlcWoxaGtpZnI5ciJ9.Ii17AAUzJUtFJAcvYbw5Mw',
                                                                                                              style: mapbox.MapBoxStyle.Outdoors,
                                                                                                              width: 150.0,
                                                                                                              height: 100.0,
                                                                                                              fit: BoxFit.contain,
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                                topLeft: Radius.circular(0.0),
                                                                                                                topRight: Radius.circular(0.0),
                                                                                                              ),
                                                                                                              markerColor: FlutterFlowTheme.of(context).secondary,
                                                                                                              zoom: 15,
                                                                                                              tilt: 60,
                                                                                                              rotation: 0,
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
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: GradientText(
                                                                                      '${myCartsItem.cartDisplayName}   '.maybeHandleOverflow(maxChars: 15),
                                                                                      textAlign: TextAlign.center,
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
                                                                                      gradientDirection: GradientDirection.ltr,
                                                                                      gradientType: GradientType.linear,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Container(
                                                                              width: 373.0,
                                                                              height: 81.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, -1.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: AlignedTooltip(
                                                                                              content: Padding(
                                                                                                padding: EdgeInsets.all(4.0),
                                                                                                child: Text(
                                                                                                  'AC',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              offset: 4.0,
                                                                                              preferredDirection: AxisDirection.right,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 4.0,
                                                                                              tailBaseWidth: 24.0,
                                                                                              tailLength: 12.0,
                                                                                              waitDuration: Duration(milliseconds: 100),
                                                                                              showDuration: Duration(milliseconds: 1500),
                                                                                              triggerMode: TooltipTriggerMode.tap,
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  AmenitityIndicatorWidget(
                                                                                                    key: Key('Keyr3v_${myCartsIndex}_of_${myCarts.length}'),
                                                                                                    icon: Icon(
                                                                                                      Icons.ac_unit_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      size: 30.0,
                                                                                                    ),
                                                                                                    background: myCartsItem.air ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).tertiary,
                                                                                                    borderColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                            content: Padding(
                                                                                              padding: EdgeInsets.all(4.0),
                                                                                              child: Text(
                                                                                                'Storage',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            offset: 4.0,
                                                                                            preferredDirection: AxisDirection.down,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 4.0,
                                                                                            tailBaseWidth: 24.0,
                                                                                            tailLength: 12.0,
                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AmenitityIndicatorWidget(
                                                                                                  key: Key('Keymav_${myCartsIndex}_of_${myCarts.length}'),
                                                                                                  icon: Icon(
                                                                                                    Icons.local_grocery_store_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    size: 30.0,
                                                                                                  ),
                                                                                                  background: myCartsItem.hasStorage() ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                                  borderColor: FlutterFlowTheme.of(context).tertiary,
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
                                                                                            content: Padding(
                                                                                              padding: EdgeInsets.all(4.0),
                                                                                              child: Text(
                                                                                                'Message...',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            offset: 4.0,
                                                                                            preferredDirection: AxisDirection.down,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 4.0,
                                                                                            tailBaseWidth: 24.0,
                                                                                            tailLength: 12.0,
                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AmenitityIndicatorWidget(
                                                                                                  key: Key('Keyovm_${myCartsIndex}_of_${myCarts.length}'),
                                                                                                  icon: Icon(
                                                                                                    Icons.audiotrack,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    size: 30.0,
                                                                                                  ),
                                                                                                  background: myCartsItem.hasRadio() ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).accent3,
                                                                                                  borderColor: FlutterFlowTheme.of(context).tertiary,
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
                                                                                            content: Padding(
                                                                                              padding: EdgeInsets.all(4.0),
                                                                                              child: Text(
                                                                                                'Gas Powered',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            offset: 4.0,
                                                                                            preferredDirection: AxisDirection.right,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 4.0,
                                                                                            tailBaseWidth: 24.0,
                                                                                            tailLength: 12.0,
                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AmenitityIndicatorWidget(
                                                                                                  key: Key('Key9s8_${myCartsIndex}_of_${myCarts.length}'),
                                                                                                  icon: Icon(
                                                                                                    Icons.local_gas_station,
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    size: 30.0,
                                                                                                  ),
                                                                                                  background: !myCartsItem.hasIsElectric() ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).tertiary,
                                                                                                  borderColor: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                            content: Padding(
                                                                                              padding: EdgeInsets.all(4.0),
                                                                                              child: Text(
                                                                                                'Electric Powered',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            offset: 4.0,
                                                                                            preferredDirection: AxisDirection.right,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 4.0,
                                                                                            tailBaseWidth: 24.0,
                                                                                            tailLength: 12.0,
                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                AmenitityIndicatorWidget(
                                                                                                  key: Key('Keycv6_${myCartsIndex}_of_${myCarts.length}'),
                                                                                                  icon: Icon(
                                                                                                    Icons.electric_bolt,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    size: 30.0,
                                                                                                  ),
                                                                                                  background: myCartsItem.hasIsElectric() ? FlutterFlowTheme.of(context).turquoise : FlutterFlowTheme.of(context).tertiary,
                                                                                                  borderColor: FlutterFlowTheme.of(context).tertiary,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
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
                                  Align(
                                    alignment:
                                        AlignmentDirectional(0.17, -0.97),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('addcart');
                                      },
                                      text: 'Add Cart',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
