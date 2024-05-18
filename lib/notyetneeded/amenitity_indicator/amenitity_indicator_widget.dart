import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'amenitity_indicator_model.dart';
export 'amenitity_indicator_model.dart';

class AmenitityIndicatorWidget extends StatefulWidget {
  const AmenitityIndicatorWidget({
    super.key,
    this.icon,
    this.background,
    this.borderColor,
  });

  final Widget? icon;
  final Color? background;
  final Color? borderColor;

  @override
  State<AmenitityIndicatorWidget> createState() =>
      _AmenitityIndicatorWidgetState();
}

class _AmenitityIndicatorWidgetState extends State<AmenitityIndicatorWidget> {
  late AmenitityIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmenitityIndicatorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.background,
            FlutterFlowTheme.of(context).primaryText,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 1.0,
            )
          ],
          shape: BoxShape.circle,
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.borderColor,
              FlutterFlowTheme.of(context).cultured,
            ),
            width: 2.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: widget.icon!,
      ),
    );
  }
}
