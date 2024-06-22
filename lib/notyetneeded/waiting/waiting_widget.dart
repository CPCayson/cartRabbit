import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'waiting_model.dart';
export 'waiting_model.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({super.key});

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
      ],
    );
  }
}
