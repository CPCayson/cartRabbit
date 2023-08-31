import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AmenitiesRecord extends FirestoreRecord {
  AmenitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "gps" field.
  bool? _gps;
  bool get gps => _gps ?? false;
  bool hasGps() => _gps != null;

  // "electric" field.
  bool? _electric;
  bool get electric => _electric ?? false;
  bool hasElectric() => _electric != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  bool hasSeats() => _seats != null;

  // "cart_ref" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  void _initializeFields() {
    _gps = snapshotData['gps'] as bool?;
    _electric = snapshotData['electric'] as bool?;
    _seats = castToType<int>(snapshotData['seats']);
    _cartRef = snapshotData['cart_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('amenities');

  static Stream<AmenitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AmenitiesRecord.fromSnapshot(s));

  static Future<AmenitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AmenitiesRecord.fromSnapshot(s));

  static AmenitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AmenitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AmenitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AmenitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AmenitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AmenitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAmenitiesRecordData({
  bool? gps,
  bool? electric,
  int? seats,
  DocumentReference? cartRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'gps': gps,
      'electric': electric,
      'seats': seats,
      'cart_ref': cartRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class AmenitiesRecordDocumentEquality implements Equality<AmenitiesRecord> {
  const AmenitiesRecordDocumentEquality();

  @override
  bool equals(AmenitiesRecord? e1, AmenitiesRecord? e2) {
    return e1?.gps == e2?.gps &&
        e1?.electric == e2?.electric &&
        e1?.seats == e2?.seats &&
        e1?.cartRef == e2?.cartRef;
  }

  @override
  int hash(AmenitiesRecord? e) =>
      const ListEquality().hash([e?.gps, e?.electric, e?.seats, e?.cartRef]);

  @override
  bool isValidKey(Object? o) => o is AmenitiesRecord;
}
