import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/notyetneeded/jjjk/jjjk_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_model.dart';
export 'book_model.dart';

class BookWidget extends StatefulWidget {
  const BookWidget({super.key});

  @override
  State<BookWidget> createState() => _BookWidgetState();
}

class _BookWidgetState extends State<BookWidget> {
  late BookModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Welcome ',
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
              List<CartsRecord> columnCartsRecordList = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(columnCartsRecordList.length, (columnIndex) {
                  final columnCartsRecord = columnCartsRecordList[columnIndex];
                  return Container(
                    width: 432.0,
                    height: 674.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: JjjkWidget(
                                key: Key(
                                    'Key4xc_${columnIndex}_of_${columnCartsRecordList.length}'),
                                parameter1: columnCartsRecord.name,
                                parameter2: columnCartsRecord.seats,
                                parameter3: columnCartsRecord.air,
                                parameter4: columnCartsRecord.storage,
                                parameter5: columnCartsRecord.radio,
                                parameter6: columnCartsRecord.isElectric,
                                parameter7: columnCartsRecord.cartLoc,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
