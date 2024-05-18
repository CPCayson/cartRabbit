import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).tertiary,
          child: Center(
            child: Image.asset(
              'assets/images/rba1.png',
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'userDash': ParameterData.none(),
  'pinCode': (data) async => ParameterData(
        allParams: {
          'username': getParameter<String>(data, 'username'),
          'userEmail': getParameter<String>(data, 'userEmail'),
          'userPhoto': getParameter<String>(data, 'userPhoto'),
          'userBio': getParameter<String>(data, 'userBio'),
          'userBirthdate': getParameter<DateTime>(data, 'userBirthdate'),
        },
      ),
  'userProfile': ParameterData.none(),
  'transactions': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'userArrived': (data) async => ParameterData(
        allParams: {
          'cartID': getParameter<int>(data, 'cartID'),
          'bookingRef': await getDocumentParameter<BookingsRecord>(
              data, 'bookingRef', BookingsRecord.fromSnapshot),
          'hostRef': await getDocumentParameter<UsersRecord>(
              data, 'hostRef', UsersRecord.fromSnapshot),
          'cartRef': getParameter<DocumentReference>(data, 'cartRef'),
        },
      ),
  'hostDash': ParameterData.none(),
  'guestTracker': (data) async => ParameterData(
        allParams: {
          'users': getParameter<DocumentReference>(data, 'users'),
        },
      ),
  'chatDetails': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.fromSnapshot),
        },
      ),
  'chatMain': ParameterData.none(),
  'myRides': ParameterData.none(),
  'mapPage': ParameterData.none(),
  'addevent': ParameterData.none(),
  'meeting': ParameterData.none(),
  'addcart': ParameterData.none(),
  'editCart': (data) async => ParameterData(
        allParams: {
          'cartid': getParameter<int>(data, 'cartid'),
          'cartID': getParameter<int>(data, 'cartID'),
        },
      ),
  'mapp': ParameterData.none(),
  'cartslist': ParameterData.none(),
  'userDashCopy': ParameterData.none(),
  'userDashCopy2': ParameterData.none(),
  'stripe': ParameterData.none(),
  'calander': ParameterData.none(),
  'SelectDestinationPage': ParameterData.none(),
  'wallet': ParameterData.none(),
  'hostermain': ParameterData.none(),
  'dfghjkl': ParameterData.none(),
  'mapgs': ParameterData.none(),
  'multipleAddy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
