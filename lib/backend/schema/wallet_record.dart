import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WalletRecord extends FirestoreRecord {
  WalletRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  DocumentReference? _userID;
  DocumentReference? get userID => _userID;
  bool hasUserID() => _userID != null;

  // "deposits" field.
  double? _deposits;
  double get deposits => _deposits ?? 0.0;
  bool hasDeposits() => _deposits != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "depositsInt" field.
  int? _depositsInt;
  int get depositsInt => _depositsInt ?? 0;
  bool hasDepositsInt() => _depositsInt != null;

  // "primary" field.
  String? _primary;
  String get primary => _primary ?? '';
  bool hasPrimary() => _primary != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _deposits = castToType<double>(snapshotData['deposits']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _depositsInt = castToType<int>(snapshotData['depositsInt']);
    _primary = snapshotData['primary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wallet');

  static Stream<WalletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WalletRecord.fromSnapshot(s));

  static Future<WalletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WalletRecord.fromSnapshot(s));

  static WalletRecord fromSnapshot(DocumentSnapshot snapshot) => WalletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WalletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WalletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WalletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WalletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWalletRecordData({
  DocumentReference? userID,
  double? deposits,
  DateTime? timestamp,
  int? depositsInt,
  String? primary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'deposits': deposits,
      'timestamp': timestamp,
      'depositsInt': depositsInt,
      'primary': primary,
    }.withoutNulls,
  );

  return firestoreData;
}

class WalletRecordDocumentEquality implements Equality<WalletRecord> {
  const WalletRecordDocumentEquality();

  @override
  bool equals(WalletRecord? e1, WalletRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.deposits == e2?.deposits &&
        e1?.timestamp == e2?.timestamp &&
        e1?.depositsInt == e2?.depositsInt &&
        e1?.primary == e2?.primary;
  }

  @override
  int hash(WalletRecord? e) => const ListEquality()
      .hash([e?.userID, e?.deposits, e?.timestamp, e?.depositsInt, e?.primary]);

  @override
  bool isValidKey(Object? o) => o is WalletRecord;
}
