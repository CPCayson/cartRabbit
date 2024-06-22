import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BalancesRecord extends FirestoreRecord {
  BalancesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  void _initializeFields() {
    _balance = castToType<double>(snapshotData['balance']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('balances');

  static Stream<BalancesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BalancesRecord.fromSnapshot(s));

  static Future<BalancesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BalancesRecord.fromSnapshot(s));

  static BalancesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BalancesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BalancesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BalancesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BalancesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BalancesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBalancesRecordData({
  double? balance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'balance': balance,
    }.withoutNulls,
  );

  return firestoreData;
}

class BalancesRecordDocumentEquality implements Equality<BalancesRecord> {
  const BalancesRecordDocumentEquality();

  @override
  bool equals(BalancesRecord? e1, BalancesRecord? e2) {
    return e1?.balance == e2?.balance;
  }

  @override
  int hash(BalancesRecord? e) => const ListEquality().hash([e?.balance]);

  @override
  bool isValidKey(Object? o) => o is BalancesRecord;
}
