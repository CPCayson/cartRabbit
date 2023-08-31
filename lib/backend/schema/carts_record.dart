import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "cartID" field.
  String? _cartID;
  String get cartID => _cartID ?? '';
  bool hasCartID() => _cartID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  void _initializeFields() {
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _cartID = snapshotData['cartID'] as String?;
    _name = snapshotData['name'] as String?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? hostRef,
  String? cartID,
  String? name,
  bool? isAvailable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostRef': hostRef,
      'cartID': cartID,
      'name': name,
      'isAvailable': isAvailable,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    return e1?.hostRef == e2?.hostRef &&
        e1?.cartID == e2?.cartID &&
        e1?.name == e2?.name &&
        e1?.isAvailable == e2?.isAvailable;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality()
      .hash([e?.hostRef, e?.cartID, e?.name, e?.isAvailable]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
