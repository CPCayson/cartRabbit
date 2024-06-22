// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalCartStruct extends FFFirebaseStruct {
  LocalCartStruct({
    String? applcartId,
    String? cartId,
    String? cartDisplayName,
    String? chartPhoto,
    LatLng? cartLocation,
    List<String>? cartAmmenities,
    double? cARTRATEDbl,
    int? cARTRATEInt,
    String? cartDescription,
    String? cartPlate,
    bool? cartIsBooker,
    bool? cartIsInuser,
    int? cartCapacity,
    String? hostId,
    List<LocalCartStruct>? hostInfo,
    DocumentReference? hostref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _applcartId = applcartId,
        _cartId = cartId,
        _cartDisplayName = cartDisplayName,
        _chartPhoto = chartPhoto,
        _cartLocation = cartLocation,
        _cartAmmenities = cartAmmenities,
        _cARTRATEDbl = cARTRATEDbl,
        _cARTRATEInt = cARTRATEInt,
        _cartDescription = cartDescription,
        _cartPlate = cartPlate,
        _cartIsBooker = cartIsBooker,
        _cartIsInuser = cartIsInuser,
        _cartCapacity = cartCapacity,
        _hostId = hostId,
        _hostInfo = hostInfo,
        _hostref = hostref,
        super(firestoreUtilData);

  // "APPLCART_ID" field.
  String? _applcartId;
  String get applcartId => _applcartId ?? '';
  set applcartId(String? val) => _applcartId = val;

  bool hasApplcartId() => _applcartId != null;

  // "CART_ID" field.
  String? _cartId;
  String get cartId => _cartId ?? '';
  set cartId(String? val) => _cartId = val;

  bool hasCartId() => _cartId != null;

  // "CART_DISPLAY_NAME" field.
  String? _cartDisplayName;
  String get cartDisplayName => _cartDisplayName ?? '';
  set cartDisplayName(String? val) => _cartDisplayName = val;

  bool hasCartDisplayName() => _cartDisplayName != null;

  // "CHART_PHOTO" field.
  String? _chartPhoto;
  String get chartPhoto => _chartPhoto ?? '';
  set chartPhoto(String? val) => _chartPhoto = val;

  bool hasChartPhoto() => _chartPhoto != null;

  // "CART_LOCATION" field.
  LatLng? _cartLocation;
  LatLng? get cartLocation => _cartLocation;
  set cartLocation(LatLng? val) => _cartLocation = val;

  bool hasCartLocation() => _cartLocation != null;

  // "CART_AMMENITIES" field.
  List<String>? _cartAmmenities;
  List<String> get cartAmmenities => _cartAmmenities ?? const [];
  set cartAmmenities(List<String>? val) => _cartAmmenities = val;

  void updateCartAmmenities(Function(List<String>) updateFn) {
    updateFn(cartAmmenities ??= []);
  }

  bool hasCartAmmenities() => _cartAmmenities != null;

  // "CART_RATE_dbl" field.
  double? _cARTRATEDbl;
  double get cARTRATEDbl => _cARTRATEDbl ?? 0.0;
  set cARTRATEDbl(double? val) => _cARTRATEDbl = val;

  void incrementCARTRATEDbl(double amount) =>
      cARTRATEDbl = cARTRATEDbl + amount;

  bool hasCARTRATEDbl() => _cARTRATEDbl != null;

  // "CART_RATE_int" field.
  int? _cARTRATEInt;
  int get cARTRATEInt => _cARTRATEInt ?? 0;
  set cARTRATEInt(int? val) => _cARTRATEInt = val;

  void incrementCARTRATEInt(int amount) => cARTRATEInt = cARTRATEInt + amount;

  bool hasCARTRATEInt() => _cARTRATEInt != null;

  // "CART_DESCRIPTION" field.
  String? _cartDescription;
  String get cartDescription => _cartDescription ?? '';
  set cartDescription(String? val) => _cartDescription = val;

  bool hasCartDescription() => _cartDescription != null;

  // "CART_PLATE" field.
  String? _cartPlate;
  String get cartPlate => _cartPlate ?? '';
  set cartPlate(String? val) => _cartPlate = val;

  bool hasCartPlate() => _cartPlate != null;

  // "CART_IS_BOOKER" field.
  bool? _cartIsBooker;
  bool get cartIsBooker => _cartIsBooker ?? false;
  set cartIsBooker(bool? val) => _cartIsBooker = val;

  bool hasCartIsBooker() => _cartIsBooker != null;

  // "CART_IS_INUSER" field.
  bool? _cartIsInuser;
  bool get cartIsInuser => _cartIsInuser ?? false;
  set cartIsInuser(bool? val) => _cartIsInuser = val;

  bool hasCartIsInuser() => _cartIsInuser != null;

  // "CART_CAPACITY" field.
  int? _cartCapacity;
  int get cartCapacity => _cartCapacity ?? 0;
  set cartCapacity(int? val) => _cartCapacity = val;

  void incrementCartCapacity(int amount) =>
      cartCapacity = cartCapacity + amount;

  bool hasCartCapacity() => _cartCapacity != null;

  // "HOST_ID" field.
  String? _hostId;
  String get hostId => _hostId ?? '';
  set hostId(String? val) => _hostId = val;

  bool hasHostId() => _hostId != null;

  // "HOST_INFO" field.
  List<LocalCartStruct>? _hostInfo;
  List<LocalCartStruct> get hostInfo => _hostInfo ?? const [];
  set hostInfo(List<LocalCartStruct>? val) => _hostInfo = val;

  void updateHostInfo(Function(List<LocalCartStruct>) updateFn) {
    updateFn(hostInfo ??= []);
  }

  bool hasHostInfo() => _hostInfo != null;

  // "HOSTREF" field.
  DocumentReference? _hostref;
  DocumentReference? get hostref => _hostref;
  set hostref(DocumentReference? val) => _hostref = val;

  bool hasHostref() => _hostref != null;

  static LocalCartStruct fromMap(Map<String, dynamic> data) => LocalCartStruct(
        applcartId: data['APPLCART_ID'] as String?,
        cartId: data['CART_ID'] as String?,
        cartDisplayName: data['CART_DISPLAY_NAME'] as String?,
        chartPhoto: data['CHART_PHOTO'] as String?,
        cartLocation: data['CART_LOCATION'] as LatLng?,
        cartAmmenities: getDataList(data['CART_AMMENITIES']),
        cARTRATEDbl: castToType<double>(data['CART_RATE_dbl']),
        cARTRATEInt: castToType<int>(data['CART_RATE_int']),
        cartDescription: data['CART_DESCRIPTION'] as String?,
        cartPlate: data['CART_PLATE'] as String?,
        cartIsBooker: data['CART_IS_BOOKER'] as bool?,
        cartIsInuser: data['CART_IS_INUSER'] as bool?,
        cartCapacity: castToType<int>(data['CART_CAPACITY']),
        hostId: data['HOST_ID'] as String?,
        hostInfo: getStructList(
          data['HOST_INFO'],
          LocalCartStruct.fromMap,
        ),
        hostref: data['HOSTREF'] as DocumentReference?,
      );

  static LocalCartStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalCartStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'APPLCART_ID': _applcartId,
        'CART_ID': _cartId,
        'CART_DISPLAY_NAME': _cartDisplayName,
        'CHART_PHOTO': _chartPhoto,
        'CART_LOCATION': _cartLocation,
        'CART_AMMENITIES': _cartAmmenities,
        'CART_RATE_dbl': _cARTRATEDbl,
        'CART_RATE_int': _cARTRATEInt,
        'CART_DESCRIPTION': _cartDescription,
        'CART_PLATE': _cartPlate,
        'CART_IS_BOOKER': _cartIsBooker,
        'CART_IS_INUSER': _cartIsInuser,
        'CART_CAPACITY': _cartCapacity,
        'HOST_ID': _hostId,
        'HOST_INFO': _hostInfo?.map((e) => e.toMap()).toList(),
        'HOSTREF': _hostref,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'APPLCART_ID': serializeParam(
          _applcartId,
          ParamType.String,
        ),
        'CART_ID': serializeParam(
          _cartId,
          ParamType.String,
        ),
        'CART_DISPLAY_NAME': serializeParam(
          _cartDisplayName,
          ParamType.String,
        ),
        'CHART_PHOTO': serializeParam(
          _chartPhoto,
          ParamType.String,
        ),
        'CART_LOCATION': serializeParam(
          _cartLocation,
          ParamType.LatLng,
        ),
        'CART_AMMENITIES': serializeParam(
          _cartAmmenities,
          ParamType.String,
          isList: true,
        ),
        'CART_RATE_dbl': serializeParam(
          _cARTRATEDbl,
          ParamType.double,
        ),
        'CART_RATE_int': serializeParam(
          _cARTRATEInt,
          ParamType.int,
        ),
        'CART_DESCRIPTION': serializeParam(
          _cartDescription,
          ParamType.String,
        ),
        'CART_PLATE': serializeParam(
          _cartPlate,
          ParamType.String,
        ),
        'CART_IS_BOOKER': serializeParam(
          _cartIsBooker,
          ParamType.bool,
        ),
        'CART_IS_INUSER': serializeParam(
          _cartIsInuser,
          ParamType.bool,
        ),
        'CART_CAPACITY': serializeParam(
          _cartCapacity,
          ParamType.int,
        ),
        'HOST_ID': serializeParam(
          _hostId,
          ParamType.String,
        ),
        'HOST_INFO': serializeParam(
          _hostInfo,
          ParamType.DataStruct,
          isList: true,
        ),
        'HOSTREF': serializeParam(
          _hostref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static LocalCartStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocalCartStruct(
        applcartId: deserializeParam(
          data['APPLCART_ID'],
          ParamType.String,
          false,
        ),
        cartId: deserializeParam(
          data['CART_ID'],
          ParamType.String,
          false,
        ),
        cartDisplayName: deserializeParam(
          data['CART_DISPLAY_NAME'],
          ParamType.String,
          false,
        ),
        chartPhoto: deserializeParam(
          data['CHART_PHOTO'],
          ParamType.String,
          false,
        ),
        cartLocation: deserializeParam(
          data['CART_LOCATION'],
          ParamType.LatLng,
          false,
        ),
        cartAmmenities: deserializeParam<String>(
          data['CART_AMMENITIES'],
          ParamType.String,
          true,
        ),
        cARTRATEDbl: deserializeParam(
          data['CART_RATE_dbl'],
          ParamType.double,
          false,
        ),
        cARTRATEInt: deserializeParam(
          data['CART_RATE_int'],
          ParamType.int,
          false,
        ),
        cartDescription: deserializeParam(
          data['CART_DESCRIPTION'],
          ParamType.String,
          false,
        ),
        cartPlate: deserializeParam(
          data['CART_PLATE'],
          ParamType.String,
          false,
        ),
        cartIsBooker: deserializeParam(
          data['CART_IS_BOOKER'],
          ParamType.bool,
          false,
        ),
        cartIsInuser: deserializeParam(
          data['CART_IS_INUSER'],
          ParamType.bool,
          false,
        ),
        cartCapacity: deserializeParam(
          data['CART_CAPACITY'],
          ParamType.int,
          false,
        ),
        hostId: deserializeParam(
          data['HOST_ID'],
          ParamType.String,
          false,
        ),
        hostInfo: deserializeStructParam<LocalCartStruct>(
          data['HOST_INFO'],
          ParamType.DataStruct,
          true,
          structBuilder: LocalCartStruct.fromSerializableMap,
        ),
        hostref: deserializeParam(
          data['HOSTREF'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'LocalCartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LocalCartStruct &&
        applcartId == other.applcartId &&
        cartId == other.cartId &&
        cartDisplayName == other.cartDisplayName &&
        chartPhoto == other.chartPhoto &&
        cartLocation == other.cartLocation &&
        listEquality.equals(cartAmmenities, other.cartAmmenities) &&
        cARTRATEDbl == other.cARTRATEDbl &&
        cARTRATEInt == other.cARTRATEInt &&
        cartDescription == other.cartDescription &&
        cartPlate == other.cartPlate &&
        cartIsBooker == other.cartIsBooker &&
        cartIsInuser == other.cartIsInuser &&
        cartCapacity == other.cartCapacity &&
        hostId == other.hostId &&
        listEquality.equals(hostInfo, other.hostInfo) &&
        hostref == other.hostref;
  }

  @override
  int get hashCode => const ListEquality().hash([
        applcartId,
        cartId,
        cartDisplayName,
        chartPhoto,
        cartLocation,
        cartAmmenities,
        cARTRATEDbl,
        cARTRATEInt,
        cartDescription,
        cartPlate,
        cartIsBooker,
        cartIsInuser,
        cartCapacity,
        hostId,
        hostInfo,
        hostref
      ]);
}

LocalCartStruct createLocalCartStruct({
  String? applcartId,
  String? cartId,
  String? cartDisplayName,
  String? chartPhoto,
  LatLng? cartLocation,
  double? cARTRATEDbl,
  int? cARTRATEInt,
  String? cartDescription,
  String? cartPlate,
  bool? cartIsBooker,
  bool? cartIsInuser,
  int? cartCapacity,
  String? hostId,
  DocumentReference? hostref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocalCartStruct(
      applcartId: applcartId,
      cartId: cartId,
      cartDisplayName: cartDisplayName,
      chartPhoto: chartPhoto,
      cartLocation: cartLocation,
      cARTRATEDbl: cARTRATEDbl,
      cARTRATEInt: cARTRATEInt,
      cartDescription: cartDescription,
      cartPlate: cartPlate,
      cartIsBooker: cartIsBooker,
      cartIsInuser: cartIsInuser,
      cartCapacity: cartCapacity,
      hostId: hostId,
      hostref: hostref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocalCartStruct? updateLocalCartStruct(
  LocalCartStruct? localCart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    localCart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocalCartStructData(
  Map<String, dynamic> firestoreData,
  LocalCartStruct? localCart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (localCart == null) {
    return;
  }
  if (localCart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && localCart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final localCartData = getLocalCartFirestoreData(localCart, forFieldValue);
  final nestedData = localCartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = localCart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocalCartFirestoreData(
  LocalCartStruct? localCart, [
  bool forFieldValue = false,
]) {
  if (localCart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(localCart.toMap());

  // Add any Firestore field values
  localCart.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocalCartListFirestoreData(
  List<LocalCartStruct>? localCarts,
) =>
    localCarts?.map((e) => getLocalCartFirestoreData(e, true)).toList() ?? [];
