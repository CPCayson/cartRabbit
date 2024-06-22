import '/backend/schema/structs/index.dart';
import '/dashes/nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/chat_groupwbubbles/rent/rent_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_dash_copy2_model.dart';
export 'user_dash_copy2_model.dart';

class UserDashCopy2Widget extends StatefulWidget {
  const UserDashCopy2Widget({super.key});

  @override
  State<UserDashCopy2Widget> createState() => _UserDashCopy2WidgetState();
}

class _UserDashCopy2WidgetState extends State<UserDashCopy2Widget> {
  late UserDashCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDashCopy2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      FFAppState().APPUSER = UserStruct(
        userCurrentLocation: currentUserLocationValue,
      );
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).turquoise,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.navModel,
            updateCallback: () => setState(() {}),
            child: NavWidget(),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(
                Icons.sort,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 50.0,
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        print('mapButton pressed ...');
                      },
                      text: 'Map View',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        height: 34.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).turquoise,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: AutoSizeText(
                            'cartRABBIT',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: FlutterFlowTheme.of(context).turquoise,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 60.0, 0.0),
                            child: Container(
                              width: 43.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: BarcodeWidget(
                                  data: 'Barcode',
                                  barcode: Barcode.qrCode(),
                                  width: 90.0,
                                  height: 90.0,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  backgroundColor: Colors.transparent,
                                  errorBuilder: (_context, _error) => SizedBox(
                                    width: 90.0,
                                    height: 90.0,
                                  ),
                                  drawText: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 150.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: wrapWithModel(
              model: _model.rentModel,
              updateCallback: () => setState(() {}),
              child: RentWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
