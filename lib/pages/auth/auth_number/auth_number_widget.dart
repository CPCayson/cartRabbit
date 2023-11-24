import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'auth_number_model.dart';
export 'auth_number_model.dart';

class AuthNumberWidget extends StatefulWidget {
  const AuthNumberWidget({Key? key}) : super(key: key);

  @override
  _AuthNumberWidgetState createState() => _AuthNumberWidgetState();
}

class _AuthNumberWidgetState extends State<AuthNumberWidget>
    with TickerProviderStateMixin {
  late AuthNumberModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: Offset(0.8, 0.8),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthNumberModel());

    _model.phoneNumberController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.31, -0.97),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/cpcforai_simple_white_and_39D2C0_logo_of_a_golfcart_and_rabbit__4ba5b360-7e36-4a4d-868d-65d268fa9ad0.png',
                              width: 300.0,
                              height: 155.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 155.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 670),
                              curve: Curves.easeIn,
                              width: double.infinity,
                              height: 581.0,
                              constraints: BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 14.0,
                                    color: Color(0xCD39E9D5),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 3.0,
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 200.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Container(
                          width: 230.0,
                          height: 16.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                          child: Text(
                            'Welcome Rabbit',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Urbanist',
                                  fontSize: 33.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 30.0),
                          child: Text(
                            'We\'ll text a code to verify your phone ',
                            style: FlutterFlowTheme.of(context).bodyLarge,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 16.0),
                          child: TextFormField(
                            controller: _model.phoneNumberController,
                            focusNode: _model.phoneNumberFocusNode,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: '+1  (220) 555-5555',
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleLarge,
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).turquoise,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).accent4,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.phoneNumberControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final phoneNumberVal =
                                  _model.phoneNumberController.text;
                              if (phoneNumberVal == null ||
                                  phoneNumberVal.isEmpty ||
                                  !phoneNumberVal.startsWith('+')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Phone Number is required and has to start with +.'),
                                  ),
                                );
                                return;
                              }
                              await authManager.beginPhoneAuth(
                                context: context,
                                phoneNumber: phoneNumberVal,
                                onCodeSent: (context) async {
                                  context.goNamedAuth(
                                    'pinCode',
                                    context.mounted,
                                    ignoreRedirect: true,
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.arrow_circle_right,
                              color: Color(0xFFFF7F50),
                              size: 60.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.00, 1.00),
                        child: Text(
                          'start hopping',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Urbanist',
                                fontSize: 17.0,
                              ),
                        ),
                      ),
                      AutoSizeText(
                        'cartRABBIT',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Open Sans',
                              color: FlutterFlowTheme.of(context).turquoise,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            currentUserLocationValue =
                                await getCurrentUserLocation(
                                    defaultLocation: LatLng(0.0, 0.0));
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                                await authManager.signInWithGoogle(context);
                            if (user == null) {
                              return;
                            }
                            FFAppState().update(() {
                              FFAppState().isbookedHost = false;
                              FFAppState().isBooked = false;
                              FFAppState().statusGo = false;
                              FFAppState().dashType = false;
                              FFAppState().timerUp = false;
                            });

                            await currentUserReference!
                                .update(createUsersRecordData(
                              currentBalanceInt: 0,
                              isHost: false,
                              currentBalance: 0.0,
                              currentLocation: currentUserLocationValue,
                              primarySet: false,
                            ));

                            context.pushNamedAuth(
                                'guestTutotial', context.mounted);
                          },
                          text: 'Continue with Google',
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            width: 230.0,
                            height: 44.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).turquoise,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).turquoise,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                            hoverColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
