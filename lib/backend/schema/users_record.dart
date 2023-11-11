import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "currentLocation" field.
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  bool hasCurrentLocation() => _currentLocation != null;

  // "isHost" field.
  bool? _isHost;
  bool get isHost => _isHost ?? false;
  bool hasIsHost() => _isHost != null;

  // "numberOfActiveBookings" field.
  int? _numberOfActiveBookings;
  int get numberOfActiveBookings => _numberOfActiveBookings ?? 0;
  bool hasNumberOfActiveBookings() => _numberOfActiveBookings != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "currentBalance" field.
  double? _currentBalance;
  double get currentBalance => _currentBalance ?? 0.0;
  bool hasCurrentBalance() => _currentBalance != null;

  // "cartID" field.
  DocumentReference? _cartID;
  DocumentReference? get cartID => _cartID;
  bool hasCartID() => _cartID != null;

  // "currentBalanceInt" field.
  int? _currentBalanceInt;
  int get currentBalanceInt => _currentBalanceInt ?? 0;
  bool hasCurrentBalanceInt() => _currentBalanceInt != null;

  // "primary" field.
  String? _primary;
  String get primary => _primary ?? '';
  bool hasPrimary() => _primary != null;

  // "primarySet" field.
  bool? _primarySet;
  bool get primarySet => _primarySet ?? false;
  bool hasPrimarySet() => _primarySet != null;

  // "age" field.
  DateTime? _age;
  DateTime? get age => _age;
  bool hasAge() => _age != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _currentLocation = snapshotData['currentLocation'] as LatLng?;
    _isHost = snapshotData['isHost'] as bool?;
    _numberOfActiveBookings =
        castToType<int>(snapshotData['numberOfActiveBookings']);
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _currentBalance = castToType<double>(snapshotData['currentBalance']);
    _cartID = snapshotData['cartID'] as DocumentReference?;
    _currentBalanceInt = castToType<int>(snapshotData['currentBalanceInt']);
    _primary = snapshotData['primary'] as String?;
    _primarySet = snapshotData['primarySet'] as bool?;
    _age = snapshotData['age'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  LatLng? currentLocation,
  bool? isHost,
  int? numberOfActiveBookings,
  String? displayName,
  String? phoneNumber,
  double? currentBalance,
  DocumentReference? cartID,
  int? currentBalanceInt,
  String? primary,
  bool? primarySet,
  DateTime? age,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'currentLocation': currentLocation,
      'isHost': isHost,
      'numberOfActiveBookings': numberOfActiveBookings,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'currentBalance': currentBalance,
      'cartID': cartID,
      'currentBalanceInt': currentBalanceInt,
      'primary': primary,
      'primarySet': primarySet,
      'age': age,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.currentLocation == e2?.currentLocation &&
        e1?.isHost == e2?.isHost &&
        e1?.numberOfActiveBookings == e2?.numberOfActiveBookings &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.currentBalance == e2?.currentBalance &&
        e1?.cartID == e2?.cartID &&
        e1?.currentBalanceInt == e2?.currentBalanceInt &&
        e1?.primary == e2?.primary &&
        e1?.primarySet == e2?.primarySet &&
        e1?.age == e2?.age;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.currentLocation,
        e?.isHost,
        e?.numberOfActiveBookings,
        e?.displayName,
        e?.phoneNumber,
        e?.currentBalance,
        e?.cartID,
        e?.currentBalanceInt,
        e?.primary,
        e?.primarySet,
        e?.age
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
