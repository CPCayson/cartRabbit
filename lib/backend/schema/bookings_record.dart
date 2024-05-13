import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "bookingID" field.
  String? _bookingID;
  String get bookingID => _bookingID ?? '';
  bool hasBookingID() => _bookingID != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  bool hasIsComplete() => _isComplete != null;

  // "numHours" field.
  int? _numHours;
  int get numHours => _numHours ?? 0;
  bool hasNumHours() => _numHours != null;

  // "cancelReason" field.
  String? _cancelReason;
  String get cancelReason => _cancelReason ?? '';
  bool hasCancelReason() => _cancelReason != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "tripTotal" field.
  double? _tripTotal;
  double get tripTotal => _tripTotal ?? 0.0;
  bool hasTripTotal() => _tripTotal != null;

  // "cartID" field.
  String? _cartID;
  String get cartID => _cartID ?? '';
  bool hasCartID() => _cartID != null;

  // "hostID" field.
  String? _hostID;
  String get hostID => _hostID ?? '';
  bool hasHostID() => _hostID != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "cart" field.
  CartStruct? _cart;
  CartStruct get cart => _cart ?? CartStruct();
  bool hasCart() => _cart != null;

  // "host" field.
  UserStruct? _host;
  UserStruct get host => _host ?? UserStruct();
  bool hasHost() => _host != null;

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  bool hasUser() => _user != null;

  void _initializeFields() {
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _bookingID = snapshotData['bookingID'] as String?;
    _status = snapshotData['status'] as bool?;
    _isComplete = snapshotData['isComplete'] as bool?;
    _numHours = castToType<int>(snapshotData['numHours']);
    _cancelReason = snapshotData['cancelReason'] as String?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _tripTotal = castToType<double>(snapshotData['tripTotal']);
    _cartID = snapshotData['cartID'] as String?;
    _hostID = snapshotData['hostID'] as String?;
    _userID = snapshotData['userID'] as String?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _cart = CartStruct.maybeFromMap(snapshotData['cart']);
    _host = UserStruct.maybeFromMap(snapshotData['host']);
    _user = UserStruct.maybeFromMap(snapshotData['user']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? cartRef,
  DocumentReference? hostRef,
  DocumentReference? userRef,
  DateTime? timestamp,
  String? bookingID,
  bool? status,
  bool? isComplete,
  int? numHours,
  String? cancelReason,
  bool? isCanceled,
  double? tripTotal,
  String? cartID,
  String? hostID,
  String? userID,
  DateTime? endTime,
  DateTime? startTime,
  double? price,
  CartStruct? cart,
  UserStruct? host,
  UserStruct? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cartRef': cartRef,
      'hostRef': hostRef,
      'userRef': userRef,
      'timestamp': timestamp,
      'bookingID': bookingID,
      'status': status,
      'isComplete': isComplete,
      'numHours': numHours,
      'cancelReason': cancelReason,
      'isCanceled': isCanceled,
      'tripTotal': tripTotal,
      'cartID': cartID,
      'hostID': hostID,
      'userID': userID,
      'endTime': endTime,
      'startTime': startTime,
      'price': price,
      'cart': CartStruct().toMap(),
      'host': UserStruct().toMap(),
      'user': UserStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "cart" field.
  addCartStructData(firestoreData, cart, 'cart');

  // Handle nested data for "host" field.
  addUserStructData(firestoreData, host, 'host');

  // Handle nested data for "user" field.
  addUserStructData(firestoreData, user, 'user');

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.cartRef == e2?.cartRef &&
        e1?.hostRef == e2?.hostRef &&
        e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.bookingID == e2?.bookingID &&
        e1?.status == e2?.status &&
        e1?.isComplete == e2?.isComplete &&
        e1?.numHours == e2?.numHours &&
        e1?.cancelReason == e2?.cancelReason &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.tripTotal == e2?.tripTotal &&
        e1?.cartID == e2?.cartID &&
        e1?.hostID == e2?.hostID &&
        e1?.userID == e2?.userID &&
        e1?.endTime == e2?.endTime &&
        e1?.startTime == e2?.startTime &&
        e1?.price == e2?.price &&
        e1?.cart == e2?.cart &&
        e1?.host == e2?.host &&
        e1?.user == e2?.user;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.cartRef,
        e?.hostRef,
        e?.userRef,
        e?.timestamp,
        e?.bookingID,
        e?.status,
        e?.isComplete,
        e?.numHours,
        e?.cancelReason,
        e?.isCanceled,
        e?.tripTotal,
        e?.cartID,
        e?.hostID,
        e?.userID,
        e?.endTime,
        e?.startTime,
        e?.price,
        e?.cart,
        e?.host,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
