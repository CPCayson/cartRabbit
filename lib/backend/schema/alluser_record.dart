import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlluserRecord extends FirestoreRecord {
  AlluserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  List<DocumentReference>? _userRef;
  List<DocumentReference> get userRef => _userRef ?? const [];
  bool hasUserRef() => _userRef != null;

  // "userRefs" field.
  List<String>? _userRefs;
  List<String> get userRefs => _userRefs ?? const [];
  bool hasUserRefs() => _userRefs != null;

  void _initializeFields() {
    _userRef = getDataList(snapshotData['userRef']);
    _userRefs = getDataList(snapshotData['userRefs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ALLUSER');

  static Stream<AlluserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlluserRecord.fromSnapshot(s));

  static Future<AlluserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlluserRecord.fromSnapshot(s));

  static AlluserRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlluserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlluserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlluserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlluserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlluserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlluserRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AlluserRecordDocumentEquality implements Equality<AlluserRecord> {
  const AlluserRecordDocumentEquality();

  @override
  bool equals(AlluserRecord? e1, AlluserRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userRef, e2?.userRef) &&
        listEquality.equals(e1?.userRefs, e2?.userRefs);
  }

  @override
  int hash(AlluserRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.userRefs]);

  @override
  bool isValidKey(Object? o) => o is AlluserRecord;
}
