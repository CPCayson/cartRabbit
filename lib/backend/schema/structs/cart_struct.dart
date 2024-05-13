// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartStruct extends FFFirebaseStruct {
  CartStruct({
    String? applcartId,
    String? cartId,
    String? cartDisplayName,
    LatLng? cartLocation,
    double? cARTRATEDbl,
    String? cartDescription,
    String? cartPlate,
    bool? cartIsInuser,
    int? cartCapacity,
    String? hostId,
    bool? cartOnline,
    bool? isElectric,
    String? decalPhoto,
    bool? air,
    bool? storage,
    bool? radio,
    bool? cartBooked,
    String? cartPhoto,
    int? cARTRATEInt,
    DocumentReference? hostref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _applcartId = applcartId,
        _cartId = cartId,
        _cartDisplayName = cartDisplayName,
        _cartLocation = cartLocation,
        _cARTRATEDbl = cARTRATEDbl,
        _cartDescription = cartDescription,
        _cartPlate = cartPlate,
        _cartIsInuser = cartIsInuser,
        _cartCapacity = cartCapacity,
        _hostId = hostId,
        _cartOnline = cartOnline,
        _isElectric = isElectric,
        _decalPhoto = decalPhoto,
        _air = air,
        _storage = storage,
        _radio = radio,
        _cartBooked = cartBooked,
        _cartPhoto = cartPhoto,
        _cARTRATEInt = cARTRATEInt,
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

  // "CART_LOCATION" field.
  LatLng? _cartLocation;
  LatLng? get cartLocation => _cartLocation;
  set cartLocation(LatLng? val) => _cartLocation = val;
  bool hasCartLocation() => _cartLocation != null;

  // "CART_RATE_dbl" field.
  double? _cARTRATEDbl;
  double get cARTRATEDbl => _cARTRATEDbl ?? 0.0;
  set cARTRATEDbl(double? val) => _cARTRATEDbl = val;
  void incrementCARTRATEDbl(double amount) =>
      _cARTRATEDbl = cARTRATEDbl + amount;
  bool hasCARTRATEDbl() => _cARTRATEDbl != null;

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
      _cartCapacity = cartCapacity + amount;
  bool hasCartCapacity() => _cartCapacity != null;

  // "HOST_ID" field.
  String? _hostId;
  String get hostId => _hostId ?? '';
  set hostId(String? val) => _hostId = val;
  bool hasHostId() => _hostId != null;

  // "CART_ONLINE" field.
  bool? _cartOnline;
  bool get cartOnline => _cartOnline ?? false;
  set cartOnline(bool? val) => _cartOnline = val;
  bool hasCartOnline() => _cartOnline != null;

  // "IS_ELECTRIC" field.
  bool? _isElectric;
  bool get isElectric => _isElectric ?? false;
  set isElectric(bool? val) => _isElectric = val;
  bool hasIsElectric() => _isElectric != null;

  // "DECAL_PHOTO" field.
  String? _decalPhoto;
  String get decalPhoto => _decalPhoto ?? '';
  set decalPhoto(String? val) => _decalPhoto = val;
  bool hasDecalPhoto() => _decalPhoto != null;

  // "AIR" field.
  bool? _air;
  bool get air => _air ?? false;
  set air(bool? val) => _air = val;
  bool hasAir() => _air != null;

  // "STORAGE" field.
  bool? _storage;
  bool get storage => _storage ?? false;
  set storage(bool? val) => _storage = val;
  bool hasStorage() => _storage != null;

  // "RADIO" field.
  bool? _radio;
  bool get radio => _radio ?? false;
  set radio(bool? val) => _radio = val;
  bool hasRadio() => _radio != null;

  // "CART_BOOKED" field.
  bool? _cartBooked;
  bool get cartBooked => _cartBooked ?? false;
  set cartBooked(bool? val) => _cartBooked = val;
  bool hasCartBooked() => _cartBooked != null;

  // "CART_PHOTO" field.
  String? _cartPhoto;
  String get cartPhoto => _cartPhoto ?? '';
  set cartPhoto(String? val) => _cartPhoto = val;
  bool hasCartPhoto() => _cartPhoto != null;

  // "CART_RATE_int" field.
  int? _cARTRATEInt;
  int get cARTRATEInt => _cARTRATEInt ?? 0;
  set cARTRATEInt(int? val) => _cARTRATEInt = val;
  void incrementCARTRATEInt(int amount) => _cARTRATEInt = cARTRATEInt + amount;
  bool hasCARTRATEInt() => _cARTRATEInt != null;

  // "HOSTREF" field.
  DocumentReference? _hostref;
  DocumentReference? get hostref => _hostref;
  set hostref(DocumentReference? val) => _hostref = val;
  bool hasHostref() => _hostref != null;

  static CartStruct fromMap(Map<String, dynamic> data) => CartStruct(
        applcartId: data['APPLCART_ID'] as String?,
        cartId: data['CART_ID'] as String?,
        cartDisplayName: data['CART_DISPLAY_NAME'] as String?,
        cartLocation: data['CART_LOCATION'] as LatLng?,
        cARTRATEDbl: castToType<double>(data['CART_RATE_dbl']),
        cartDescription: data['CART_DESCRIPTION'] as String?,
        cartPlate: data['CART_PLATE'] as String?,
        cartIsInuser: data['CART_IS_INUSER'] as bool?,
        cartCapacity: castToType<int>(data['CART_CAPACITY']),
        hostId: data['HOST_ID'] as String?,
        cartOnline: data['CART_ONLINE'] as bool?,
        isElectric: data['IS_ELECTRIC'] as bool?,
        decalPhoto: data['DECAL_PHOTO'] as String?,
        air: data['AIR'] as bool?,
        storage: data['STORAGE'] as bool?,
        radio: data['RADIO'] as bool?,
        cartBooked: data['CART_BOOKED'] as bool?,
        cartPhoto: data['CART_PHOTO'] as String?,
        cARTRATEInt: castToType<int>(data['CART_RATE_int']),
        hostref: data['HOSTREF'] as DocumentReference?,
      );

  static CartStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'APPLCART_ID': _applcartId,
        'CART_ID': _cartId,
        'CART_DISPLAY_NAME': _cartDisplayName,
        'CART_LOCATION': _cartLocation,
        'CART_RATE_dbl': _cARTRATEDbl,
        'CART_DESCRIPTION': _cartDescription,
        'CART_PLATE': _cartPlate,
        'CART_IS_INUSER': _cartIsInuser,
        'CART_CAPACITY': _cartCapacity,
        'HOST_ID': _hostId,
        'CART_ONLINE': _cartOnline,
        'IS_ELECTRIC': _isElectric,
        'DECAL_PHOTO': _decalPhoto,
        'AIR': _air,
        'STORAGE': _storage,
        'RADIO': _radio,
        'CART_BOOKED': _cartBooked,
        'CART_PHOTO': _cartPhoto,
        'CART_RATE_int': _cARTRATEInt,
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
        'CART_LOCATION': serializeParam(
          _cartLocation,
          ParamType.LatLng,
        ),
        'CART_RATE_dbl': serializeParam(
          _cARTRATEDbl,
          ParamType.double,
        ),
        'CART_DESCRIPTION': serializeParam(
          _cartDescription,
          ParamType.String,
        ),
        'CART_PLATE': serializeParam(
          _cartPlate,
          ParamType.String,
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
        'CART_ONLINE': serializeParam(
          _cartOnline,
          ParamType.bool,
        ),
        'IS_ELECTRIC': serializeParam(
          _isElectric,
          ParamType.bool,
        ),
        'DECAL_PHOTO': serializeParam(
          _decalPhoto,
          ParamType.String,
        ),
        'AIR': serializeParam(
          _air,
          ParamType.bool,
        ),
        'STORAGE': serializeParam(
          _storage,
          ParamType.bool,
        ),
        'RADIO': serializeParam(
          _radio,
          ParamType.bool,
        ),
        'CART_BOOKED': serializeParam(
          _cartBooked,
          ParamType.bool,
        ),
        'CART_PHOTO': serializeParam(
          _cartPhoto,
          ParamType.String,
        ),
        'CART_RATE_int': serializeParam(
          _cARTRATEInt,
          ParamType.int,
        ),
        'HOSTREF': serializeParam(
          _hostref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CartStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartStruct(
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
        cartLocation: deserializeParam(
          data['CART_LOCATION'],
          ParamType.LatLng,
          false,
        ),
        cARTRATEDbl: deserializeParam(
          data['CART_RATE_dbl'],
          ParamType.double,
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
        cartOnline: deserializeParam(
          data['CART_ONLINE'],
          ParamType.bool,
          false,
        ),
        isElectric: deserializeParam(
          data['IS_ELECTRIC'],
          ParamType.bool,
          false,
        ),
        decalPhoto: deserializeParam(
          data['DECAL_PHOTO'],
          ParamType.String,
          false,
        ),
        air: deserializeParam(
          data['AIR'],
          ParamType.bool,
          false,
        ),
        storage: deserializeParam(
          data['STORAGE'],
          ParamType.bool,
          false,
        ),
        radio: deserializeParam(
          data['RADIO'],
          ParamType.bool,
          false,
        ),
        cartBooked: deserializeParam(
          data['CART_BOOKED'],
          ParamType.bool,
          false,
        ),
        cartPhoto: deserializeParam(
          data['CART_PHOTO'],
          ParamType.String,
          false,
        ),
        cARTRATEInt: deserializeParam(
          data['CART_RATE_int'],
          ParamType.int,
          false,
        ),
        hostref: deserializeParam(
          data['HOSTREF'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'CartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartStruct &&
        applcartId == other.applcartId &&
        cartId == other.cartId &&
        cartDisplayName == other.cartDisplayName &&
        cartLocation == other.cartLocation &&
        cARTRATEDbl == other.cARTRATEDbl &&
        cartDescription == other.cartDescription &&
        cartPlate == other.cartPlate &&
        cartIsInuser == other.cartIsInuser &&
        cartCapacity == other.cartCapacity &&
        hostId == other.hostId &&
        cartOnline == other.cartOnline &&
        isElectric == other.isElectric &&
        decalPhoto == other.decalPhoto &&
        air == other.air &&
        storage == other.storage &&
        radio == other.radio &&
        cartBooked == other.cartBooked &&
        cartPhoto == other.cartPhoto &&
        cARTRATEInt == other.cARTRATEInt &&
        hostref == other.hostref;
  }

  @override
  int get hashCode => const ListEquality().hash([
        applcartId,
        cartId,
        cartDisplayName,
        cartLocation,
        cARTRATEDbl,
        cartDescription,
        cartPlate,
        cartIsInuser,
        cartCapacity,
        hostId,
        cartOnline,
        isElectric,
        decalPhoto,
        air,
        storage,
        radio,
        cartBooked,
        cartPhoto,
        cARTRATEInt,
        hostref
      ]);
}

CartStruct createCartStruct({
  String? applcartId,
  String? cartId,
  String? cartDisplayName,
  LatLng? cartLocation,
  double? cARTRATEDbl,
  String? cartDescription,
  String? cartPlate,
  bool? cartIsInuser,
  int? cartCapacity,
  String? hostId,
  bool? cartOnline,
  bool? isElectric,
  String? decalPhoto,
  bool? air,
  bool? storage,
  bool? radio,
  bool? cartBooked,
  String? cartPhoto,
  int? cARTRATEInt,
  DocumentReference? hostref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      applcartId: applcartId,
      cartId: cartId,
      cartDisplayName: cartDisplayName,
      cartLocation: cartLocation,
      cARTRATEDbl: cARTRATEDbl,
      cartDescription: cartDescription,
      cartPlate: cartPlate,
      cartIsInuser: cartIsInuser,
      cartCapacity: cartCapacity,
      hostId: hostId,
      cartOnline: cartOnline,
      isElectric: isElectric,
      decalPhoto: decalPhoto,
      air: air,
      storage: storage,
      radio: radio,
      cartBooked: cartBooked,
      cartPhoto: cartPhoto,
      cARTRATEInt: cARTRATEInt,
      hostref: hostref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cart
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && cart.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cart.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cart.toMap());

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((e) => getCartFirestoreData(e, true)).toList() ?? [];
