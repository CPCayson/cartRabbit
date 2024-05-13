// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? uid,
    String? userDisplayName,
    String? userPhone,
    String? userPhoto,
    String? userEmail,
    LatLng? userCurrentLocation,
    DateTime? userAge,
    String? userShortDescrip,
    bool? userIsHost,
    bool? userOnline,
    DateTime? userCreated,
    DateTime? userLastActive,
    DateTime? userLastUpdated,
    List<bool>? userRoleSet,
    String? userRole,
    bool? hasBooked,
    int? lastCartSelected,
    String? userAgeString,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _userDisplayName = userDisplayName,
        _userPhone = userPhone,
        _userPhoto = userPhoto,
        _userEmail = userEmail,
        _userCurrentLocation = userCurrentLocation,
        _userAge = userAge,
        _userShortDescrip = userShortDescrip,
        _userIsHost = userIsHost,
        _userOnline = userOnline,
        _userCreated = userCreated,
        _userLastActive = userLastActive,
        _userLastUpdated = userLastUpdated,
        _userRoleSet = userRoleSet,
        _userRole = userRole,
        _hasBooked = hasBooked,
        _lastCartSelected = lastCartSelected,
        _userAgeString = userAgeString,
        super(firestoreUtilData);

  // "UID" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "USER_DISPLAY_NAME" field.
  String? _userDisplayName;
  String get userDisplayName => _userDisplayName ?? '';
  set userDisplayName(String? val) => _userDisplayName = val;
  bool hasUserDisplayName() => _userDisplayName != null;

  // "USER_PHONE" field.
  String? _userPhone;
  String get userPhone => _userPhone ?? '';
  set userPhone(String? val) => _userPhone = val;
  bool hasUserPhone() => _userPhone != null;

  // "USER_PHOTO" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  set userPhoto(String? val) => _userPhoto = val;
  bool hasUserPhoto() => _userPhoto != null;

  // "USER_EMAIL" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;
  bool hasUserEmail() => _userEmail != null;

  // "USER_CURRENT_LOCATION" field.
  LatLng? _userCurrentLocation;
  LatLng? get userCurrentLocation => _userCurrentLocation;
  set userCurrentLocation(LatLng? val) => _userCurrentLocation = val;
  bool hasUserCurrentLocation() => _userCurrentLocation != null;

  // "USER_AGE" field.
  DateTime? _userAge;
  DateTime? get userAge => _userAge;
  set userAge(DateTime? val) => _userAge = val;
  bool hasUserAge() => _userAge != null;

  // "USER_SHORT_DESCRIP" field.
  String? _userShortDescrip;
  String get userShortDescrip => _userShortDescrip ?? '';
  set userShortDescrip(String? val) => _userShortDescrip = val;
  bool hasUserShortDescrip() => _userShortDescrip != null;

  // "USER_IS_HOST" field.
  bool? _userIsHost;
  bool get userIsHost => _userIsHost ?? false;
  set userIsHost(bool? val) => _userIsHost = val;
  bool hasUserIsHost() => _userIsHost != null;

  // "USER_ONLINE" field.
  bool? _userOnline;
  bool get userOnline => _userOnline ?? false;
  set userOnline(bool? val) => _userOnline = val;
  bool hasUserOnline() => _userOnline != null;

  // "USER_CREATED" field.
  DateTime? _userCreated;
  DateTime? get userCreated => _userCreated;
  set userCreated(DateTime? val) => _userCreated = val;
  bool hasUserCreated() => _userCreated != null;

  // "USER_LAST_ACTIVE" field.
  DateTime? _userLastActive;
  DateTime? get userLastActive => _userLastActive;
  set userLastActive(DateTime? val) => _userLastActive = val;
  bool hasUserLastActive() => _userLastActive != null;

  // "USER_LAST_UPDATED" field.
  DateTime? _userLastUpdated;
  DateTime? get userLastUpdated => _userLastUpdated;
  set userLastUpdated(DateTime? val) => _userLastUpdated = val;
  bool hasUserLastUpdated() => _userLastUpdated != null;

  // "USER_ROLE_SET" field.
  List<bool>? _userRoleSet;
  List<bool> get userRoleSet => _userRoleSet ?? const [];
  set userRoleSet(List<bool>? val) => _userRoleSet = val;
  void updateUserRoleSet(Function(List<bool>) updateFn) =>
      updateFn(_userRoleSet ??= []);
  bool hasUserRoleSet() => _userRoleSet != null;

  // "USER_ROLE" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;
  bool hasUserRole() => _userRole != null;

  // "hasBooked" field.
  bool? _hasBooked;
  bool get hasBooked => _hasBooked ?? false;
  set hasBooked(bool? val) => _hasBooked = val;
  bool hasHasBooked() => _hasBooked != null;

  // "lastCartSelected" field.
  int? _lastCartSelected;
  int get lastCartSelected => _lastCartSelected ?? 0;
  set lastCartSelected(int? val) => _lastCartSelected = val;
  void incrementLastCartSelected(int amount) =>
      _lastCartSelected = lastCartSelected + amount;
  bool hasLastCartSelected() => _lastCartSelected != null;

  // "userAgeString" field.
  String? _userAgeString;
  String get userAgeString => _userAgeString ?? '';
  set userAgeString(String? val) => _userAgeString = val;
  bool hasUserAgeString() => _userAgeString != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        uid: data['UID'] as String?,
        userDisplayName: data['USER_DISPLAY_NAME'] as String?,
        userPhone: data['USER_PHONE'] as String?,
        userPhoto: data['USER_PHOTO'] as String?,
        userEmail: data['USER_EMAIL'] as String?,
        userCurrentLocation: data['USER_CURRENT_LOCATION'] as LatLng?,
        userAge: data['USER_AGE'] as DateTime?,
        userShortDescrip: data['USER_SHORT_DESCRIP'] as String?,
        userIsHost: data['USER_IS_HOST'] as bool?,
        userOnline: data['USER_ONLINE'] as bool?,
        userCreated: data['USER_CREATED'] as DateTime?,
        userLastActive: data['USER_LAST_ACTIVE'] as DateTime?,
        userLastUpdated: data['USER_LAST_UPDATED'] as DateTime?,
        userRoleSet: getDataList(data['USER_ROLE_SET']),
        userRole: data['USER_ROLE'] as String?,
        hasBooked: data['hasBooked'] as bool?,
        lastCartSelected: castToType<int>(data['lastCartSelected']),
        userAgeString: data['userAgeString'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UID': _uid,
        'USER_DISPLAY_NAME': _userDisplayName,
        'USER_PHONE': _userPhone,
        'USER_PHOTO': _userPhoto,
        'USER_EMAIL': _userEmail,
        'USER_CURRENT_LOCATION': _userCurrentLocation,
        'USER_AGE': _userAge,
        'USER_SHORT_DESCRIP': _userShortDescrip,
        'USER_IS_HOST': _userIsHost,
        'USER_ONLINE': _userOnline,
        'USER_CREATED': _userCreated,
        'USER_LAST_ACTIVE': _userLastActive,
        'USER_LAST_UPDATED': _userLastUpdated,
        'USER_ROLE_SET': _userRoleSet,
        'USER_ROLE': _userRole,
        'hasBooked': _hasBooked,
        'lastCartSelected': _lastCartSelected,
        'userAgeString': _userAgeString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UID': serializeParam(
          _uid,
          ParamType.String,
        ),
        'USER_DISPLAY_NAME': serializeParam(
          _userDisplayName,
          ParamType.String,
        ),
        'USER_PHONE': serializeParam(
          _userPhone,
          ParamType.String,
        ),
        'USER_PHOTO': serializeParam(
          _userPhoto,
          ParamType.String,
        ),
        'USER_EMAIL': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'USER_CURRENT_LOCATION': serializeParam(
          _userCurrentLocation,
          ParamType.LatLng,
        ),
        'USER_AGE': serializeParam(
          _userAge,
          ParamType.DateTime,
        ),
        'USER_SHORT_DESCRIP': serializeParam(
          _userShortDescrip,
          ParamType.String,
        ),
        'USER_IS_HOST': serializeParam(
          _userIsHost,
          ParamType.bool,
        ),
        'USER_ONLINE': serializeParam(
          _userOnline,
          ParamType.bool,
        ),
        'USER_CREATED': serializeParam(
          _userCreated,
          ParamType.DateTime,
        ),
        'USER_LAST_ACTIVE': serializeParam(
          _userLastActive,
          ParamType.DateTime,
        ),
        'USER_LAST_UPDATED': serializeParam(
          _userLastUpdated,
          ParamType.DateTime,
        ),
        'USER_ROLE_SET': serializeParam(
          _userRoleSet,
          ParamType.bool,
          true,
        ),
        'USER_ROLE': serializeParam(
          _userRole,
          ParamType.String,
        ),
        'hasBooked': serializeParam(
          _hasBooked,
          ParamType.bool,
        ),
        'lastCartSelected': serializeParam(
          _lastCartSelected,
          ParamType.int,
        ),
        'userAgeString': serializeParam(
          _userAgeString,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        uid: deserializeParam(
          data['UID'],
          ParamType.String,
          false,
        ),
        userDisplayName: deserializeParam(
          data['USER_DISPLAY_NAME'],
          ParamType.String,
          false,
        ),
        userPhone: deserializeParam(
          data['USER_PHONE'],
          ParamType.String,
          false,
        ),
        userPhoto: deserializeParam(
          data['USER_PHOTO'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['USER_EMAIL'],
          ParamType.String,
          false,
        ),
        userCurrentLocation: deserializeParam(
          data['USER_CURRENT_LOCATION'],
          ParamType.LatLng,
          false,
        ),
        userAge: deserializeParam(
          data['USER_AGE'],
          ParamType.DateTime,
          false,
        ),
        userShortDescrip: deserializeParam(
          data['USER_SHORT_DESCRIP'],
          ParamType.String,
          false,
        ),
        userIsHost: deserializeParam(
          data['USER_IS_HOST'],
          ParamType.bool,
          false,
        ),
        userOnline: deserializeParam(
          data['USER_ONLINE'],
          ParamType.bool,
          false,
        ),
        userCreated: deserializeParam(
          data['USER_CREATED'],
          ParamType.DateTime,
          false,
        ),
        userLastActive: deserializeParam(
          data['USER_LAST_ACTIVE'],
          ParamType.DateTime,
          false,
        ),
        userLastUpdated: deserializeParam(
          data['USER_LAST_UPDATED'],
          ParamType.DateTime,
          false,
        ),
        userRoleSet: deserializeParam<bool>(
          data['USER_ROLE_SET'],
          ParamType.bool,
          true,
        ),
        userRole: deserializeParam(
          data['USER_ROLE'],
          ParamType.String,
          false,
        ),
        hasBooked: deserializeParam(
          data['hasBooked'],
          ParamType.bool,
          false,
        ),
        lastCartSelected: deserializeParam(
          data['lastCartSelected'],
          ParamType.int,
          false,
        ),
        userAgeString: deserializeParam(
          data['userAgeString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        uid == other.uid &&
        userDisplayName == other.userDisplayName &&
        userPhone == other.userPhone &&
        userPhoto == other.userPhoto &&
        userEmail == other.userEmail &&
        userCurrentLocation == other.userCurrentLocation &&
        userAge == other.userAge &&
        userShortDescrip == other.userShortDescrip &&
        userIsHost == other.userIsHost &&
        userOnline == other.userOnline &&
        userCreated == other.userCreated &&
        userLastActive == other.userLastActive &&
        userLastUpdated == other.userLastUpdated &&
        listEquality.equals(userRoleSet, other.userRoleSet) &&
        userRole == other.userRole &&
        hasBooked == other.hasBooked &&
        lastCartSelected == other.lastCartSelected &&
        userAgeString == other.userAgeString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        uid,
        userDisplayName,
        userPhone,
        userPhoto,
        userEmail,
        userCurrentLocation,
        userAge,
        userShortDescrip,
        userIsHost,
        userOnline,
        userCreated,
        userLastActive,
        userLastUpdated,
        userRoleSet,
        userRole,
        hasBooked,
        lastCartSelected,
        userAgeString
      ]);
}

UserStruct createUserStruct({
  String? uid,
  String? userDisplayName,
  String? userPhone,
  String? userPhoto,
  String? userEmail,
  LatLng? userCurrentLocation,
  DateTime? userAge,
  String? userShortDescrip,
  bool? userIsHost,
  bool? userOnline,
  DateTime? userCreated,
  DateTime? userLastActive,
  DateTime? userLastUpdated,
  String? userRole,
  bool? hasBooked,
  int? lastCartSelected,
  String? userAgeString,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      uid: uid,
      userDisplayName: userDisplayName,
      userPhone: userPhone,
      userPhoto: userPhoto,
      userEmail: userEmail,
      userCurrentLocation: userCurrentLocation,
      userAge: userAge,
      userShortDescrip: userShortDescrip,
      userIsHost: userIsHost,
      userOnline: userOnline,
      userCreated: userCreated,
      userLastActive: userLastActive,
      userLastUpdated: userLastUpdated,
      userRole: userRole,
      hasBooked: hasBooked,
      lastCartSelected: lastCartSelected,
      userAgeString: userAgeString,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
