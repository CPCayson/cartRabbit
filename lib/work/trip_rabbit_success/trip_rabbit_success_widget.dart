import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trip_rabbit_success_model.dart';
export 'trip_rabbit_success_model.dart';

class TripRabbitSuccessWidget extends StatefulWidget {
  const TripRabbitSuccessWidget({Key? key}) : super(key: key);

  @override
  _TripRabbitSuccessWidgetState createState() =>
      _TripRabbitSuccessWidgetState();
}

class _TripRabbitSuccessWidgetState extends State<TripRabbitSuccessWidget> {
  late TripRabbitSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripRabbitSuccessModel());

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
      child: StreamBuilder<List<BookingsRecord>>(
        stream: queryBookingsRecord(
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
          List<BookingsRecord> containerBookingsRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerBookingsRecord = containerBookingsRecordList.isNotEmpty
              ? containerBookingsRecordList.first
              : null;
          return Container(
            width: double.infinity,
            height: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 500.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Session Booked!',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).dark600,
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      'You have successfully booked a session on:',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          containerBookingsRecord?.timestamp?.toString(),
                          'na',
                        ),
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        containerBookingsRecord?.bookingID,
                        'na',
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
