// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkersStruct extends FFFirebaseStruct {
  MarkersStruct({
    LatLng? latLng,
    String? iconPath,
    String? title,
    String? description,
    LatLng? coordinates,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latLng = latLng,
        _iconPath = iconPath,
        _title = title,
        _description = description,
        _coordinates = coordinates,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  set latLng(LatLng? val) => _latLng = val;

  bool hasLatLng() => _latLng != null;

  // "iconPath" field.
  String? _iconPath;
  String get iconPath => _iconPath ?? '';
  set iconPath(String? val) => _iconPath = val;

  bool hasIconPath() => _iconPath != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static MarkersStruct fromMap(Map<String, dynamic> data) => MarkersStruct(
        latLng: data['latLng'] as LatLng?,
        iconPath: data['iconPath'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        coordinates: data['coordinates'] as LatLng?,
        imageUrl: data['imageUrl'] as String?,
      );

  static MarkersStruct? maybeFromMap(dynamic data) =>
      data is Map ? MarkersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'latLng': _latLng,
        'iconPath': _iconPath,
        'title': _title,
        'description': _description,
        'coordinates': _coordinates,
        'imageUrl': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latLng': serializeParam(
          _latLng,
          ParamType.LatLng,
        ),
        'iconPath': serializeParam(
          _iconPath,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static MarkersStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkersStruct(
        latLng: deserializeParam(
          data['latLng'],
          ParamType.LatLng,
          false,
        ),
        iconPath: deserializeParam(
          data['iconPath'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MarkersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkersStruct &&
        latLng == other.latLng &&
        iconPath == other.iconPath &&
        title == other.title &&
        description == other.description &&
        coordinates == other.coordinates &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([latLng, iconPath, title, description, coordinates, imageUrl]);
}

MarkersStruct createMarkersStruct({
  LatLng? latLng,
  String? iconPath,
  String? title,
  String? description,
  LatLng? coordinates,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkersStruct(
      latLng: latLng,
      iconPath: iconPath,
      title: title,
      description: description,
      coordinates: coordinates,
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkersStruct? updateMarkersStruct(
  MarkersStruct? markers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    markers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkersStructData(
  Map<String, dynamic> firestoreData,
  MarkersStruct? markers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (markers == null) {
    return;
  }
  if (markers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && markers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markersData = getMarkersFirestoreData(markers, forFieldValue);
  final nestedData = markersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = markers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkersFirestoreData(
  MarkersStruct? markers, [
  bool forFieldValue = false,
]) {
  if (markers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(markers.toMap());

  // Add any Firestore field values
  markers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkersListFirestoreData(
  List<MarkersStruct>? markerss,
) =>
    markerss?.map((e) => getMarkersFirestoreData(e, true)).toList() ?? [];
