import '/components/amenitity_indicator/amenitity_indicator_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ammens_model.dart';
export 'ammens_model.dart';

class AmmensWidget extends StatefulWidget {
  const AmmensWidget({Key? key}) : super(key: key);

  @override
  _AmmensWidgetState createState() => _AmmensWidgetState();
}

class _AmmensWidgetState extends State<AmmensWidget> {
  late AmmensModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmmensModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 336.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Text(
                'CHOOSE YOUR AMENITIES',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).darkText,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                if (!_model.amenityPoolValue1!)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.amenitityIndicatorModel1,
                                      updateCallback: () => setState(() {}),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.pool_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .turquoise,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _model.amenityPoolValue1 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.amenityPoolValue1 = newValue!);
                                  if (newValue!) {
                                    FFAppState().addToAmenities(
                                        FFAppState().amenities.first);
                                    while (FFAppState()
                                        .amenities
                                        .where((e) => e)
                                        .toList()
                                        .contains(
                                            FFAppState().amenities.first)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(FFAppState()
                                                .amenities
                                                .first
                                                .toString()),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                title: Text(
                                  'Electric',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel2,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.ev_station_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _model.amenityEVChargingValue ??= false,
                                onChanged: (newValue) async {
                                  setState(() => _model.amenityEVChargingValue =
                                      newValue!);
                                },
                                title: Text(
                                  'Gas',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel3,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.power_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _model.amenityExtraOutletsValue ??=
                                    false,
                                onChanged: (newValue) async {
                                  setState(() => _model
                                      .amenityExtraOutletsValue = newValue!);
                                },
                                title: Text(
                                  'Ice Chest Ready',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel4,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.ac_unit_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _model.amenityACValue ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.amenityACValue = newValue!);
                                },
                                title: Text(
                                  'Air Conditioning (AC)',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.amenitityIndicatorModel5,
                                    updateCallback: () => setState(() {}),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.pets_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .turquoise,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: _model.amenityPetsValue ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.amenityPetsValue = newValue!);
                                },
                                title: Text(
                                  'Pet Friendly',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).secondary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 0.0, 8.0),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.amenitityIndicatorModel6,
                                      updateCallback: () => setState(() {}),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.nightlife,
                                          color: FlutterFlowTheme.of(context)
                                              .turquoise,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SwitchListTile.adaptive(
                                  value: _model.amenityPoolValue2 ??= false,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.amenityPoolValue2 = newValue!);
                                  },
                                  title: Text(
                                    'Radio',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 0.0, 8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.amenitityIndicatorModel7,
                                      updateCallback: () => setState(() {}),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.nightlife,
                                          color: FlutterFlowTheme.of(context)
                                              .turquoise,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.minus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => FaIcon(
                                      FontAwesomeIcons.plus,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                    count: _model.countControllerValue ??= 0,
                                    updateCount: (count) => setState(() =>
                                        _model.countControllerValue = count),
                                    stepSize: 1,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 56.0, 0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2/3',
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                    ],
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('registration');
                    },
                    text: 'NEXT',
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).turquoise,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
