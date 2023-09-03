import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/user_account/checkout1_products/checkout1_products_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'cart_stack_model.dart';
export 'cart_stack_model.dart';

class CartStackWidget extends StatefulWidget {
  const CartStackWidget({
    Key? key,
    this.parameter5,
  }) : super(key: key);

  final DocumentReference? parameter5;

  @override
  _CartStackWidgetState createState() => _CartStackWidgetState();
}

class _CartStackWidgetState extends State<CartStackWidget> {
  late CartStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartStackModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
      child: StreamBuilder<List<CartsRecord>>(
        stream: queryCartsRecord(),
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
          List<CartsRecord> listViewCartsRecordList = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewCartsRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewCartsRecord =
                  listViewCartsRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x32000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  listViewCartsRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  80.0, 0.0, 0.0, 0.0),
                              child: ToggleIcon(
                                onPressed: () async {
                                  await listViewCartsRecord.reference.update({
                                    'isAvailable':
                                        !listViewCartsRecord.isAvailable,
                                  });
                                },
                                value: listViewCartsRecord.isAvailable,
                                onIcon: Icon(
                                  Icons.cloud_done_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                                offIcon: Icon(
                                  Icons.cloud_off_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 5.0),
                          child: Text(
                            '${random_data.randomDouble(0.0, 1000.0).toString()}    feet away',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: FlutterFlowStaticMap(
                                location: LatLng(9.341465, -79.891704),
                                apiKey:
                                    'pk.eyJ1IjoiY3BjYXlzb24iLCJhIjoiY2xsc2cyb2ptMHZzaDNkbnZpdXE1dXJuYiJ9.9SyfRX56W4cMI3uGknvffQ',
                                style: MapBoxStyle.Light,
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.cover,
                                borderRadius: BorderRadius.circular(0.0),
                                markerColor:
                                    FlutterFlowTheme.of(context).turquoise,
                                zoom: 12,
                                tilt: 0,
                                rotation: 0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    60.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Price',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Rating',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewCartsRecord.hostRef?.id,
                                          'ghost',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Rating',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_rounded,
                                      color: Color(0xFFFFA130),
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/gc2.jpg',
                            width: 172.0,
                            height: 137.0,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          if (listViewCartsRecord.isAvailable == true) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Checkout1ProductsWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));

                            await TripsRecord.collection
                                .doc()
                                .set(createTripsRecordData(
                                  userRef: currentUserReference,
                                  tripBeginDate: random_data.randomDate(),
                                  tripEndDate: random_data.randomDate(),
                                ));

                            await BookingsRecord.collection
                                .doc()
                                .set(createBookingsRecordData(
                                  numBookings: 1,
                                  cartRef: listViewCartsRecord.reference,
                                  hostRef: listViewCartsRecord.hostRef,
                                  userRef: currentUserReference,
                                ));

                            await ReviewsRecord.collection
                                .doc()
                                .set(createReviewsRecordData(
                                  rating: 3,
                                  cartref: listViewCartsRecord.reference,
                                  userRef: currentUserReference,
                                ));
                            return;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'cart Not available',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }
                        },
                        text: 'Book Now',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).turquoise,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      StreamBuilder<List<ReviewsRecord>>(
                        stream: queryReviewsRecord(
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
                          List<ReviewsRecord> containerReviewsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerReviewsRecord =
                              containerReviewsRecordList.isNotEmpty
                                  ? containerReviewsRecordList.first
                                  : null;
                          return Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
