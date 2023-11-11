// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsStruct extends FFFirebaseStruct {
  CartsStruct({
    bool? ready,
    List<DateTime>? dates,
    String? zip,
    List<bool>? amms,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ready = ready,
        _dates = dates,
        _zip = zip,
        _amms = amms,
        super(firestoreUtilData);

  // "Ready" field.
  bool? _ready;
  bool get ready => _ready ?? false;
  set ready(bool? val) => _ready = val;
  bool hasReady() => _ready != null;

  // "dates" field.
  List<DateTime>? _dates;
  List<DateTime> get dates => _dates ?? const [];
  set dates(List<DateTime>? val) => _dates = val;
  void updateDates(Function(List<DateTime>) updateFn) =>
      updateFn(_dates ??= []);
  bool hasDates() => _dates != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  set zip(String? val) => _zip = val;
  bool hasZip() => _zip != null;

  // "amms" field.
  List<bool>? _amms;
  List<bool> get amms => _amms ?? const [];
  set amms(List<bool>? val) => _amms = val;
  void updateAmms(Function(List<bool>) updateFn) => updateFn(_amms ??= []);
  bool hasAmms() => _amms != null;

  static CartsStruct fromMap(Map<String, dynamic> data) => CartsStruct(
        ready: data['Ready'] as bool?,
        dates: getDataList(data['dates']),
        zip: data['zip'] as String?,
        amms: getDataList(data['amms']),
      );

  static CartsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Ready': _ready,
        'dates': _dates,
        'zip': _zip,
        'amms': _amms,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Ready': serializeParam(
          _ready,
          ParamType.bool,
        ),
        'dates': serializeParam(
          _dates,
          ParamType.DateTime,
          true,
        ),
        'zip': serializeParam(
          _zip,
          ParamType.String,
        ),
        'amms': serializeParam(
          _amms,
          ParamType.bool,
          true,
        ),
      }.withoutNulls;

  static CartsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartsStruct(
        ready: deserializeParam(
          data['Ready'],
          ParamType.bool,
          false,
        ),
        dates: deserializeParam<DateTime>(
          data['dates'],
          ParamType.DateTime,
          true,
        ),
        zip: deserializeParam(
          data['zip'],
          ParamType.String,
          false,
        ),
        amms: deserializeParam<bool>(
          data['amms'],
          ParamType.bool,
          true,
        ),
      );

  @override
  String toString() => 'CartsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartsStruct &&
        ready == other.ready &&
        listEquality.equals(dates, other.dates) &&
        zip == other.zip &&
        listEquality.equals(amms, other.amms);
  }

  @override
  int get hashCode => const ListEquality().hash([ready, dates, zip, amms]);
}

CartsStruct createCartsStruct({
  bool? ready,
  String? zip,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartsStruct(
      ready: ready,
      zip: zip,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartsStruct? updateCartsStruct(
  CartsStruct? carts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    carts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartsStructData(
  Map<String, dynamic> firestoreData,
  CartsStruct? carts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (carts == null) {
    return;
  }
  if (carts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && carts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartsData = getCartsFirestoreData(carts, forFieldValue);
  final nestedData = cartsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = carts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartsFirestoreData(
  CartsStruct? carts, [
  bool forFieldValue = false,
]) {
  if (carts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(carts.toMap());

  // Add any Firestore field values
  carts.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartsListFirestoreData(
  List<CartsStruct>? cartss,
) =>
    cartss?.map((e) => getCartsFirestoreData(e, true)).toList() ?? [];
