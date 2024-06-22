import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_model.dart';
export 'support_model.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({super.key});

  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  late SupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportModel());

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
          title: SelectionArea(
              child: AutoSizeText(
            'Customer support',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  fontSize: 25.0,
                  letterSpacing: 0.0,
                ),
          )),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Container(
                width: 453.0,
                height: 781.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Html(
                        data:
                            '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Terms of Service (ToS) and Privacy Policy for CartRabbit by CaysonPoint Studio LLC (Draft)</title>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            margin: 20px;\n            line-height: 1.6;\n        }\n        h1, h2 {\n            color: #333;\n        }\n        ul {\n            list-style-type: none;\n            padding: 0;\n        }\n        li {\n            margin: 10px 0;\n        }\n    </style>\n</head>\n<body>\n    <h1>Customer Support for CartRabbit by CaysonPoint Studio LLC</h1>\n\n    <p>If you need support or have any questions, you can reach us through the following channels:</p>\n    \n    <ul>\n        <li>Email: <a href=\"mailto:cartrabbitapp@gmail.com\">cartrabbitapp@gmail.com</a></li>\n        <li>In-App Chat: Always available through the CartRabbit app</li>\n        <li>Facebook: <a href=\"https://www.facebook.com/caysonpointstudio\" target=\"_blank\">CaysonPoint Studio on Facebook</a></li>\n    </ul>\n</body>\n</html>\n',
                        onLinkTap: (url, _, __, ___) => launchURL(url!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
