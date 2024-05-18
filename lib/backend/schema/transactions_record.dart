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

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

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

  // "stripe_session_id" field.
  String? _stripeSessionId;
  String get stripeSessionId => _stripeSessionId ?? '';
  bool hasStripeSessionId() => _stripeSessionId != null;

  // "stripeCustomerId" field.
  String? _stripeCustomerId;
  String get stripeCustomerId => _stripeCustomerId ?? '';
  bool hasStripeCustomerId() => _stripeCustomerId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _balance = castToType<double>(snapshotData['balance']);
    _total = castToType<double>(snapshotData['total']);
    _buyerRef = snapshotData['buyer_ref'] as DocumentReference?;
    _stripeSessionId = snapshotData['stripe_session_id'] as String?;
    _stripeCustomerId = snapshotData['stripeCustomerId'] as String?;
    _type = snapshotData['type'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
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
  DocumentReference? userId,
  double? balance,
  double? total,
  DocumentReference? buyerRef,
  String? stripeSessionId,
  String? stripeCustomerId,
  String? type,
  String? description,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'balance': balance,
      'total': total,
      'buyer_ref': buyerRef,
      'stripe_session_id': stripeSessionId,
      'stripeCustomerId': stripeCustomerId,
      'type': type,
      'description': description,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.balance == e2?.balance &&
        e1?.total == e2?.total &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.stripeSessionId == e2?.stripeSessionId &&
        e1?.stripeCustomerId == e2?.stripeCustomerId &&
        e1?.type == e2?.type &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.balance,
        e?.total,
        e?.buyerRef,
        e?.stripeSessionId,
        e?.stripeCustomerId,
        e?.type,
        e?.description,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
