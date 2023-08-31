import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "tripRef" field.
  DocumentReference? _tripRef;
  DocumentReference? get tripRef => _tripRef;
  bool hasTripRef() => _tripRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "fees" field.
  double? _fees;
  double get fees => _fees ?? 0.0;
  bool hasFees() => _fees != null;

  void _initializeFields() {
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _tripRef = snapshotData['tripRef'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _fees = castToType<double>(snapshotData['fees']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? hostRef,
  DocumentReference? tripRef,
  double? amount,
  double? fees,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostRef': hostRef,
      'tripRef': tripRef,
      'amount': amount,
      'fees': fees,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.hostRef == e2?.hostRef &&
        e1?.tripRef == e2?.tripRef &&
        e1?.amount == e2?.amount &&
        e1?.fees == e2?.fees;
  }

  @override
  int hash(PaymentsRecord? e) =>
      const ListEquality().hash([e?.hostRef, e?.tripRef, e?.amount, e?.fees]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
