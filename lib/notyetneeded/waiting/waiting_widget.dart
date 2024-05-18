import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'waiting_model.dart';
export 'waiting_model.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({
    super.key,
    this.parameter1,
  });

  final DocumentReference? parameter1;

  @override
  State<WaitingWidget> createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {
  late WaitingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaitingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FFButtonWidget(
          onPressed: () async {
            context.pushNamed(
              'guestTracker',
              queryParameters: {
                'users': serializeParam(
                  widget.parameter1,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          },
          text: 'Update Location',
          options: FFButtonOptions(
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Urbanist',
                  color: Colors.white,
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
        Align(
          alignment: AlignmentDirectional(0.02, -0.26),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
            child: Text(
              'Waiting for a bite',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Poppins',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
        Lottie.asset(
          'assets/lottie_animations/Animation_-_1699416617336.json',
          width: 382.0,
          height: 251.0,
          fit: BoxFit.cover,
          animate: true,
        ),
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.6,
            ),
            decoration: BoxDecoration(
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
            ),
          ),
        ),
      ],
    );
  }
}
