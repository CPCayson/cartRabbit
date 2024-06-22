import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/waiting/waiting_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ridee_model.dart';
export 'ridee_model.dart';

class RideeWidget extends StatefulWidget {
  const RideeWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  });

  final String? parameter1;
  final LatLng? parameter2;
  final LatLng? parameter3;
  final DocumentReference? parameter4;

  @override
  State<RideeWidget> createState() => _RideeWidgetState();
}

class _RideeWidgetState extends State<RideeWidget> {
  late RideeModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RideeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitWave(
              color: FlutterFlowTheme.of(context).turquoise,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(
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
        List<ChatsRecord> stackChatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final stackChatsRecord =
            stackChatsRecordList.isNotEmpty ? stackChatsRecordList.first : null;
        return Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: StreamBuilder<List<RideRecord>>(
                stream: queryRideRecord(),
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
                  List<RideRecord> listViewRideRecordList = snapshot.data!;
                  if (listViewRideRecordList.isEmpty) {
                    return WaitingWidget();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewRideRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewRideRecord =
                          listViewRideRecordList[listViewIndex];
                      return Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Container(
                              width: double.infinity,
                              height: 181.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(22.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.person_pin_circle_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .turquoise,
                                            size: 40.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              widget.parameter1!,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Rider Name',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Urbanist',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 30.0,
                                        child:
                                            custom_widgets.UserLocationDetails(
                                          width: double.infinity,
                                          height: 30.0,
                                          fontSize: 16.0,
                                          webGoogleMapsApiKey:
                                              'AIzaSyBMfXG7z6EvlrRzJTLf3wKg6Z7NfiGqty0',
                                          startCoordinate:
                                              currentUserLocationValue!,
                                          endCoordinate: widget.parameter3!,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 16.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          currentUserLocationValue =
                                              await getCurrentUserLocation(
                                                  defaultLocation:
                                                      LatLng(0.0, 0.0));

                                          await widget.parameter4!
                                              .update(createRideRecordData(
                                            driverLocation:
                                                currentUserLocationValue,
                                            isDriverAssigned: true,
                                            name: 'hhh',
                                            userName: currentUserDisplayName,
                                          ));
                                        },
                                        text: 'Confirm Ride',
                                        icon: FaIcon(
                                          FontAwesomeIcons.car,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .turquoise,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Urbanist',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'close',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
        );
      },
    );
  }
}
