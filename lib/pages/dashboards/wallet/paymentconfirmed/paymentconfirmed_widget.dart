import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'paymentconfirmed_model.dart';
export 'paymentconfirmed_model.dart';

class PaymentconfirmedWidget extends StatefulWidget {
  const PaymentconfirmedWidget({Key? key}) : super(key: key);

  @override
  _PaymentconfirmedWidgetState createState() => _PaymentconfirmedWidgetState();
}

class _PaymentconfirmedWidgetState extends State<PaymentconfirmedWidget> {
  late PaymentconfirmedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentconfirmedModel());

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
      width: 488.0,
      height: 868.0,
      decoration: BoxDecoration(
        color: Color(0xCD39E9D5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
                child: Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 60.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: Text(
              'Payment Confirmed!',
              style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).lineGray,
                  ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Container(
                  width: 349.0,
                  height: 213.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Text(
                        valueOrDefault(
                                currentUserDocument?.currentBalanceInt, 0)
                            .toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Overpass',
                          color: Color(0xFFFF9C70),
                          fontWeight: FontWeight.w100,
                          fontSize: 72.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
            child: Text(
              'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).lineColor,
                  ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'wallet',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 240),
                          ),
                        },
                      );
                    },
                    text: 'Go Home',
                    options: FFButtonOptions(
                      width: 230.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).lineGray,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 1.00),
            child: Container(
              width: 423.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).btnText,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: AutoSizeText(
                  'cartRABBIT',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Open Sans',
                        color: FlutterFlowTheme.of(context).turquoise,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
