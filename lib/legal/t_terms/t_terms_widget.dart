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
import 't_terms_model.dart';
export 't_terms_model.dart';

class TTermsWidget extends StatefulWidget {
  const TTermsWidget({super.key});

  @override
  State<TTermsWidget> createState() => _TTermsWidgetState();
}

class _TTermsWidgetState extends State<TTermsWidget> {
  late TTermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TTermsModel());

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
            'Terms of Service',
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
                            '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Terms of Service (ToS) \nCartRabbit by CaysonPoint Studio LLC </title>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            margin: 20px;\n            line-height: 1.6;\n        }\n        h1, h2 {\n            color: #333;\n        }\n        ul {\n            list-style-type: none;\n            padding: 0;\n        }\n        li {\n            margin: 10px 0;\n        }\n    </style>\n</head>\n<body>\n    <h1>Terms of Service (ToS) and Privacy Policy for CartRabbit by CaysonPoint Studio LLC (Draft)</h1>\n\n    <h2>Terms of Service (ToS)</h2>\n\n    <h3>Acceptance of Terms:</h3>\n    <p>By downloading, accessing, or using the CartRabbit app (\"App\"), you agree to be bound by these Terms of Service (\"ToS\"). If you do not agree, do not use the App.</p>\n\n    <h3>Description of Service:</h3>\n    <p>CartRabbit is a platform connecting users (\"Riders\") with local golf cart owners (\"Providers\") for short-distance transportation.</p>\n\n    <h3>User Eligibility:</h3>\n    <ul>\n        <li>You must be at least 18 years old to use the App.</li>\n        <li>Providers must have valid licenses and insurance as required by law.</li>\n    </ul>\n\n    <h3>User Accounts:</h3>\n    <ul>\n        <li>Provide accurate information when creating an account.</li>\n        <li>Keep your login credentials secure.</li>\n        <li>You are responsible for all activity under your account.</li>\n    </ul>\n\n    <h3>Rider Responsibilities:</h3>\n    <ul>\n        <li>Follow safety instructions and local laws.</li>\n        <li>Treat Providers and their property with respect.</li>\n        <li>Pay all fees, including ride fares and any damages.</li>\n    </ul>\n\n    <h3>Provider Responsibilities:</h3>\n    <ul>\n        <li>Maintain carts in safe, working condition.</li>\n        <li>Have valid insurance and licenses.</li>\n        <li>Follow all local laws and App guidelines.</li>\n    </ul>\n\n    <h3>Fees and Payments:</h3>\n    <ul>\n        <li>Fares are set by Providers. An app fee is added by CartRabbit.</li>\n        <li>Payments are processed via Stripe. We are not responsible for Stripe\'s actions.</li>\n        <li>No refunds except as required by law or our policies.</li>\n    </ul>\n\n    <h3>Liability and Disclaimers:</h3>\n    <ul>\n        <li>Use the App at your own risk. We are not liable for accidents, injuries, or losses.</li>\n        <li>We do not guarantee cart availability, quality, or safety.</li>\n        <li>Providers are independent contractors, not our employees.</li>\n    </ul>\n\n    <h3>Intellectual Property:</h3>\n    <p>The App and its content are our property. Do not reproduce or distribute without permission.</p>\n\n    <h3>Termination:</h3>\n    <p>We may suspend or terminate your account for violations of these ToS.</p>\n\n    <h3>Changes to ToS:</h3>\n    <p>We may update these ToS. Continued use means acceptance of changes.</p>\n\n    <h3>Governing Law:</h3>\n    <p>These ToS are governed by the laws of Mississippi, Bay Saint Louis.</p>\n</body>\n</html>\n',
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
