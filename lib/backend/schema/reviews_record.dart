import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "cartref" field.
  DocumentReference? _cartref;
  DocumentReference? get cartref => _cartref;
  bool hasCartref() => _cartref != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "ratingDescription" field.
  String? _ratingDescription;
  String get ratingDescription => _ratingDescription ?? '';
  bool hasRatingDescription() => _ratingDescription != null;

  void _initializeFields() {
    _rating = castToType<int>(snapshotData['rating']);
    _cartref = snapshotData['cartref'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _ratingDescription = snapshotData['ratingDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  int? rating,
  DocumentReference? cartref,
  DocumentReference? userRef,
  DateTime? createdAt,
  String? ratingDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'cartref': cartref,
      'userRef': userRef,
      'created_at': createdAt,
      'ratingDescription': ratingDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.cartref == e2?.cartref &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.ratingDescription == e2?.ratingDescription;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash(
      [e?.rating, e?.cartref, e?.userRef, e?.createdAt, e?.ratingDescription]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
