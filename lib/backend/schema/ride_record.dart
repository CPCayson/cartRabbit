import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideRecord extends FirestoreRecord {
  RideRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "distanceLeft" field.
  String? _distanceLeft;
  String get distanceLeft => _distanceLeft ?? '';
  bool hasDistanceLeft() => _distanceLeft != null;

  // "timeLeft" field.
  String? _timeLeft;
  String get timeLeft => _timeLeft ?? '';
  bool hasTimeLeft() => _timeLeft != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "driverPositions" field.
  List<LatLng>? _driverPositions;
  List<LatLng> get driverPositions => _driverPositions ?? const [];
  bool hasDriverPositions() => _driverPositions != null;

  // "payment_intent_id" field.
  String? _paymentIntentId;
  String get paymentIntentId => _paymentIntentId ?? '';
  bool hasPaymentIntentId() => _paymentIntentId != null;

  // "user_location" field.
  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  bool hasUserLocation() => _userLocation != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "is_driver_assigned" field.
  bool? _isDriverAssigned;
  bool get isDriverAssigned => _isDriverAssigned ?? false;
  bool hasIsDriverAssigned() => _isDriverAssigned != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "destination_location" field.
  LatLng? _destinationLocation;
  LatLng? get destinationLocation => _destinationLocation;
  bool hasDestinationLocation() => _destinationLocation != null;

  // "destination_address" field.
  String? _destinationAddress;
  String get destinationAddress => _destinationAddress ?? '';
  bool hasDestinationAddress() => _destinationAddress != null;

  // "user_Id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "destination_account" field.
  String? _destinationAccount;
  String get destinationAccount => _destinationAccount ?? '';
  bool hasDestinationAccount() => _destinationAccount != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "destination_loclist" field.
  List<LatLng>? _destinationLoclist;
  List<LatLng> get destinationLoclist => _destinationLoclist ?? const [];
  bool hasDestinationLoclist() => _destinationLoclist != null;

  // "destination_addylist" field.
  List<LatLng>? _destinationAddylist;
  List<LatLng> get destinationAddylist => _destinationAddylist ?? const [];
  bool hasDestinationAddylist() => _destinationAddylist != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  void _initializeFields() {
    _source = snapshotData['source'] as LatLng?;
    _distanceLeft = snapshotData['distanceLeft'] as String?;
    _timeLeft = snapshotData['timeLeft'] as String?;
    _name = snapshotData['name'] as String?;
    _driverPositions = getDataList(snapshotData['driverPositions']);
    _paymentIntentId = snapshotData['payment_intent_id'] as String?;
    _userLocation = snapshotData['user_location'] as LatLng?;
    _userName = snapshotData['user_name'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _isDriverAssigned = snapshotData['is_driver_assigned'] as bool?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _destinationLocation = snapshotData['destination_location'] as LatLng?;
    _destinationAddress = snapshotData['destination_address'] as String?;
    _userId = snapshotData['user_Id'] as String?;
    _destinationAccount = snapshotData['destination_account'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _destinationLoclist = getDataList(snapshotData['destination_loclist']);
    _destinationAddylist = getDataList(snapshotData['destination_addylist']);
    _rate = castToType<int>(snapshotData['rate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ride');

  static Stream<RideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RideRecord.fromSnapshot(s));

  static Future<RideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RideRecord.fromSnapshot(s));

  static RideRecord fromSnapshot(DocumentSnapshot snapshot) => RideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRideRecordData({
  LatLng? source,
  String? distanceLeft,
  String? timeLeft,
  String? name,
  String? paymentIntentId,
  LatLng? userLocation,
  String? userName,
  String? driverName,
  String? driverUid,
  bool? isDriverAssigned,
  LatLng? driverLocation,
  LatLng? destinationLocation,
  String? destinationAddress,
  String? userId,
  String? destinationAccount,
  DateTime? timestamp,
  int? rate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'source': source,
      'distanceLeft': distanceLeft,
      'timeLeft': timeLeft,
      'name': name,
      'payment_intent_id': paymentIntentId,
      'user_location': userLocation,
      'user_name': userName,
      'driver_name': driverName,
      'driver_uid': driverUid,
      'is_driver_assigned': isDriverAssigned,
      'driver_location': driverLocation,
      'destination_location': destinationLocation,
      'destination_address': destinationAddress,
      'user_Id': userId,
      'destination_account': destinationAccount,
      'timestamp': timestamp,
      'rate': rate,
    }.withoutNulls,
  );

  return firestoreData;
}

class RideRecordDocumentEquality implements Equality<RideRecord> {
  const RideRecordDocumentEquality();

  @override
  bool equals(RideRecord? e1, RideRecord? e2) {
    const listEquality = ListEquality();
    return e1?.source == e2?.source &&
        e1?.distanceLeft == e2?.distanceLeft &&
        e1?.timeLeft == e2?.timeLeft &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.driverPositions, e2?.driverPositions) &&
        e1?.paymentIntentId == e2?.paymentIntentId &&
        e1?.userLocation == e2?.userLocation &&
        e1?.userName == e2?.userName &&
        e1?.driverName == e2?.driverName &&
        e1?.driverUid == e2?.driverUid &&
        e1?.isDriverAssigned == e2?.isDriverAssigned &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.destinationLocation == e2?.destinationLocation &&
        e1?.destinationAddress == e2?.destinationAddress &&
        e1?.userId == e2?.userId &&
        e1?.destinationAccount == e2?.destinationAccount &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.destinationLoclist, e2?.destinationLoclist) &&
        listEquality.equals(e1?.destinationAddylist, e2?.destinationAddylist) &&
        e1?.rate == e2?.rate;
  }

  @override
  int hash(RideRecord? e) => const ListEquality().hash([
        e?.source,
        e?.distanceLeft,
        e?.timeLeft,
        e?.name,
        e?.driverPositions,
        e?.paymentIntentId,
        e?.userLocation,
        e?.userName,
        e?.driverName,
        e?.driverUid,
        e?.isDriverAssigned,
        e?.driverLocation,
        e?.destinationLocation,
        e?.destinationAddress,
        e?.userId,
        e?.destinationAccount,
        e?.timestamp,
        e?.destinationLoclist,
        e?.destinationAddylist,
        e?.rate
      ]);

  @override
  bool isValidKey(Object? o) => o is RideRecord;
}
