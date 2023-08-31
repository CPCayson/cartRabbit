import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripsRecord extends FirestoreRecord {
  TripsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "tripBeginDate" field.
  DateTime? _tripBeginDate;
  DateTime? get tripBeginDate => _tripBeginDate;
  bool hasTripBeginDate() => _tripBeginDate != null;

  // "tripEndDate" field.
  DateTime? _tripEndDate;
  DateTime? get tripEndDate => _tripEndDate;
  bool hasTripEndDate() => _tripEndDate != null;

  // "tripCost" field.
  double? _tripCost;
  double get tripCost => _tripCost ?? 0.0;
  bool hasTripCost() => _tripCost != null;

  // "cancelTrip" field.
  bool? _cancelTrip;
  bool get cancelTrip => _cancelTrip ?? false;
  bool hasCancelTrip() => _cancelTrip != null;

  // "tripTotal" field.
  int? _tripTotal;
  int get tripTotal => _tripTotal ?? 0;
  bool hasTripTotal() => _tripTotal != null;

  // "upcoming" field.
  bool? _upcoming;
  bool get upcoming => _upcoming ?? false;
  bool hasUpcoming() => _upcoming != null;

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "isRated" field.
  bool? _isRated;
  bool get isRated => _isRated ?? false;
  bool hasIsRated() => _isRated != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _tripBeginDate = snapshotData['tripBeginDate'] as DateTime?;
    _tripEndDate = snapshotData['tripEndDate'] as DateTime?;
    _tripCost = castToType<double>(snapshotData['tripCost']);
    _cancelTrip = snapshotData['cancelTrip'] as bool?;
    _tripTotal = castToType<int>(snapshotData['tripTotal']);
    _upcoming = snapshotData['upcoming'] as bool?;
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _isRated = snapshotData['isRated'] as bool?;
    _isComplete = snapshotData['isComplete'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TripsRecord.fromSnapshot(s));

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TripsRecord.fromSnapshot(s));

  static TripsRecord fromSnapshot(DocumentSnapshot snapshot) => TripsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TripsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TripsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TripsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TripsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTripsRecordData({
  DocumentReference? userRef,
  DateTime? tripBeginDate,
  DateTime? tripEndDate,
  double? tripCost,
  bool? cancelTrip,
  int? tripTotal,
  bool? upcoming,
  DocumentReference? hostRef,
  bool? isRated,
  bool? isComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'tripBeginDate': tripBeginDate,
      'tripEndDate': tripEndDate,
      'tripCost': tripCost,
      'cancelTrip': cancelTrip,
      'tripTotal': tripTotal,
      'upcoming': upcoming,
      'hostRef': hostRef,
      'isRated': isRated,
      'isComplete': isComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class TripsRecordDocumentEquality implements Equality<TripsRecord> {
  const TripsRecordDocumentEquality();

  @override
  bool equals(TripsRecord? e1, TripsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.tripBeginDate == e2?.tripBeginDate &&
        e1?.tripEndDate == e2?.tripEndDate &&
        e1?.tripCost == e2?.tripCost &&
        e1?.cancelTrip == e2?.cancelTrip &&
        e1?.tripTotal == e2?.tripTotal &&
        e1?.upcoming == e2?.upcoming &&
        e1?.hostRef == e2?.hostRef &&
        e1?.isRated == e2?.isRated &&
        e1?.isComplete == e2?.isComplete;
  }

  @override
  int hash(TripsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.tripBeginDate,
        e?.tripEndDate,
        e?.tripCost,
        e?.cancelTrip,
        e?.tripTotal,
        e?.upcoming,
        e?.hostRef,
        e?.isRated,
        e?.isComplete
      ]);

  @override
  bool isValidKey(Object? o) => o is TripsRecord;
}
