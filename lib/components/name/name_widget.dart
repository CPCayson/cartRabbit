import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'name_model.dart';
export 'name_model.dart';

class NameWidget extends StatefulWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  _NameWidgetState createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  late NameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AutoSizeText(
      'cartRABBIT',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Open Sans',
            color: FlutterFlowTheme.of(context).turquoise,
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
