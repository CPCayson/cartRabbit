import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cancel_user_model.dart';
export 'cancel_user_model.dart';

class CancelUserWidget extends StatefulWidget {
  const CancelUserWidget({
    Key? key,
    this.tripDetails,
  }) : super(key: key);

  final TripsRecord? tripDetails;

  @override
  _CancelUserWidgetState createState() => _CancelUserWidgetState();
}

class _CancelUserWidgetState extends State<CancelUserWidget> {
  late CancelUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CancelUserModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 36.0),
      child: Container(
        width: double.infinity,
        height: 441.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).turquoise,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: FlutterFlowTheme.of(context).turquoise,
              offset: Offset(0.0, 3.0),
            )
          ],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 16.0,
                thickness: 3.0,
                indent: 120.0,
                endIndent: 120.0,
                color: FlutterFlowTheme.of(context).lineGray,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  'Cancel Trip',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Poppins',
                        fontSize: 30.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  'If you want to cancel your tripl please leave a note below to send to the host.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).gunmetal,
                        fontSize: 20.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.emailAddressController,
                  focusNode: _model.emailAddressFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle: FlutterFlowTheme.of(context).bodyLarge,
                    hintText: 'Your reason for cancelling...',
                    hintStyle: FlutterFlowTheme.of(context).labelLarge,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineGray,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall,
                  maxLines: 4,
                  validator: _model.emailAddressControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: /* NOT RECOMMENDED */ _model
                              .emailAddressController.text ==
                          'true'
                      ? null
                      : () async {
                          await widget.tripDetails!.reference
                              .update(createTripsRecordData(
                            cancelReason: _model.emailAddressController.text,
                            cancelTrip: true,
                            cancledBy: 'User',
                            isComplete: true,
                          ));
                          if (FFAppState().isBooked) {
                            context.pushNamed('tripComplete');

                            await widget.tripDetails!.userRef!
                                .update(createUsersRecordData(
                              currentBalanceInt: valueOrDefault(
                                      currentUserDocument?.currentBalanceInt,
                                      0) -
                                  widget.tripDetails!.tripTotal,
                              email: '',
                            ));
                            FFAppState().update(() {
                              FFAppState().isBooked = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your trip has been cancelled.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).redApple,
                              ),
                            );

                            context.pushNamed(
                              'userDash',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 250),
                                ),
                              },
                            );

                            setState(() {
                              FFAppState().isBooked = false;
                            });
                            return;
                          }
                        },
                  text: 'Yes, Cancel Trip',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFC4253),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                    disabledColor: FlutterFlowTheme.of(context).customColor3,
                  ),
                  showLoadingIndicator: false,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                        Navigator.pop(context);
                      },
                      text: 'Never Mind',
                      options: FFButtonOptions(
                        width: 170.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Urbanist',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
