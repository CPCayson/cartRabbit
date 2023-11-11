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

  // "cancelTrip" field.
  bool? _cancelTrip;
  bool get cancelTrip => _cancelTrip ?? false;
  bool hasCancelTrip() => _cancelTrip != null;

  // "tripTotal" field.
  int? _tripTotal;
  int get tripTotal => _tripTotal ?? 0;
  bool hasTripTotal() => _tripTotal != null;

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "cancledBy" field.
  String? _cancledBy;
  String get cancledBy => _cancledBy ?? '';
  bool hasCancledBy() => _cancledBy != null;

  // "cancelReason" field.
  String? _cancelReason;
  String get cancelReason => _cancelReason ?? '';
  bool hasCancelReason() => _cancelReason != null;

  // "numHours" field.
  int? _numHours;
  int get numHours => _numHours ?? 0;
  bool hasNumHours() => _numHours != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _tripBeginDate = snapshotData['tripBeginDate'] as DateTime?;
    _cancelTrip = snapshotData['cancelTrip'] as bool?;
    _tripTotal = castToType<int>(snapshotData['tripTotal']);
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _cancledBy = snapshotData['cancledBy'] as String?;
    _cancelReason = snapshotData['cancelReason'] as String?;
    _numHours = castToType<int>(snapshotData['numHours']);
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
  bool? cancelTrip,
  int? tripTotal,
  DocumentReference? hostRef,
  bool? isComplete,
  String? cancledBy,
  String? cancelReason,
  int? numHours,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'tripBeginDate': tripBeginDate,
      'cancelTrip': cancelTrip,
      'tripTotal': tripTotal,
      'hostRef': hostRef,
      'isComplete': isComplete,
      'cancledBy': cancledBy,
      'cancelReason': cancelReason,
      'numHours': numHours,
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
        e1?.cancelTrip == e2?.cancelTrip &&
        e1?.tripTotal == e2?.tripTotal &&
        e1?.hostRef == e2?.hostRef &&
        e1?.isComplete == e2?.isComplete &&
        e1?.cancledBy == e2?.cancledBy &&
        e1?.cancelReason == e2?.cancelReason &&
        e1?.numHours == e2?.numHours;
  }

  @override
  int hash(TripsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.tripBeginDate,
        e?.cancelTrip,
        e?.tripTotal,
        e?.hostRef,
        e?.isComplete,
        e?.cancledBy,
        e?.cancelReason,
        e?.numHours
      ]);

  @override
  bool isValidKey(Object? o) => o is TripsRecord;
}
