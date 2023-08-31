import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "numberBooks" field.
  int? _numberBooks;
  int get numberBooks => _numberBooks ?? 0;
  bool hasNumberBooks() => _numberBooks != null;

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _numberBooks = castToType<int>(snapshotData['numberBooks']);
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bookings').doc();

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? hostRef,
  int? numberBooks,
  DocumentReference? cartRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostRef': hostRef,
      'numberBooks': numberBooks,
      'cartRef': cartRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.hostRef == e2?.hostRef &&
        e1?.numberBooks == e2?.numberBooks &&
        e1?.cartRef == e2?.cartRef;
  }

  @override
  int hash(BookingsRecord? e) =>
      const ListEquality().hash([e?.hostRef, e?.numberBooks, e?.cartRef]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
