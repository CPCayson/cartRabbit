import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/future_features/ammens/ammens_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_rental2_model.dart';
export 'edit_rental2_model.dart';

class EditRental2Widget extends StatefulWidget {
  const EditRental2Widget({
    Key? key,
    this.propertyRef,
    required this.price,
    required this.address,
    required this.cartName,
    required this.image,
  }) : super(key: key);

  final ReviewsRecord? propertyRef;
  final double? price;
  final String? address;
  final String? cartName;
  final String? image;

  @override
  _EditRental2WidgetState createState() => _EditRental2WidgetState();
}

class _EditRental2WidgetState extends State<EditRental2Widget> {
  late EditRental2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRental2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: wrapWithModel(
            model: _model.ammensModel,
            updateCallback: () => setState(() {}),
            child: AmmensWidget(),
          ),
        ),
      ),
    );
  }
}
