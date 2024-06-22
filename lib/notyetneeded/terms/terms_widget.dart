import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'terms_model.dart';
export 'terms_model.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key});

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late TermsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsModel());

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
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 392.0,
                      height: 552.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Terms of Service (ToS) and Privacy Policy for cartRabbit, a product of CaysonPoint Studio LLC\n\nTerms of Service (ToS)\n\nAcceptance of Terms:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  '\nBy downloading, accessing, or using the GolfCart Go app (\"App\"), you agree to be bound by these Terms of Service (\"ToS\"). If you do not agree, do not use the App.\ncartRabbit  is a platform connecting users (\"Riders\") with local golf cart owners (\"Providers\") for short-distance transportation.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\nUser Eligibility:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nYou must be at least 18 years old to use the App.\nProviders must have valid licenses and insurance as required by law.\n\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'User Accounts:\n\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Provide accurate information when creating an account.\nKeep your login credentials secure.\nYou are responsible for all activity under your account.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\nRider Responsibilities:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nFollow safety instructions and local laws.\n\nTreat Providers and their property with respect.\nPay all fees, including ride fares and any damages.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\nProvider Responsibilities:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nMaintain carts in safe, working condition.\nHave valid insurance and licenses.\nFollow all local laws and App guidelines.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\n\nFees and Payments:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nFares are set by Providers. An app fee is added by GolfCart Go.\n\nPayments are processed via Stripe. We are not responsible for Stripe\'s actions.\nNo refunds except as required by law or our policies.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Liability and Disclaimers:\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text:
                                  '\nUse the App at your own risk. We are not liable for accidents, injuries, or losses.\nWe do not guarantee cart availability, quality, or safety.\nProviders are independent contractors, not our employees.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Intellectual Property:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nThe App and its content are our property. Do not reproduce or distribute without permission.\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Termination:\n\nWe may suspend or terminate your account for violations of these ToS.\nChanges to ToS:\n\nWe may update these ToS. Continued use means acceptance of changes.\nGoverning Law:\n\nThese ToS are governed by the laws of [Your State/Country].\nPrivacy Policy\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: '\nInformation We Collect:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nPersonal info: name, email, phone number.\nLocation data when using the App.\nPayment info (processed by Stripe).\nUsage data: IP address, device info, App interactions.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'How We Use Your Information:\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\nProvide and improve the App.\nProcess payments and resolve disputes.\nCommunicate with you about the service.\nComply with legal obligations.\n',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Information Sharing:\n\n',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Shared with Riders/Providers to facilitate rides.\nWith service providers like Stripe for payments.\nIf required by law or to protect rights.\nData Security:',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: 'Data Security:',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primary,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Urbanist',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRect(
                child: Signature(
                  controller: _model.signatureController ??=
                      SignatureController(
                    penStrokeWidth: 2.0,
                    penColor: FlutterFlowTheme.of(context).primaryText,
                    exportBackgroundColor: Colors.white,
                  ),
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  height: 120.0,
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Confirm',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
