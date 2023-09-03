import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'accept_service_model.dart';
export 'accept_service_model.dart';

class AcceptServiceWidget extends StatefulWidget {
  const AcceptServiceWidget({Key? key}) : super(key: key);

  @override
  _AcceptServiceWidgetState createState() => _AcceptServiceWidgetState();
}

class _AcceptServiceWidgetState extends State<AcceptServiceWidget> {
  late AcceptServiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AcceptServiceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 500.0,
      constraints: BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFE5E7EB),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Start New Chat',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).turquoise,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    'Start a new chat with the user below.',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF606A85),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
              color: Color(0xFFE5E7EB),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0x4D9489F5),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF6F61EF),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 2.0, 2.0, 2.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  currentUserPhoto,
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'You',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF606A85),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            textAlign: TextAlign.end,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF15161E),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 120.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                        Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFE5E7EB),
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: Color(0xFF606A85),
                            size: 32.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Color(0x4D9489F5),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFF6F61EF),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 2.0, 2.0, 2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHVzZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'New User',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF606A85),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {},
                          child: Text(
                            currentUserUid,
                            textAlign: TextAlign.end,
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF15161E),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<List<ChatMessagesRecord>>(
                    stream: queryChatMessagesRecord(),
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
                      List<ChatMessagesRecord> buttonChatMessagesRecordList =
                          snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          context.safePop();
                        },
                        text: 'Reject',
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).redApple,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor: FlutterFlowTheme.of(context).redApple,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).turquoise,
                            width: 1.0,
                          ),
                          hoverTextColor: Color(0xFF15161E),
                          hoverElevation: 0.0,
                        ),
                      );
                    },
                  ),
                  StreamBuilder<List<ChatMessagesRecord>>(
                    stream: queryChatMessagesRecord(),
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
                      List<ChatMessagesRecord> buttonChatMessagesRecordList =
                          snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {},
                        text: 'Accept',
                        options: FFButtonOptions(
                          height: 44.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).turquoise,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          hoverColor: FlutterFlowTheme.of(context).turquoise,
                          hoverBorderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).turquoise,
                            width: 1.0,
                          ),
                          hoverTextColor: Color(0xFF15161E),
                          hoverElevation: 0.0,
                        ),
                      );
                    },
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ),
          ].divide(SizedBox(height: 4.0)).addToEnd(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
