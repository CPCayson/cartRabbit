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
import 'privacy_model.dart';
export 'privacy_model.dart';

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({super.key});

  @override
  State<PrivacyWidget> createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
  late PrivacyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyModel());

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
            'Privacy',
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
                width: 399.0,
                height: 822.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Html(
                        data:
                            '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Privacy Policy</title>\n</head>\n<body>\n    <h1>Privacy Policy</h1>\n\n    <h2>Information We Collect:</h2>\n    <ul>\n        <li><strong>Personal info:</strong> name, email, phone number.</li>\n        <li><strong>Location data:</strong> when using the App.</li>\n        <li><strong>Payment info:</strong> processed by Stripe.</li>\n        <li><strong>Usage data:</strong> IP address, device info, App interactions.</li>\n    </ul>\n\n    <h2>How We Use Your Information:</h2>\n    <ul>\n        <li><strong>Provide and improve the App:</strong> We use your information to enhance your experience and the functionality of the App.</li>\n        <li><strong>Process payments and resolve disputes:</strong> Your payment information is used to process transactions and handle disputes.</li>\n        <li><strong>Communicate with you about the service:</strong> We may contact you regarding updates, offers, and service-related issues.</li>\n        <li><strong>Comply with legal obligations:</strong> We use your information as required by law.</li>\n    </ul>\n\n    <h2>Information Sharing:</h2>\n    <ul>\n        <li><strong>Shared with Riders/Providers:</strong> To facilitate rides.</li>\n        <li><strong>With service providers like Stripe:</strong> For payment processing.</li>\n        <li><strong>If required by law or to protect rights:</strong> We may disclose your information if necessary for legal reasons or to protect our rights.</li>\n        <li><strong>Third parties we share data with:</strong> Currently, we only share data with Google and Stripe.</li>\n    </ul>\n\n    <h2>Data Security:</h2>\n    <p>We use reasonable measures to protect your data but cannot guarantee absolute security.</p>\n\n    <h2>Your Rights:</h2>\n    <p>You may access, update, or delete your personal info. Contact us for these requests.</p>\n\n    <h2>Children\'s Privacy:</h2>\n    <p>The App is not intended for children under 18.</p>\n\n    <h2>Changes to Privacy Policy:</h2>\n    <p>We will notify you of material changes. Continued use means acceptance.</p>\n\n    <h2>Contact Us:</h2>\n    <p>For privacy concerns, contact [Your Contact Info].</p>\n\n    <h2>Data Usage:</h2>\n    <p>We do not make money off your data. The only device functions the App accesses are device location and the camera.</p>\n</body>\n</html>\n',
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
