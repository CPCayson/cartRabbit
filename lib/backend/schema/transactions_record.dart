import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "buyer_ref" field.
  DocumentReference? _buyerRef;
  DocumentReference? get buyerRef => _buyerRef;
  bool hasBuyerRef() => _buyerRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "bookingID" field.
  String? _bookingID;
  String get bookingID => _bookingID ?? '';
  bool hasBookingID() => _bookingID != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "stripeSessionId" field.
  String? _stripeSessionId;
  String get stripeSessionId => _stripeSessionId ?? '';
  bool hasStripeSessionId() => _stripeSessionId != null;

  void _initializeFields() {
    _balance = castToType<double>(snapshotData['balance']);
    _total = castToType<double>(snapshotData['total']);
    _buyerRef = snapshotData['buyer_ref'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _userID = snapshotData['userID'] as String?;
    _bookingID = snapshotData['bookingID'] as String?;
    _amount = castToType<int>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _stripeSessionId = snapshotData['stripeSessionId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  double? balance,
  double? total,
  DocumentReference? buyerRef,
  String? type,
  String? description,
  String? userID,
  String? bookingID,
  int? amount,
  String? currency,
  String? status,
  DateTime? createdTime,
  DateTime? updatedAt,
  String? stripeSessionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'balance': balance,
      'total': total,
      'buyer_ref': buyerRef,
      'type': type,
      'description': description,
      'userID': userID,
      'bookingID': bookingID,
      'amount': amount,
      'currency': currency,
      'status': status,
      'created_time': createdTime,
      'updatedAt': updatedAt,
      'stripeSessionId': stripeSessionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.balance == e2?.balance &&
        e1?.total == e2?.total &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.userID == e2?.userID &&
        e1?.bookingID == e2?.bookingID &&
        e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.stripeSessionId == e2?.stripeSessionId;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.balance,
        e?.total,
        e?.buyerRef,
        e?.type,
        e?.description,
        e?.userID,
        e?.bookingID,
        e?.amount,
        e?.currency,
        e?.status,
        e?.createdTime,
        e?.updatedAt,
        e?.stripeSessionId
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
