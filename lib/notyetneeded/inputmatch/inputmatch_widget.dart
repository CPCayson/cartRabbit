import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inputmatch_model.dart';
export 'inputmatch_model.dart';

class InputmatchWidget extends StatefulWidget {
  const InputmatchWidget({
    super.key,
    this.isText,
    this.isNumber,
    String? text,
    required this.number,
    this.cartid,
    required this.isNAME,
    required this.isDescription,
    required this.isSeat,
    required this.isPlate,
  }) : this.text = text ?? '';

  final bool? isText;
  final bool? isNumber;
  final String text;
  final int? number;
  final int? cartid;
  final bool? isNAME;
  final bool? isDescription;
  final bool? isSeat;
  final bool? isPlate;

  @override
  State<InputmatchWidget> createState() => _InputmatchWidgetState();
}

class _InputmatchWidgetState extends State<InputmatchWidget> {
  late InputmatchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputmatchModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.ccart = _model.ccart;
      });
    });

    _model.textController ??= TextEditingController(text: widget.text);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 311.0,
          height: 278.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (widget.isText ?? true)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Label here...',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              if (widget.isNumber ?? true)
                Container(
                  width: 160.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2.0,
                    ),
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.minus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).alternate,
                      size: 20.0,
                    ),
                    incrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.plus,
                      color: enabled
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).alternate,
                      size: 20.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                    count: _model.countControllerValue ??= widget.number!,
                    updateCount: (count) =>
                        setState(() => _model.countControllerValue = count),
                    stepSize: 1,
                  ),
                ),
              FFButtonWidget(
                onPressed: () async {
                  final firestoreBatch = FirebaseFirestore.instance.batch();
                  try {
                    setState(() {
                      _model.cartref =
                          '${currentUserUid}_${widget.cartid?.toString()}';
                    });
                    _model.kolade = await queryCartsRecordOnce(
                      queryBuilder: (cartsRecord) => cartsRecord.where(
                        'cartID',
                        isEqualTo: _model.cartref,
                      ),
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    if (widget.isNAME!) {
                      setState(() {
                        FFAppState().updateCARTSAtIndex(
                          widget.cartid!,
                          (e) =>
                              e..cartDisplayName = _model.textController.text,
                        );
                      });

                      firestoreBatch.update(
                          _model.ccart!,
                          createCartsRecordData(
                            name: widget.text,
                          ));
                    } else if (widget.isSeat!) {
                      setState(() {
                        FFAppState().updateCARTSAtIndex(
                          widget.cartid!,
                          (e) => e..cartCapacity = _model.countControllerValue,
                        );
                      });

                      firestoreBatch.update(
                          _model.ccart!,
                          createCartsRecordData(
                            seats: widget.number,
                          ));
                    } else if (widget.isPlate!) {
                      setState(() {
                        FFAppState().updateCARTSAtIndex(
                          widget.cartid!,
                          (e) => e..cartPlate = _model.textController.text,
                        );
                      });

                      firestoreBatch.update(
                          _model.ccart!,
                          createCartsRecordData(
                            plateNumber: widget.isText?.toString(),
                          ));
                    } else if (widget.isDescription!) {
                      setState(() {
                        FFAppState().updateCARTSAtIndex(
                          widget.cartid!,
                          (e) => e..cartDescription = widget.text,
                        );
                      });

                      firestoreBatch.update(
                          _model.ccart!,
                          createCartsRecordData(
                            description: _model.textController.text,
                          ));
                    }
                  } finally {
                    await firestoreBatch.commit();
                  }

                  setState(() {});
                },
                text: 'Button',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-0.22, 0.53),
          child: Text(
            valueOrDefault<String>(
              _model.ccart?.id,
              '0',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
