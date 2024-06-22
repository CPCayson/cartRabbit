import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termconfirm_model.dart';
export 'termconfirm_model.dart';

class TermconfirmWidget extends StatefulWidget {
  const TermconfirmWidget({super.key});

  @override
  State<TermconfirmWidget> createState() => _TermconfirmWidgetState();
}

class _TermconfirmWidgetState extends State<TermconfirmWidget> {
  late TermconfirmModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermconfirmModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'We updated our terms',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Poppins',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Text(
                          'We encourage you to read our updated terms in full',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL('#');
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('terms');
                                },
                                child: Text(
                                  'Terms of Use',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 14.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL('#');
                          },
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('Privacy');
                                        },
                                        child: Text(
                                          'Privacy Notice',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 14.0)),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x2A000000),
                    offset: Offset(
                      0.0,
                      -4.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).primaryText,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValue ??= false,
                        onChanged: (newValue) async {
                          setState(
                              () => _model.checkboxListTileValue = newValue!);
                        },
                        title: Text(
                          'By ticking the box, I confirm that i have reviewed and agree to the Terms of Use and acknowledge the Privacy Notice.',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        subtitle: Text(
                          'I am at least 18 years of age.',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor: FlutterFlowTheme.of(context).primaryText,
                        activeColor: FlutterFlowTheme.of(context).secondary,
                        checkColor: FlutterFlowTheme.of(context).alternate,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: !_model.checkboxListTileValue!
                                ? null
                                : () async {
                                    Navigator.pop(context);
                                  },
                            text: 'Confirm',
                            options: FFButtonOptions(
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)).addToStart(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
