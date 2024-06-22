import '/components/sea_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/legal/sea_copy/sea_copy_widget.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ride_model.dart';
export 'ride_model.dart';

class RideWidget extends StatefulWidget {
  const RideWidget({
    super.key,
    bool? parameter1,
  }) : this.parameter1 = parameter1 ?? false;

  final bool parameter1;

  @override
  State<RideWidget> createState() => _RideWidgetState();
}

class _RideWidgetState extends State<RideWidget> with TickerProviderStateMixin {
  late RideModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RideModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 70.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 508.0,
            height: 78.0,
            decoration: BoxDecoration(
              color: Color(0x9EFFFFFF),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {},
                      child: wrapWithModel(
                        model: _model.seaModel,
                        updateCallback: () => setState(() {}),
                        child: SeaWidget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 376.0,
            height: 353.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Screenshot_2024-06-21_004352.png',
                    width: 383.0,
                    height: 414.0,
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.parameter1 == true)
                  wrapWithModel(
                    model: _model.seaCopyModel1,
                    updateCallback: () => setState(() {}),
                    child: SeaCopyWidget(),
                  ),
                if (widget.parameter1 == true)
                  wrapWithModel(
                    model: _model.seaCopyModel2,
                    updateCallback: () => setState(() {}),
                    child: SeaCopyWidget(),
                  ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).tertiary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x2B202529),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: AlignmentDirectional(0.0, 1.0),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ],
      ),
    );
  }
}
