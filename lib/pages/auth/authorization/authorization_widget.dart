import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/rabbit_profilenot_logged/rabbit_profilenot_logged_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'authorization_model.dart';
export 'authorization_model.dart';

class AuthorizationWidget extends StatefulWidget {
  const AuthorizationWidget({super.key});

  @override
  State<AuthorizationWidget> createState() => _AuthorizationWidgetState();
}

class _AuthorizationWidgetState extends State<AuthorizationWidget>
    with TickerProviderStateMixin {
  late AuthorizationModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthorizationModel());

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Container(
                width: double.infinity,
                height: 302.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: FlutterFlowTheme.of(context).turquoise,
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      spreadRadius: 3.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).celadon,
                    width: 3.0,
                  ),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/cpcforai_simple_white_and_39D2C0_logo_of_a_golfcart_and_rabbit__4ba5b360-7e36-4a4d-868d-65d268fa9ad0.png',
                            width: 279.0,
                            height: 163.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 670),
                          curve: Curves.easeIn,
                          width: 657.0,
                          height: 590.0,
                          constraints: BoxConstraints(
                            minWidth: double.infinity,
                            maxWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 14.0,
                                color: Color(0xCD39E9D5),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).turquoise,
                              width: 3.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'cartRABBIT',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                        fontSize: 40.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Container(
                                width: 307.0,
                                height: 400.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 50.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 30.0),
                                            child: Text(
                                              'We\'ll text a code to verify your phone ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 16.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .phoneNumberTextController,
                                              focusNode:
                                                  _model.phoneNumberFocusNode,
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.telephoneNumber
                                              ],
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Your phone number...',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .turquoise,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 3.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        letterSpacing: 0.0,
                                                      ),
                                              keyboardType: TextInputType.phone,
                                              validator: _model
                                                  .phoneNumberTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.phoneNumberMask
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(),
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
                                                List<UsersRecord>
                                                    iconUsersRecordList =
                                                    snapshot.data!;
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    _model.notZero =
                                                        await queryUsersRecordCount(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'phone_number',
                                                        isEqualTo: _model
                                                            .phoneNumberTextController
                                                            .text,
                                                      ),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((FFAppState()
                                                                .APPUSER
                                                                .userPhone ==
                                                            _model
                                                                .phoneNumberTextController
                                                                .text) ||
                                                        (_model.notZero == 0)) {
                                                      Navigator.pop(context);
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                RabbitProfilenotLoggedWidget(
                                                              phoneNumber: _model
                                                                  .phoneNumberTextController
                                                                  .text,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      _model.accountmade =
                                                          await AuthorizationGroup
                                                              .accountsCall
                                                              .call(
                                                        type: 'custom',
                                                        country: 'usd',
                                                      );
                                                      _shouldSetState = true;
                                                      await AuthorizationGroup
                                                          .createAccountLinkCall
                                                          .call();
                                                      final phoneNumberVal = _model
                                                          .phoneNumberTextController
                                                          .text;
                                                      if (phoneNumberVal == null ||
                                                          phoneNumberVal
                                                              .isEmpty ||
                                                          !phoneNumberVal
                                                              .startsWith(
                                                                  '+')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'Phone Number is required and has to start with +.'),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      await authManager
                                                          .beginPhoneAuth(
                                                        context: context,
                                                        phoneNumber:
                                                            phoneNumberVal,
                                                        onCodeSent:
                                                            (context) async {
                                                          context.goNamedAuth(
                                                            'pinCode',
                                                            context.mounted,
                                                            ignoreRedirect:
                                                                true,
                                                          );
                                                        },
                                                      );

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_circle_right,
                                                    color: Color(0xFFFF7F50),
                                                    size: 60.0,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: Text(
                                            'start hopping',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Urbanist',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!),
                                  ),
                                ),
                              ),
                            ],
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
        ],
      ),
    );
  }
}
