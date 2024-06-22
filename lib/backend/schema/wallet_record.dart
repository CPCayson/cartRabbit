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

  // "depositsInt" field.
  int? _depositsInt;
  int get depositsInt => _depositsInt ?? 0;
  bool hasDepositsInt() => _depositsInt != null;

  // "primary" field.
  String? _primary;
  String get primary => _primary ?? '';
  bool hasPrimary() => _primary != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as DocumentReference?;
    _deposits = castToType<double>(snapshotData['deposits']);
    _depositsInt = castToType<int>(snapshotData['depositsInt']);
    _primary = snapshotData['primary'] as String?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _currency = snapshotData['currency'] as String?;
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
  int? depositsInt,
  String? primary,
  DateTime? updatedAt,
  String? currency,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'deposits': deposits,
      'depositsInt': depositsInt,
      'primary': primary,
      'updatedAt': updatedAt,
      'currency': currency,
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
        e1?.depositsInt == e2?.depositsInt &&
        e1?.primary == e2?.primary &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.currency == e2?.currency;
  }

  @override
  int hash(WalletRecord? e) => const ListEquality().hash([
        e?.userID,
        e?.deposits,
        e?.depositsInt,
        e?.primary,
        e?.updatedAt,
        e?.currency
      ]);

  @override
  bool isValidKey(Object? o) => o is WalletRecord;
}
