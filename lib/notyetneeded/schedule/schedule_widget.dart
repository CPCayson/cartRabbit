import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/notyetneeded/schedule/addeventt/addeventt_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ScheduleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

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
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: double.infinity,
          child: custom_widgets.SyncfusionCalendarWidget(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: double.infinity,
            rebuildpage: () async {},
            actionAfterChange: () async {},
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 60.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AddeventtWidget(),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Icon(
              Icons.add_circle,
              color: Color(0xFF008BFF),
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  }
}
