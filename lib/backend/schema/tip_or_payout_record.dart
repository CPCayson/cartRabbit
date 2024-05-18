import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TipOrPayoutRecord extends FirestoreRecord {
  TipOrPayoutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tip_or_payout" field.
  String? _tipOrPayout;
  String get tipOrPayout => _tipOrPayout ?? '';
  bool hasTipOrPayout() => _tipOrPayout != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "payment_intent_id" field.
  String? _paymentIntentId;
  String get paymentIntentId => _paymentIntentId ?? '';
  bool hasPaymentIntentId() => _paymentIntentId != null;

  // "transfer_id" field.
  String? _transferId;
  String get transferId => _transferId ?? '';
  bool hasTransferId() => _transferId != null;

  // "payee_username" field.
  String? _payeeUsername;
  String get payeeUsername => _payeeUsername ?? '';
  bool hasPayeeUsername() => _payeeUsername != null;

  // "payee_ref" field.
  DocumentReference? _payeeRef;
  DocumentReference? get payeeRef => _payeeRef;
  bool hasPayeeRef() => _payeeRef != null;

  // "payor_ref" field.
  DocumentReference? _payorRef;
  DocumentReference? get payorRef => _payorRef;
  bool hasPayorRef() => _payorRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "refund" field.
  bool? _refund;
  bool get refund => _refund ?? false;
  bool hasRefund() => _refund != null;

  void _initializeFields() {
    _tipOrPayout = snapshotData['tip_or_payout'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _paymentIntentId = snapshotData['payment_intent_id'] as String?;
    _transferId = snapshotData['transfer_id'] as String?;
    _payeeUsername = snapshotData['payee_username'] as String?;
    _payeeRef = snapshotData['payee_ref'] as DocumentReference?;
    _payorRef = snapshotData['payor_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _refund = snapshotData['refund'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipOrPayout');

  static Stream<TipOrPayoutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipOrPayoutRecord.fromSnapshot(s));

  static Future<TipOrPayoutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipOrPayoutRecord.fromSnapshot(s));

  static TipOrPayoutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipOrPayoutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipOrPayoutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipOrPayoutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipOrPayoutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipOrPayoutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipOrPayoutRecordData({
  String? tipOrPayout,
  double? amount,
  String? paymentIntentId,
  String? transferId,
  String? payeeUsername,
  DocumentReference? payeeRef,
  DocumentReference? payorRef,
  String? status,
  bool? refund,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tip_or_payout': tipOrPayout,
      'amount': amount,
      'payment_intent_id': paymentIntentId,
      'transfer_id': transferId,
      'payee_username': payeeUsername,
      'payee_ref': payeeRef,
      'payor_ref': payorRef,
      'status': status,
      'refund': refund,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipOrPayoutRecordDocumentEquality implements Equality<TipOrPayoutRecord> {
  const TipOrPayoutRecordDocumentEquality();

  @override
  bool equals(TipOrPayoutRecord? e1, TipOrPayoutRecord? e2) {
    return e1?.tipOrPayout == e2?.tipOrPayout &&
        e1?.amount == e2?.amount &&
        e1?.paymentIntentId == e2?.paymentIntentId &&
        e1?.transferId == e2?.transferId &&
        e1?.payeeUsername == e2?.payeeUsername &&
        e1?.payeeRef == e2?.payeeRef &&
        e1?.payorRef == e2?.payorRef &&
        e1?.status == e2?.status &&
        e1?.refund == e2?.refund;
  }

  @override
  int hash(TipOrPayoutRecord? e) => const ListEquality().hash([
        e?.tipOrPayout,
        e?.amount,
        e?.paymentIntentId,
        e?.transferId,
        e?.payeeUsername,
        e?.payeeRef,
        e?.payorRef,
        e?.status,
        e?.refund
      ]);

  @override
  bool isValidKey(Object? o) => o is TipOrPayoutRecord;
}
