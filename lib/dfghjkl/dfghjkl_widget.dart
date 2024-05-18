import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dfghjkl_model.dart';
export 'dfghjkl_model.dart';

class DfghjklWidget extends StatefulWidget {
  const DfghjklWidget({super.key});

  @override
  State<DfghjklWidget> createState() => _DfghjklWidgetState();
}

class _DfghjklWidgetState extends State<DfghjklWidget> {
  late DfghjklModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DfghjklModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'dfghjkl',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
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
                    width: 300.0,
                    height: 500.0,
                    child: custom_widgets.StripeCheckoutBottomSheet(
                      width: 300.0,
                      height: 500.0,
                      publishableKey:
                          'pk_test_51KVWLuCox373OxMXkU9dlTZBMHJkmV9z8XCguTm4iSNaoxGFkhZ2UjcjaiHoJmvljbqqV0vm1XTk2W108Ep8ExxL00VSEiwo7V\n\n',
                      secretKey:
                          'sk_test_51KVWLuCox373OxMXDZfa49Vs6gpnSGbXaJCCwKde0An6rdW9JjK99tw1xWL6eOZASRWamXGxZOLx1PzDqxFqwD1100DYo992cm',
                      merchantDisplayName: 'connor',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
