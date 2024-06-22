import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

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

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "destination_list" field.
  List<LatLng>? _destinationList;
  List<LatLng> get destinationList => _destinationList ?? const [];
  bool hasDestinationList() => _destinationList != null;

  // "refund_id" field.
  String? _refundId;
  String get refundId => _refundId ?? '';
  bool hasRefundId() => _refundId != null;

  void _initializeFields() {
    _source = snapshotData['source'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _distanceLeft = snapshotData['distanceLeft'] as String?;
    _timeLeft = snapshotData['timeLeft'] as String?;
    _name = snapshotData['name'] as String?;
    _driverPositions = getDataList(snapshotData['driverPositions']);
    _paymentIntentId = snapshotData['payment_intent_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _destinationList = getDataList(snapshotData['destination_list']);
    _refundId = snapshotData['refund_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  LatLng? source,
  LatLng? destination,
  String? distanceLeft,
  String? timeLeft,
  String? name,
  String? paymentIntentId,
  DateTime? timestamp,
  String? refundId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'source': source,
      'destination': destination,
      'distanceLeft': distanceLeft,
      'timeLeft': timeLeft,
      'name': name,
      'payment_intent_id': paymentIntentId,
      'timestamp': timestamp,
      'refund_id': refundId,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.source == e2?.source &&
        e1?.destination == e2?.destination &&
        e1?.distanceLeft == e2?.distanceLeft &&
        e1?.timeLeft == e2?.timeLeft &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.driverPositions, e2?.driverPositions) &&
        e1?.paymentIntentId == e2?.paymentIntentId &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.destinationList, e2?.destinationList) &&
        e1?.refundId == e2?.refundId;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.source,
        e?.destination,
        e?.distanceLeft,
        e?.timeLeft,
        e?.name,
        e?.driverPositions,
        e?.paymentIntentId,
        e?.timestamp,
        e?.destinationList,
        e?.refundId
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
