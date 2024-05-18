// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingStruct extends FFFirebaseStruct {
  BookingStruct({
    String? cartRef,
    String? bookingUid,
    DateTime? timestamp,
    DateTime? startTime,
    DateTime? endTime,
    String? userRef,
    double? price,
    int? hours,
    String? status,
    String? hostRef,
    LatLng? startloc,
    String? userName,
    String? cartName,
    DocumentReference? cartref,
    DocumentReference? hostref,
    DocumentReference? userref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cartRef = cartRef,
        _bookingUid = bookingUid,
        _timestamp = timestamp,
        _startTime = startTime,
        _endTime = endTime,
        _userRef = userRef,
        _price = price,
        _hours = hours,
        _status = status,
        _hostRef = hostRef,
        _startloc = startloc,
        _userName = userName,
        _cartName = cartName,
        _cartref = cartref,
        _hostref = hostref,
        _userref = userref,
        super(firestoreUtilData);

  // "CART_REF" field.
  String? _cartRef;
  String get cartRef => _cartRef ?? '';
  set cartRef(String? val) => _cartRef = val;
  bool hasCartRef() => _cartRef != null;

  // "BOOKING_UID" field.
  String? _bookingUid;
  String get bookingUid => _bookingUid ?? '';
  set bookingUid(String? val) => _bookingUid = val;
  bool hasBookingUid() => _bookingUid != null;

  // "TIMESTAMP" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "START_TIME" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "END_TIME" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  // "USER_REF" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  set userRef(String? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "PRICE" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "HOURS" field.
  int? _hours;
  int get hours => _hours ?? 0;
  set hours(int? val) => _hours = val;
  void incrementHours(int amount) => _hours = hours + amount;
  bool hasHours() => _hours != null;

  // "STATUS" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "HOST_REF" field.
  String? _hostRef;
  String get hostRef => _hostRef ?? '';
  set hostRef(String? val) => _hostRef = val;
  bool hasHostRef() => _hostRef != null;

  // "STARTLOC" field.
  LatLng? _startloc;
  LatLng? get startloc => _startloc;
  set startloc(LatLng? val) => _startloc = val;
  bool hasStartloc() => _startloc != null;

  // "USER_NAME" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "CART_NAME" field.
  String? _cartName;
  String get cartName => _cartName ?? '';
  set cartName(String? val) => _cartName = val;
  bool hasCartName() => _cartName != null;

  // "CARTREF" field.
  DocumentReference? _cartref;
  DocumentReference? get cartref => _cartref;
  set cartref(DocumentReference? val) => _cartref = val;
  bool hasCartref() => _cartref != null;

  // "HOSTREF" field.
  DocumentReference? _hostref;
  DocumentReference? get hostref => _hostref;
  set hostref(DocumentReference? val) => _hostref = val;
  bool hasHostref() => _hostref != null;

  // "USERREF" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  set userref(DocumentReference? val) => _userref = val;
  bool hasUserref() => _userref != null;

  static BookingStruct fromMap(Map<String, dynamic> data) => BookingStruct(
        cartRef: data['CART_REF'] as String?,
        bookingUid: data['BOOKING_UID'] as String?,
        timestamp: data['TIMESTAMP'] as DateTime?,
        startTime: data['START_TIME'] as DateTime?,
        endTime: data['END_TIME'] as DateTime?,
        userRef: data['USER_REF'] as String?,
        price: castToType<double>(data['PRICE']),
        hours: castToType<int>(data['HOURS']),
        status: data['STATUS'] as String?,
        hostRef: data['HOST_REF'] as String?,
        startloc: data['STARTLOC'] as LatLng?,
        userName: data['USER_NAME'] as String?,
        cartName: data['CART_NAME'] as String?,
        cartref: data['CARTREF'] as DocumentReference?,
        hostref: data['HOSTREF'] as DocumentReference?,
        userref: data['USERREF'] as DocumentReference?,
      );

  static BookingStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'CART_REF': _cartRef,
        'BOOKING_UID': _bookingUid,
        'TIMESTAMP': _timestamp,
        'START_TIME': _startTime,
        'END_TIME': _endTime,
        'USER_REF': _userRef,
        'PRICE': _price,
        'HOURS': _hours,
        'STATUS': _status,
        'HOST_REF': _hostRef,
        'STARTLOC': _startloc,
        'USER_NAME': _userName,
        'CART_NAME': _cartName,
        'CARTREF': _cartref,
        'HOSTREF': _hostref,
        'USERREF': _userref,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CART_REF': serializeParam(
          _cartRef,
          ParamType.String,
        ),
        'BOOKING_UID': serializeParam(
          _bookingUid,
          ParamType.String,
        ),
        'TIMESTAMP': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'START_TIME': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'END_TIME': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'USER_REF': serializeParam(
          _userRef,
          ParamType.String,
        ),
        'PRICE': serializeParam(
          _price,
          ParamType.double,
        ),
        'HOURS': serializeParam(
          _hours,
          ParamType.int,
        ),
        'STATUS': serializeParam(
          _status,
          ParamType.String,
        ),
        'HOST_REF': serializeParam(
          _hostRef,
          ParamType.String,
        ),
        'STARTLOC': serializeParam(
          _startloc,
          ParamType.LatLng,
        ),
        'USER_NAME': serializeParam(
          _userName,
          ParamType.String,
        ),
        'CART_NAME': serializeParam(
          _cartName,
          ParamType.String,
        ),
        'CARTREF': serializeParam(
          _cartref,
          ParamType.DocumentReference,
        ),
        'HOSTREF': serializeParam(
          _hostref,
          ParamType.DocumentReference,
        ),
        'USERREF': serializeParam(
          _userref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static BookingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingStruct(
        cartRef: deserializeParam(
          data['CART_REF'],
          ParamType.String,
          false,
        ),
        bookingUid: deserializeParam(
          data['BOOKING_UID'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['TIMESTAMP'],
          ParamType.DateTime,
          false,
        ),
        startTime: deserializeParam(
          data['START_TIME'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['END_TIME'],
          ParamType.DateTime,
          false,
        ),
        userRef: deserializeParam(
          data['USER_REF'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['PRICE'],
          ParamType.double,
          false,
        ),
        hours: deserializeParam(
          data['HOURS'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['STATUS'],
          ParamType.String,
          false,
        ),
        hostRef: deserializeParam(
          data['HOST_REF'],
          ParamType.String,
          false,
        ),
        startloc: deserializeParam(
          data['STARTLOC'],
          ParamType.LatLng,
          false,
        ),
        userName: deserializeParam(
          data['USER_NAME'],
          ParamType.String,
          false,
        ),
        cartName: deserializeParam(
          data['CART_NAME'],
          ParamType.String,
          false,
        ),
        cartref: deserializeParam(
          data['CARTREF'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Carts'],
        ),
        hostref: deserializeParam(
          data['HOSTREF'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        userref: deserializeParam(
          data['USERREF'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'BookingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingStruct &&
        cartRef == other.cartRef &&
        bookingUid == other.bookingUid &&
        timestamp == other.timestamp &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        userRef == other.userRef &&
        price == other.price &&
        hours == other.hours &&
        status == other.status &&
        hostRef == other.hostRef &&
        startloc == other.startloc &&
        userName == other.userName &&
        cartName == other.cartName &&
        cartref == other.cartref &&
        hostref == other.hostref &&
        userref == other.userref;
  }

  @override
  int get hashCode => const ListEquality().hash([
        cartRef,
        bookingUid,
        timestamp,
        startTime,
        endTime,
        userRef,
        price,
        hours,
        status,
        hostRef,
        startloc,
        userName,
        cartName,
        cartref,
        hostref,
        userref
      ]);
}

BookingStruct createBookingStruct({
  String? cartRef,
  String? bookingUid,
  DateTime? timestamp,
  DateTime? startTime,
  DateTime? endTime,
  String? userRef,
  double? price,
  int? hours,
  String? status,
  String? hostRef,
  LatLng? startloc,
  String? userName,
  String? cartName,
  DocumentReference? cartref,
  DocumentReference? hostref,
  DocumentReference? userref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookingStruct(
      cartRef: cartRef,
      bookingUid: bookingUid,
      timestamp: timestamp,
      startTime: startTime,
      endTime: endTime,
      userRef: userRef,
      price: price,
      hours: hours,
      status: status,
      hostRef: hostRef,
      startloc: startloc,
      userName: userName,
      cartName: cartName,
      cartref: cartref,
      hostref: hostref,
      userref: userref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookingStruct? updateBookingStruct(
  BookingStruct? booking, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    booking
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookingStructData(
  Map<String, dynamic> firestoreData,
  BookingStruct? booking,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (booking == null) {
    return;
  }
  if (booking.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && booking.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookingData = getBookingFirestoreData(booking, forFieldValue);
  final nestedData = bookingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = booking.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookingFirestoreData(
  BookingStruct? booking, [
  bool forFieldValue = false,
]) {
  if (booking == null) {
    return {};
  }
  final firestoreData = mapToFirestore(booking.toMap());

  // Add any Firestore field values
  booking.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookingListFirestoreData(
  List<BookingStruct>? bookings,
) =>
    bookings?.map((e) => getBookingFirestoreData(e, true)).toList() ?? [];
