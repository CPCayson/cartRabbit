import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scan_cart_button_model.dart';
export 'scan_cart_button_model.dart';

class ScanCartButtonWidget extends StatefulWidget {
  const ScanCartButtonWidget({super.key});

  @override
  State<ScanCartButtonWidget> createState() => _ScanCartButtonWidgetState();
}

class _ScanCartButtonWidgetState extends State<ScanCartButtonWidget>
    with TickerProviderStateMixin {
  late ScanCartButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanCartButtonModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x34090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  color: Color(0xFF39D2C0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: Color(0x98FFFFFF),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.lock_sharp,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Scan Cart',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 57.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
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
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 6,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    enablePinAutofill: false,
                    errorTextSpace: 16.0,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    obscureText: false,
                    hintCharacter: '●',
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 44.0,
                      fieldWidth: 44.0,
                      borderWidth: 2.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).primaryText,
                      inactiveColor: FlutterFlowTheme.of(context).alternate,
                      selectedColor: FlutterFlowTheme.of(context).primary,
                      activeFillColor: FlutterFlowTheme.of(context).primaryText,
                      inactiveFillColor: FlutterFlowTheme.of(context).alternate,
                      selectedFillColor: FlutterFlowTheme.of(context).primary,
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
