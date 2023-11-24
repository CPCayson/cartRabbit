import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_rejected_user_model.dart';
export 'book_rejected_user_model.dart';

class BookRejectedUserWidget extends StatefulWidget {
  const BookRejectedUserWidget({Key? key}) : super(key: key);

  @override
  _BookRejectedUserWidgetState createState() => _BookRejectedUserWidgetState();
}

class _BookRejectedUserWidgetState extends State<BookRejectedUserWidget> {
  late BookRejectedUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookRejectedUserModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      Navigator.pop(context);

      context.pushNamed('userDash');
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 36.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed('userDash');
        },
        child: Container(
          width: double.infinity,
          height: 200.0,
          constraints: BoxConstraints(
            maxHeight: 200.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).redApple,
            boxShadow: [
              BoxShadow(
                blurRadius: 7.0,
                color: Color(0x4D000000),
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
                  color: Color(0xFFD7DADD),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    'The Host Canceled',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).cultured,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Text(
                    'Look again or try again',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).cultured,
                        ),
                  ),
                ),
                Text(
                  'Order has been cancled',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).darkText,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    getCurrentTimestamp.toString(),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).cultured,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
