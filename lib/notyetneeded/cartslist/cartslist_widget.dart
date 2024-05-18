import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cartslist_model.dart';
export 'cartslist_model.dart';

class CartslistWidget extends StatefulWidget {
  const CartslistWidget({super.key});

  @override
  State<CartslistWidget> createState() => _CartslistWidgetState();
}

class _CartslistWidgetState extends State<CartslistWidget> {
  late CartslistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartslistModel());

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
        List<CartsRecord> cartslistCartsRecordList = snapshot.data!;
        return Title(
            title: 'cartslist',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  title: Text(
                    'Page Title',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          letterSpacing: 0.0,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 381.0,
                        height: 349.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final localcarts = FFAppState().LOCALCARTS.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: localcarts.length,
                              itemBuilder: (context, localcartsIndex) {
                                final localcartsItem =
                                    localcarts[localcartsIndex];
                                return Text(
                                  valueOrDefault<String>(
                                    localcartsItem.cartId,
                                    'null',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        letterSpacing: 0.0,
                                      ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          _model.cartcount = await queryCartsRecordCount();
                          setState(() {
                            _model.cartcounts = _model.cartcount;
                          });
                          while (_model.cartcounts != 0) {
                            setState(() {
                              _model.cartcounts = _model.cartcounts! + -1;
                            });
                            FFAppState().update(() {
                              FFAppState().addToLOCALCARTS(LocalCartStruct(
                                cartId:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .cartID,
                                cartDisplayName:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .name,
                                chartPhoto:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .cartImage,
                                cartLocation:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .cartLoc,
                                cARTRATEDbl:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .cartPricer
                                        .toDouble(),
                                cARTRATEInt:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .cartPricer,
                                cartDescription:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .description,
                                cartPlate:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .plateNumber,
                                cartIsBooker: false,
                                cartCapacity:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .seats,
                                hostId:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .hostRef
                                        ?.id,
                                hostref:
                                    cartslistCartsRecordList[_model.cartcounts!]
                                        .hostRef,
                              ));
                            });
                          }

                          setState(() {});
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  ),
                ),
              ),
            ));
      },
    );
  }
}
