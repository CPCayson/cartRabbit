import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toprevview_model.dart';
export 'toprevview_model.dart';

class ToprevviewWidget extends StatefulWidget {
  const ToprevviewWidget({super.key});

  @override
  State<ToprevviewWidget> createState() => _ToprevviewWidgetState();
}

class _ToprevviewWidgetState extends State<ToprevviewWidget> {
  late ToprevviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToprevviewModel());

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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            color: Color(0x39000000),
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Text(
                          '2,503',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Urbanist',
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Text(
                        '# of Ratings',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              '4.6',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Urbanist',
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 12.0),
                            child: FaIcon(
                              FontAwesomeIcons.carrot,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Trusted Rabbit Rating',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
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
