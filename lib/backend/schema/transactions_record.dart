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

  // "balanceInt" field.
  int? _balanceInt;
  int get balanceInt => _balanceInt ?? 0;
  bool hasBalanceInt() => _balanceInt != null;

  // "totalInt" field.
  int? _totalInt;
  int get totalInt => _totalInt ?? 0;
  bool hasTotalInt() => _totalInt != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as DocumentReference?;
    _balance = castToType<double>(snapshotData['balance']);
    _total = castToType<double>(snapshotData['total']);
    _balanceInt = castToType<int>(snapshotData['balanceInt']);
    _totalInt = castToType<int>(snapshotData['totalInt']);
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
  int? balanceInt,
  int? totalInt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'balance': balance,
      'total': total,
      'balanceInt': balanceInt,
      'totalInt': totalInt,
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
        e1?.balanceInt == e2?.balanceInt &&
        e1?.totalInt == e2?.totalInt;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.userId, e?.balance, e?.total, e?.balanceInt, e?.totalInt]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
