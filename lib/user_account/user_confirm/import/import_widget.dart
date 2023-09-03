import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'import_model.dart';
export 'import_model.dart';

class ImportWidget extends StatefulWidget {
  const ImportWidget({Key? key}) : super(key: key);

  @override
  _ImportWidgetState createState() => _ImportWidgetState();
}

class _ImportWidgetState extends State<ImportWidget>
    with TickerProviderStateMixin {
  late ImportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
  void initState() {
    super.initState();
    _model = createModel(context, () => ImportModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).gunmetal,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'About this Host',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/gc3.jpg',
                            width: double.infinity,
                            height: 250.0,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 40.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: Color(0x80FFFFFF),
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: Color(0x80FFFFFF),
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 200.0,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 30.0, 5.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: SelectionArea(
                                            child: Text(
                                          currentUserEmail,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        )),
                                      ),
                                      SelectionArea(
                                          child: Text(
                                        'host name',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Color(0x7BFFFFFF),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x32FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/cpcforai_simple_white_and_39D2C0_logo_of_a_golfcart_and_rabbit__4ba5b360-7e36-4a4d-868d-65d268fa9ad0.png',
                                                width: 340.0,
                                                height: 54.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          size: 20.0,
                                        ),
                                      ),
                                      SelectionArea(
                                          child: Text(
                                        'Indonesia',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Color(0x7BFFFFFF),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      )),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 20.0,
                                      ),
                                    ),
                                    SelectionArea(
                                        child: Text(
                                      '21.00 PM - 01 AM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: Color(0x7BFFFFFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 350.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        'Rating',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )),
                                      SelectionArea(
                                          child: Text(
                                        '4.5',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                      )),
                                      RatingBar.builder(
                                        onRatingUpdate: (newValue) => setState(
                                            () => _model.ratingBarValue =
                                                newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFD7138),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: _model.ratingBarValue ??=
                                            4.5,
                                        unratedColor: Color(0xFF9E9E9E),
                                        itemCount: 5,
                                        itemSize: 10.0,
                                        glowColor: Color(0xFFFD7138),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: SelectionArea(
                                          child: Text(
                                        'People Joined',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      )),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 30.0,
                                          height: 30.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            'https://i.pravatar.cc/150?img=3',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://i.pravatar.cc/150?img=6',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              'https://i.pravatar.cc/150?img=10',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  60.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFD7138),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                '+62',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowStaticMap(
                                        location: currentUserLocationValue!,
                                        apiKey:
                                            'pk.eyJ1IjoicHJpbGx5amVhbmFsZGk2NjYiLCJhIjoiY2xhMTlsMnFrMDVlejN1bHp1dXMwZ3V1cSJ9.KGVhgtNP1NIxnqnFP7B-4A',
                                        style: MapBoxStyle.Streets,
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.contain,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        markerColor: Color(0xFFFD7138),
                                        zoom: 10,
                                        tilt: 0,
                                        rotation: 0,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: SelectionArea(
                                    child: Text(
                                  'About Event',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                )),
                              ),
                            ],
                          ),
                          SelectionArea(
                              child: Text(
                            'The nights are getting darker, Bandung is being overrun with massive spiders, and your local Big Supermarket has started flogging those cute little mini pumpkins again. You know what that means: Halloween 2022 is right around the corner.\n\nCome and Join Now!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: Color(0x7BFFFFFF),
                                  fontWeight: FontWeight.w300,
                                ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: FaIcon(
                              FontAwesomeIcons.ethereum,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation']!),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Button',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
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
  }
}
