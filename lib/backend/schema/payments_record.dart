import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "fees" field.
  double? _fees;
  double get fees => _fees ?? 0.0;
  bool hasFees() => _fees != null;

  // "stripe_session_id" field.
  String? _stripeSessionId;
  String get stripeSessionId => _stripeSessionId ?? '';
  bool hasStripeSessionId() => _stripeSessionId != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "paymentMethodID" field.
  String? _paymentMethodID;
  String get paymentMethodID => _paymentMethodID ?? '';
  bool hasPaymentMethodID() => _paymentMethodID != null;

  // "stripeCustomerId" field.
  String? _stripeCustomerId;
  String get stripeCustomerId => _stripeCustomerId ?? '';
  bool hasStripeCustomerId() => _stripeCustomerId != null;

  void _initializeFields() {
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _fees = castToType<double>(snapshotData['fees']);
    _stripeSessionId = snapshotData['stripe_session_id'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as String?;
    _paymentMethodID = snapshotData['paymentMethodID'] as String?;
    _stripeCustomerId = snapshotData['stripeCustomerId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? hostRef,
  double? amount,
  double? fees,
  String? stripeSessionId,
  DateTime? createdAt,
  String? type,
  String? status,
  String? paymentMethodID,
  String? stripeCustomerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostRef': hostRef,
      'amount': amount,
      'fees': fees,
      'stripe_session_id': stripeSessionId,
      'createdAt': createdAt,
      'type': type,
      'status': status,
      'paymentMethodID': paymentMethodID,
      'stripeCustomerId': stripeCustomerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.hostRef == e2?.hostRef &&
        e1?.amount == e2?.amount &&
        e1?.fees == e2?.fees &&
        e1?.stripeSessionId == e2?.stripeSessionId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.paymentMethodID == e2?.paymentMethodID &&
        e1?.stripeCustomerId == e2?.stripeCustomerId;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.hostRef,
        e?.amount,
        e?.fees,
        e?.stripeSessionId,
        e?.createdAt,
        e?.type,
        e?.status,
        e?.paymentMethodID,
        e?.stripeCustomerId
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
