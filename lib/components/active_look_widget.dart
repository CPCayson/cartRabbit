import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/accept_service/accept_service_widget.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'active_look_model.dart';
export 'active_look_model.dart';

class ActiveLookWidget extends StatefulWidget {
  const ActiveLookWidget({Key? key}) : super(key: key);

  @override
  _ActiveLookWidgetState createState() => _ActiveLookWidgetState();
}

class _ActiveLookWidgetState extends State<ActiveLookWidget> {
  late ActiveLookModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveLookModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: FlutterFlowTheme.of(context).alternate,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                  width: 44.0,
                  height: 44.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200.0,
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor:
                      FlutterFlowTheme.of(context).secondaryText,
                ),
                child: CheckboxListTile(
                  value: _model.checkboxListTileValue ??= false,
                  onChanged: (newValue) async {
                    setState(() => _model.checkboxListTileValue = newValue!);
                    if (newValue!) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: FlutterFlowTheme.of(context).turquoise,
                        barrierColor: FlutterFlowTheme.of(context).turquoise,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AcceptServiceWidget(),
                          );
                        },
                      ).then((value) => setState(() {}));
                    }
                  },
                  title: Text(
                    'Friend Name',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Poppins',
                          lineHeight: 2.0,
                        ),
                  ),
                  subtitle: Text(
                    'City, State',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).turquoise,
                  activeColor: FlutterFlowTheme.of(context).primary,
                  checkColor: Colors.white,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
          child: FlutterFlowTimer(
            initialTime: _model.timerMilliseconds,
            getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
              value,
              hours: false,
              milliSecond: false,
            ),
            timer: _model.timerController,
            updateStateInterval: Duration(milliseconds: 1000),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) setState(() {});
            },
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).cultured,
                ),
          ),
        ),
      ],
    );
  }
}
