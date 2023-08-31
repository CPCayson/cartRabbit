import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card39_credit_card_model.dart';
export 'card39_credit_card_model.dart';

class Card39CreditCardWidget extends StatefulWidget {
  const Card39CreditCardWidget({Key? key}) : super(key: key);

  @override
  _Card39CreditCardWidgetState createState() => _Card39CreditCardWidgetState();
}

class _Card39CreditCardWidgetState extends State<Card39CreditCardWidget> {
  late Card39CreditCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Card39CreditCardModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
      child: Container(
        width: 370.0,
        height: 190.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Color(0x4B1A1F24),
              offset: Offset(0.0, 2.0),
            )
          ],
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).tertiary,
              FlutterFlowTheme.of(context).primary
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.94, -1.0),
            end: AlignmentDirectional(-0.94, 1.0),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/default-project-widgets-xzsp5v/assets/ddr0sc80h0hs/@3xlogoMark_outline.png',
                width: 44.0,
                height: 44.0,
                fit: BoxFit.cover,
              ),
              Text(
                'Balance',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                    ),
              ),
              Text(
                '\$7,630',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Urbanist',
                      color: Colors.white,
                      fontSize: 32.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '**** 0149',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '05/25',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto Mono',
                            color: Colors.white,
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
