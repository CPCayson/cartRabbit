import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'not_active_model.dart';
export 'not_active_model.dart';

class NotActiveWidget extends StatefulWidget {
  const NotActiveWidget({Key? key}) : super(key: key);

  @override
  _NotActiveWidgetState createState() => _NotActiveWidgetState();
}

class _NotActiveWidgetState extends State<NotActiveWidget> {
  late NotActiveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotActiveModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          final _colorPickedColor = await showFFColorPicker(
            context,
            currentColor: _model.colorPicked ??=
                FlutterFlowTheme.of(context).primary,
            showRecentColors: true,
            allowOpacity: true,
            textColor: FlutterFlowTheme.of(context).primaryText,
            secondaryTextColor: FlutterFlowTheme.of(context).secondaryText,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            primaryButtonBackgroundColor: FlutterFlowTheme.of(context).primary,
            primaryButtonTextColor: Colors.white,
            primaryButtonBorderColor: Colors.transparent,
            displayAsBottomSheet: isMobileWidth(context),
          );

          if (_colorPickedColor != null) {
            setState(() => _model.colorPicked = _colorPickedColor);
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).lineGray,
            boxShadow: [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x20000000),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2669&q=80',
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Cart 1',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cultured,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'time',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).cultured,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.radio_button_checked,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
