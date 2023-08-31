import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmentitiesRecord extends FirestoreRecord {
  AmentitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "electric" field.
  bool? _electric;
  bool get electric => _electric ?? false;
  bool hasElectric() => _electric != null;

  // "gps" field.
  bool? _gps;
  bool get gps => _gps ?? false;
  bool hasGps() => _gps != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  bool hasSeats() => _seats != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _electric = snapshotData['electric'] as bool?;
    _gps = snapshotData['gps'] as bool?;
    _seats = castToType<int>(snapshotData['seats']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('amentities')
          : FirebaseFirestore.instance.collectionGroup('amentities');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('amentities').doc();

  static Stream<AmentitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmentitiesRecord.fromSnapshot(s));

  static Future<AmentitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmentitiesRecord.fromSnapshot(s));

  static AmentitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AmentitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmentitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmentitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmentitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmentitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmentitiesRecordData({
  bool? electric,
  bool? gps,
  int? seats,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'electric': electric,
      'gps': gps,
      'seats': seats,
    }.withoutNulls,
  );

  return firestoreData;
}

class AmentitiesRecordDocumentEquality implements Equality<AmentitiesRecord> {
  const AmentitiesRecordDocumentEquality();

  @override
  bool equals(AmentitiesRecord? e1, AmentitiesRecord? e2) {
    return e1?.electric == e2?.electric &&
        e1?.gps == e2?.gps &&
        e1?.seats == e2?.seats;
  }

  @override
  int hash(AmentitiesRecord? e) =>
      const ListEquality().hash([e?.electric, e?.gps, e?.seats]);

  @override
  bool isValidKey(Object? o) => o is AmentitiesRecord;
}
