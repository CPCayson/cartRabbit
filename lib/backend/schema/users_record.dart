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

  // "currentLocation" field.
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  bool hasCurrentLocation() => _currentLocation != null;

  // "isHost" field.
  bool? _isHost;
  bool get isHost => _isHost ?? false;
  bool hasIsHost() => _isHost != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

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

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "bookedCars" field.
  List<DocumentReference>? _bookedCars;
  List<DocumentReference> get bookedCars => _bookedCars ?? const [];
  bool hasBookedCars() => _bookedCars != null;

  // "stripeChargesEnabled" field.
  bool? _stripeChargesEnabled;
  bool get stripeChargesEnabled => _stripeChargesEnabled ?? false;
  bool hasStripeChargesEnabled() => _stripeChargesEnabled != null;

  // "carts" field.
  List<CartStruct>? _carts;
  List<CartStruct> get carts => _carts ?? const [];
  bool hasCarts() => _carts != null;

  // "bookings" field.
  List<BookingStruct>? _bookings;
  List<BookingStruct> get bookings => _bookings ?? const [];
  bool hasBookings() => _bookings != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "stripeCustomerId" field.
  String? _stripeCustomerId;
  String get stripeCustomerId => _stripeCustomerId ?? '';
  bool hasStripeCustomerId() => _stripeCustomerId != null;

  // "stripeAccountId" field.
  String? _stripeAccountId;
  String get stripeAccountId => _stripeAccountId ?? '';
  bool hasStripeAccountId() => _stripeAccountId != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "currentBalance" field.
  int? _currentBalance;
  int get currentBalance => _currentBalance ?? 0;
  bool hasCurrentBalance() => _currentBalance != null;

  // "paymentMethods" field.
  List<String>? _paymentMethods;
  List<String> get paymentMethods => _paymentMethods ?? const [];
  bool hasPaymentMethods() => _paymentMethods != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _currentLocation = snapshotData['currentLocation'] as LatLng?;
    _isHost = snapshotData['isHost'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _currentBalanceInt = castToType<int>(snapshotData['currentBalanceInt']);
    _primary = snapshotData['primary'] as String?;
    _primarySet = snapshotData['primarySet'] as bool?;
    _age = snapshotData['age'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _bookedCars = getDataList(snapshotData['bookedCars']);
    _stripeChargesEnabled = snapshotData['stripeChargesEnabled'] as bool?;
    _carts = getStructList(
      snapshotData['carts'],
      CartStruct.fromMap,
    );
    _bookings = getStructList(
      snapshotData['bookings'],
      BookingStruct.fromMap,
    );
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _stripeCustomerId = snapshotData['stripeCustomerId'] as String?;
    _stripeAccountId = snapshotData['stripeAccountId'] as String?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _currentBalance = castToType<int>(snapshotData['currentBalance']);
    _paymentMethods = getDataList(snapshotData['paymentMethods']);
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
  LatLng? currentLocation,
  bool? isHost,
  String? displayName,
  String? phoneNumber,
  int? currentBalanceInt,
  String? primary,
  bool? primarySet,
  DateTime? age,
  String? shortDescription,
  DateTime? lastActiveTime,
  bool? stripeChargesEnabled,
  DateTime? birthdate,
  String? stripeCustomerId,
  String? stripeAccountId,
  DateTime? updatedAt,
  String? name,
  DateTime? createdTime,
  LatLng? location,
  int? currentBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'currentLocation': currentLocation,
      'isHost': isHost,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'currentBalanceInt': currentBalanceInt,
      'primary': primary,
      'primarySet': primarySet,
      'age': age,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'stripeChargesEnabled': stripeChargesEnabled,
      'birthdate': birthdate,
      'stripeCustomerId': stripeCustomerId,
      'stripeAccountId': stripeAccountId,
      'updatedAt': updatedAt,
      'name': name,
      'created_time': createdTime,
      'location': location,
      'currentBalance': currentBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.currentLocation == e2?.currentLocation &&
        e1?.isHost == e2?.isHost &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.currentBalanceInt == e2?.currentBalanceInt &&
        e1?.primary == e2?.primary &&
        e1?.primarySet == e2?.primarySet &&
        e1?.age == e2?.age &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        listEquality.equals(e1?.bookedCars, e2?.bookedCars) &&
        e1?.stripeChargesEnabled == e2?.stripeChargesEnabled &&
        listEquality.equals(e1?.carts, e2?.carts) &&
        listEquality.equals(e1?.bookings, e2?.bookings) &&
        e1?.birthdate == e2?.birthdate &&
        e1?.stripeCustomerId == e2?.stripeCustomerId &&
        e1?.stripeAccountId == e2?.stripeAccountId &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.name == e2?.name &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.currentBalance == e2?.currentBalance &&
        listEquality.equals(e1?.paymentMethods, e2?.paymentMethods);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.currentLocation,
        e?.isHost,
        e?.displayName,
        e?.phoneNumber,
        e?.currentBalanceInt,
        e?.primary,
        e?.primarySet,
        e?.age,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.bookedCars,
        e?.stripeChargesEnabled,
        e?.carts,
        e?.bookings,
        e?.birthdate,
        e?.stripeCustomerId,
        e?.stripeAccountId,
        e?.updatedAt,
        e?.name,
        e?.createdTime,
        e?.location,
        e?.currentBalance,
        e?.paymentMethods
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
