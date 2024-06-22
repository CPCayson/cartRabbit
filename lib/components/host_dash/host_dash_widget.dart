import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/dashes/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/notyetneeded/ridee/ridee_widget.dart';
import '/pages/auth/authorization/authorization_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    _model.switchValue = true;
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
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
      'containerOnActionTriggerAnimation3': AnimationInfo(
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

    return GestureDetector(
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
            title: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.85, 0.0),
                  child: AutoSizeText(
                    'cartRABBIT',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
          ),
        ),
        body: SafeArea(
          top: true,
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: Stack(
                    children: [
                      Stack(
                        children: [],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (_model.toggle) {
                              return SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 150.0, 67.0, 30.0),
                                            child: StreamBuilder<
                                                List<CartsRecord>>(
                                              stream: queryCartsRecord(
                                                queryBuilder: (cartsRecord) =>
                                                    cartsRecord.where(
                                                  'hostRef',
                                                  isEqualTo:
                                                      currentUserReference,
                                                ),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .turquoise,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CartsRecord>
                                                    textCartsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final textCartsRecord =
                                                    textCartsRecordList
                                                            .isNotEmpty
                                                        ? textCartsRecordList
                                                            .first
                                                        : null;
                                                return GradientText(
                                                  valueOrDefault<String>(
                                                    textCartsRecord?.name,
                                                    'Add a Cart',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    FlutterFlowTheme.of(context)
                                                        .secondary
                                                  ],
                                                  gradientDirection:
                                                      GradientDirection.ltr,
                                                  gradientType:
                                                      GradientType.linear,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/cart.png',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(
                                              -0.86, -1.47),
                                          child: AlignedTooltip(
                                            content: Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Text(
                                                'Add/Edit Cart',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            offset: 4.0,
                                            preferredDirection:
                                                AxisDirection.down,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 4.0,
                                            tailBaseWidth: 24.0,
                                            tailLength: 12.0,
                                            waitDuration:
                                                Duration(milliseconds: 100),
                                            showDuration:
                                                Duration(milliseconds: 1500),
                                            triggerMode: TooltipTriggerMode.tap,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 68.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                icon: Icon(
                                                  Icons.car_rental_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 50.0,
                                                ),
                                                onPressed: () async {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isHost,
                                                      false)) {
                                                    context.pushNamed(
                                                      'editCart',
                                                      queryParameters: {
                                                        'cartid':
                                                            serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                        'cartID':
                                                            serializeParam(
                                                          0,
                                                          ParamType.int,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    context
                                                        .pushNamed('addcart');
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 407.0,
                                      child: Stack(
                                        children: [
                                          wrapWithModel(
                                            model: _model.rideeModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: RideeWidget(),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.04, 0.89),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().isActive = true;
                                                setState(() {});
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 30.0,
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .redApple,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 14.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                        offset: Offset(
                                                          0.0,
                                                          3.0,
                                                        ),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .btnText,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.power_settings_new,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      size: 60.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'containerOnActionTriggerAnimation1']!,
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (!FFAppState().isActive) {
                                                return Text(
                                                  'Hello World',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                      ),
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -0.75),
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
                                                      FFAppState().isActive =
                                                          false;
                                                      setState(() {});
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 30.0,
                                                      shape:
                                                          const CircleBorder(),
                                                      child: Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .turquoise,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 14.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .background,
                                                              offset: Offset(
                                                                0.0,
                                                                3.0,
                                                              ),
                                                            )
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .btnText,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
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
                                          color: FlutterFlowTheme.of(context)
                                              .turquoise,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CartsRecord> containerCartsRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final containerCartsRecord =
                                      containerCartsRecordList.isNotEmpty
                                          ? containerCartsRecordList.first
                                          : null;
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia = await selectMedia(
                                          maxWidth: 100.00,
                                          maxHeight: 100.00,
                                          imageQuality: 46,
                                          mediaSource: MediaSource.photoGallery,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading1 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              'Uploading file...',
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading1 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile1 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl1 =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context, 'Success!');
                                          } else {
                                            setState(() {});
                                            showUploadMessage(context,
                                                'Failed to upload data');
                                            return;
                                          }
                                        }

                                        await CartsRecord.collection
                                            .doc()
                                            .set(createCartsRecordData(
                                              photoUrl: _model.uploadedFileUrl2,
                                            ));
                                      },
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                30.0,
                                                                150.0,
                                                                67.0,
                                                                30.0),
                                                    child: StreamBuilder<
                                                        List<CartsRecord>>(
                                                      stream: queryCartsRecord(
                                                        queryBuilder:
                                                            (cartsRecord) =>
                                                                cartsRecord
                                                                    .where(
                                                          'hostRef',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
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
                                                              child:
                                                                  SpinKitWave(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .turquoise,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CartsRecord>
                                                            textCartsRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final textCartsRecord =
                                                            textCartsRecordList
                                                                    .isNotEmpty
                                                                ? textCartsRecordList
                                                                    .first
                                                                : null;
                                                        return GradientText(
                                                          valueOrDefault<
                                                              String>(
                                                            textCartsRecord
                                                                ?.name,
                                                            'Add a Cart',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      if (_model.uploadedFileUrl2 !=
                                                              null &&
                                                          _model.uploadedFileUrl2 !=
                                                              '')
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/cart.png',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              alignment:
                                                                  Alignment(
                                                                      0.0, 0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      if (_model.uploadedFileUrl2 ==
                                                              null ||
                                                          _model.uploadedFileUrl2 ==
                                                              '')
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
                                                            final selectedMedia =
                                                                await selectMedia(
                                                              maxWidth: 100.00,
                                                              maxHeight: 100.00,
                                                              imageQuality: 46,
                                                              mediaSource:
                                                                  MediaSource
                                                                      .photoGallery,
                                                              multiImage: false,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                showUploadMessage(
                                                                  context,
                                                                  'Uploading file...',
                                                                  showLoading:
                                                                      true,
                                                                );
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                                _model.isDataUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile2 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl2 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                                showUploadMessage(
                                                                    context,
                                                                    'Success!');
                                                              } else {
                                                                setState(() {});
                                                                showUploadMessage(
                                                                    context,
                                                                    'Failed to upload data');
                                                                return;
                                                              }
                                                            }

                                                            await containerCartsRecord!
                                                                .reference
                                                                .update(
                                                                    createCartsRecordData(
                                                              photoUrl: _model
                                                                  .uploadedFileUrl1,
                                                              cartImage: _model
                                                                  .uploadedFileUrl2,
                                                            ));

                                                            await containerCartsRecord!
                                                                .hostRef!
                                                                .update(
                                                                    createUsersRecordData(
                                                              photoUrl: '',
                                                            ));
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/bunnysit.png',
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.86, -1.47),
                                                        child: AlignedTooltip(
                                                          content: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    4.0),
                                                            child: Text(
                                                              'Add/Edit Cart',
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
                                                                  .down,
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
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 68.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              icon: Icon(
                                                                Icons
                                                                    .car_rental_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 50.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'userProfile');
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 110.0,
                                                    child: Stack(
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            StreamBuilder<
                                                                List<
                                                                    CartsRecord>>(
                                                              stream:
                                                                  queryCartsRecord(
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitWave(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .turquoise,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<CartsRecord>
                                                                    countControllerCartsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final countControllerCartsRecord =
                                                                    countControllerCartsRecordList
                                                                            .isNotEmpty
                                                                        ? countControllerCartsRecordList
                                                                            .first
                                                                        : null;
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        300.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        FlutterFlowCountController(
                                                                      decrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .keyboard_double_arrow_down_rounded,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).redApple
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            90.0,
                                                                      ),
                                                                      incrementIconBuilder:
                                                                          (enabled) =>
                                                                              Icon(
                                                                        Icons
                                                                            .keyboard_double_arrow_up,
                                                                        color: enabled
                                                                            ? FlutterFlowTheme.of(context).turquoise
                                                                            : FlutterFlowTheme.of(context).alternate,
                                                                        size:
                                                                            90.0,
                                                                      ),
                                                                      countBuilder:
                                                                          (count) =>
                                                                              Text(
                                                                        count
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
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
                                                                      updateCount:
                                                                          (count) async {
                                                                        setState(() =>
                                                                            _model.countControllerValue =
                                                                                count);
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      stepSize:
                                                                          1,
                                                                      minimum:
                                                                          2,
                                                                      maximum:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.15, -0.9),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        115.0,
                                                                        31.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '\$',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    fontSize:
                                                                        25.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.14, -5.69),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        108.0,
                                                                        67.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Price Per Hour',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.15, -0.9),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        115.0,
                                                                        31.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '\$',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    fontSize:
                                                                        25.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.14, -5.69),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        108.0,
                                                                        67.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Price Per Hour',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    letterSpacing:
                                                                        0.0,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  setState(() {});
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Price',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark600,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '70%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .background,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'taxes',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineGray,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '0.06%',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Urbanist',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor4,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            '\$\$\$ per hour',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          functions
                                                              .stepcont(_model
                                                                  .countControllerValue)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 200.0,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 257.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -0.75),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 30.0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 80.0,
                                                              height: 80.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .redApple,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        14.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .background,
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
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .btnText,
                                                                ),
                                                              ),
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
                                                                    () async {},
                                                                child: Icon(
                                                                  Icons
                                                                      .power_settings_new,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  size: 60.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'containerOnActionTriggerAnimation3']!,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.02, -0.26),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        13.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Cart is offline',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lease',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Switch.adaptive(
                            value: _model.switchValue!,
                            onChanged: (newValue) async {
                              setState(() => _model.switchValue = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).alternate,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Text(
                            'Pickup',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
