import '/backend/backend.dart';
import '/components/ride_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_destination_page_copy_model.dart';
export 'select_destination_page_copy_model.dart';

class SelectDestinationPageCopyWidget extends StatefulWidget {
  const SelectDestinationPageCopyWidget({
    super.key,
    this.chatRef,
  });

  final ChatsRecord? chatRef;

  @override
  State<SelectDestinationPageCopyWidget> createState() =>
      _SelectDestinationPageCopyWidgetState();
}

class _SelectDestinationPageCopyWidgetState
    extends State<SelectDestinationPageCopyWidget> {
  late SelectDestinationPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDestinationPageCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartsRecord>>(
      stream: queryCartsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<CartsRecord> selectDestinationPageCopyCartsRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: wrapWithModel(
                model: _model.rideModel,
                updateCallback: () => setState(() {}),
                child: RideWidget(
                  parameter1: _model.focus,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
