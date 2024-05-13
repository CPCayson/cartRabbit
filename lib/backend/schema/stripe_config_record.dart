import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeConfigRecord extends FirestoreRecord {
  StripeConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  bool hasTest() => _test != null;

  void _initializeFields() {
    _test = snapshotData['test'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stripeConfig');

  static Stream<StripeConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StripeConfigRecord.fromSnapshot(s));

  static Future<StripeConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StripeConfigRecord.fromSnapshot(s));

  static StripeConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StripeConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StripeConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StripeConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StripeConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StripeConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStripeConfigRecordData({
  String? test,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test': test,
    }.withoutNulls,
  );

  return firestoreData;
}

class StripeConfigRecordDocumentEquality
    implements Equality<StripeConfigRecord> {
  const StripeConfigRecordDocumentEquality();

  @override
  bool equals(StripeConfigRecord? e1, StripeConfigRecord? e2) {
    return e1?.test == e2?.test;
  }

  @override
  int hash(StripeConfigRecord? e) => const ListEquality().hash([e?.test]);

  @override
  bool isValidKey(Object? o) => o is StripeConfigRecord;
}
