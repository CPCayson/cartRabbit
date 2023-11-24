import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'success_page_model.dart';
export 'success_page_model.dart';

class SuccessPageWidget extends StatefulWidget {
  const SuccessPageWidget({Key? key}) : super(key: key);

  @override
  _SuccessPageWidgetState createState() => _SuccessPageWidgetState();
}

class _SuccessPageWidgetState extends State<SuccessPageWidget> {
  late SuccessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie_animations/Animation_-_1699416617336.json',
                      width: 382.0,
                      height: 341.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    'Scanner',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 32.0,
                        ),
                  ),
                ),
              ),
              Text(
                'Scan the Guests Ticket to Continue',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: StreamBuilder<List<TripsRecord>>(
                    stream: queryTripsRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitWave(
                              color: FlutterFlowTheme.of(context).turquoise,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<TripsRecord> buttonTripsRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final buttonTripsRecord = buttonTripsRecordList.isNotEmpty
                          ? buttonTripsRecordList.first
                          : null;
                      return FFButtonWidget(
                        onPressed: () async {
                          _model.barcodez =
                              await FlutterBarcodeScanner.scanBarcode(
                            '#C62828', // scanning line color
                            'Cancel', // cancel button text
                            true, // whether to show the flash icon
                            ScanMode.BARCODE,
                          );

                          if (_model.barcodez ==
                              buttonTripsRecord?.userRef?.id) {
                            _model.soundPlayer ??= AudioPlayer();
                            if (_model.soundPlayer!.playing) {
                              await _model.soundPlayer!.stop();
                            }
                            _model.soundPlayer!.setVolume(1.0);
                            _model.soundPlayer!
                                .setUrl('')
                                .then((_) => _model.soundPlayer!.play());

                            setState(() {
                              FFAppState().isScannedStart = true;
                              FFAppState().startTime =
                                  dateTimeFromSecondsSinceEpoch(
                                      getCurrentTimestamp.secondsSinceEpoch);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'all good',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            context.pushNamed('maper');
                          }

                          setState(() {});
                        },
                        text: 'Scan now',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
