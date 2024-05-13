import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaceRecord extends FirestoreRecord {
  PlaceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "geopoint" field.
  LatLng? _geopoint;
  LatLng? get geopoint => _geopoint;
  bool hasGeopoint() => _geopoint != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _imageUrl = snapshotData['image_url'] as String?;
    _geopoint = snapshotData['geopoint'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('place');

  static Stream<PlaceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlaceRecord.fromSnapshot(s));

  static Future<PlaceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlaceRecord.fromSnapshot(s));

  static PlaceRecord fromSnapshot(DocumentSnapshot snapshot) => PlaceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlaceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlaceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlaceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlaceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlaceRecordData({
  String? title,
  String? description,
  double? latitude,
  double? longitude,
  String? imageUrl,
  LatLng? geopoint,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'image_url': imageUrl,
      'geopoint': geopoint,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlaceRecordDocumentEquality implements Equality<PlaceRecord> {
  const PlaceRecordDocumentEquality();

  @override
  bool equals(PlaceRecord? e1, PlaceRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.geopoint == e2?.geopoint;
  }

  @override
  int hash(PlaceRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.latitude,
        e?.longitude,
        e?.imageUrl,
        e?.geopoint
      ]);

  @override
  bool isValidKey(Object? o) => o is PlaceRecord;
}
