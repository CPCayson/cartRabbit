import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_APPUSER') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_APPUSER') ?? '{}';
          _APPUSER = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_CURRENTBOOKING') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_CURRENTBOOKING') ?? '{}';
          _CURRENTBOOKING =
              BookingStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _LOCALCARTS = (await secureStorage.getStringList('ff_LOCALCARTS'))
              ?.map((x) {
                try {
                  return LocalCartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _LOCALCARTS;
    });
    await _safeInitAsync(() async {
      _CARTS = (await secureStorage.getStringList('ff_CARTS'))
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CARTS;
    });
    await _safeInitAsync(() async {
      _RENTEDCARTS = (await secureStorage.getStringList('ff_RENTEDCARTS'))
              ?.map((x) {
                try {
                  return CartStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _RENTEDCARTS;
    });
    await _safeInitAsync(() async {
      _MYBOOKINGS = (await secureStorage.getStringList('ff_MYBOOKINGS'))
              ?.map((x) {
                try {
                  return BookingStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _MYBOOKINGS;
    });
    await _safeInitAsync(() async {
      _cartLock = await secureStorage.getBool('ff_cartLock') ?? _cartLock;
    });
    await _safeInitAsync(() async {
      _CHATS = (await secureStorage.getStringList('ff_CHATS'))
              ?.map((x) {
                try {
                  return ChatStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CHATS;
    });
    await _safeInitAsync(() async {
      _CHATMESSAGES = (await secureStorage.getStringList('ff_CHATMESSAGES'))
              ?.map((x) {
                try {
                  return ChatMessageStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CHATMESSAGES;
    });
    await _safeInitAsync(() async {
      _CURRENTBOOKINGS =
          (await secureStorage.getStringList('ff_CURRENTBOOKINGS'))
                  ?.map((x) {
                    try {
                      return BookingStruct.fromSerializableMap(jsonDecode(x));
                    } catch (e) {
                      print("Can't decode persisted data type. Error: $e.");
                      return null;
                    }
                  })
                  .withoutNulls
                  .toList() ??
              _CURRENTBOOKINGS;
    });
    await _safeInitAsync(() async {
      _PASTBOOKINGS = (await secureStorage.getStringList('ff_PASTBOOKINGS'))
              ?.map((x) {
                try {
                  return BookingStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _PASTBOOKINGS;
    });
    await _safeInitAsync(() async {
      _toke = await secureStorage.getString('ff_toke') ?? _toke;
    });
    await _safeInitAsync(() async {
      _isHost = await secureStorage.getBool('ff_isHost') ?? _isHost;
    });
    await _safeInitAsync(() async {
      _filterList = (await secureStorage.getStringList('ff_filterList'))
              ?.map((path) => path.ref)
              .toList() ??
          _filterList;
    });
    await _safeInitAsync(() async {
      _digit = await secureStorage.getDouble('ff_digit') ?? _digit;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  UserStruct _APPUSER = UserStruct.fromSerializableMap(jsonDecode(
      '{\"UID\":\"123\",\"APP_UID\":\"123\",\"USER_DISPLAY_NAME\":\"cONNOR\",\"USER_CURRENT_LOCATION\":\"30.3126834,-89.32703149999999\",\"USER_SHORT_DESCRIP\":\"IM COOL\",\"USER_ROLE_SET\":\"[]\",\"hasBooked\":\"true\"}'));
  UserStruct get APPUSER => _APPUSER;
  set APPUSER(UserStruct value) {
    _APPUSER = value;
    secureStorage.setString('ff_APPUSER', value.serialize());
  }

  void deleteAPPUSER() {
    secureStorage.delete(key: 'ff_APPUSER');
  }

  void updateAPPUSERStruct(Function(UserStruct) updateFn) {
    updateFn(_APPUSER);
    secureStorage.setString('ff_APPUSER', _APPUSER.serialize());
  }

  BookingStruct _CURRENTBOOKING = BookingStruct();
  BookingStruct get CURRENTBOOKING => _CURRENTBOOKING;
  set CURRENTBOOKING(BookingStruct value) {
    _CURRENTBOOKING = value;
    secureStorage.setString('ff_CURRENTBOOKING', value.serialize());
  }

  void deleteCURRENTBOOKING() {
    secureStorage.delete(key: 'ff_CURRENTBOOKING');
  }

  void updateCURRENTBOOKINGStruct(Function(BookingStruct) updateFn) {
    updateFn(_CURRENTBOOKING);
    secureStorage.setString('ff_CURRENTBOOKING', _CURRENTBOOKING.serialize());
  }

  List<LocalCartStruct> _LOCALCARTS = [];
  List<LocalCartStruct> get LOCALCARTS => _LOCALCARTS;
  set LOCALCARTS(List<LocalCartStruct> value) {
    _LOCALCARTS = value;
    secureStorage.setStringList(
        'ff_LOCALCARTS', value.map((x) => x.serialize()).toList());
  }

  void deleteLOCALCARTS() {
    secureStorage.delete(key: 'ff_LOCALCARTS');
  }

  void addToLOCALCARTS(LocalCartStruct value) {
    LOCALCARTS.add(value);
    secureStorage.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void removeFromLOCALCARTS(LocalCartStruct value) {
    LOCALCARTS.remove(value);
    secureStorage.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLOCALCARTS(int index) {
    LOCALCARTS.removeAt(index);
    secureStorage.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void updateLOCALCARTSAtIndex(
    int index,
    LocalCartStruct Function(LocalCartStruct) updateFn,
  ) {
    LOCALCARTS[index] = updateFn(_LOCALCARTS[index]);
    secureStorage.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLOCALCARTS(int index, LocalCartStruct value) {
    LOCALCARTS.insert(index, value);
    secureStorage.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  List<CartStruct> _CARTS = [
    CartStruct.fromSerializableMap(jsonDecode(
        '{\"APPLCART_ID\":\"Hello World\",\"CART_ID\":\"Hello World\",\"CART_DISPLAY_NAME\":\"Hello World\",\"CART_LOCATION\":\"0.0,0.0\",\"CART_RATE_dbl\":\"0.0\",\"CART_DESCRIPTION\":\"Hello World\",\"CART_PLATE\":\"Hello World\",\"CART_IS_INUSER\":\"false\",\"CART_CAPACITY\":\"0\",\"HOST_ID\":\"Hello World\",\"CART_ONLINE\":\"false\",\"IS_ELECTRIC\":\"false\",\"DECAL_PHOTO\":\"https://picsum.photos/seed/752/600\",\"AIR\":\"false\",\"STORAGE\":\"false\",\"RADIO\":\"false\",\"CART_BOOKED\":\"false\",\"CART_PHOTO\":\"https://picsum.photos/seed/761/600\",\"CART_RATE_int\":\"0\"}'))
  ];
  List<CartStruct> get CARTS => _CARTS;
  set CARTS(List<CartStruct> value) {
    _CARTS = value;
    secureStorage.setStringList(
        'ff_CARTS', value.map((x) => x.serialize()).toList());
  }

  void deleteCARTS() {
    secureStorage.delete(key: 'ff_CARTS');
  }

  void addToCARTS(CartStruct value) {
    CARTS.add(value);
    secureStorage.setStringList(
        'ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void removeFromCARTS(CartStruct value) {
    CARTS.remove(value);
    secureStorage.setStringList(
        'ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCARTS(int index) {
    CARTS.removeAt(index);
    secureStorage.setStringList(
        'ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void updateCARTSAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    CARTS[index] = updateFn(_CARTS[index]);
    secureStorage.setStringList(
        'ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCARTS(int index, CartStruct value) {
    CARTS.insert(index, value);
    secureStorage.setStringList(
        'ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  List<CartStruct> _RENTEDCARTS = [
    CartStruct.fromSerializableMap(jsonDecode(
        '{\"APPLCART_ID\":\"Hello World\",\"CART_ID\":\"Hello World\",\"CART_DISPLAY_NAME\":\"Hello World\",\"CART_LOCATION\":\"0.0,0.0\",\"CART_RATE_dbl\":\"0.0\",\"CART_DESCRIPTION\":\"Hello World\",\"CART_PLATE\":\"Hello World\",\"CART_IS_INUSER\":\"false\",\"CART_CAPACITY\":\"0\",\"HOST_ID\":\"Hello World\",\"CART_ONLINE\":\"false\",\"IS_ELECTRIC\":\"false\",\"DECAL_PHOTO\":\"https://picsum.photos/seed/996/600\",\"AIR\":\"false\",\"STORAGE\":\"false\",\"RADIO\":\"false\",\"CART_BOOKED\":\"false\",\"CART_PHOTO\":\"https://picsum.photos/seed/831/600\",\"CART_RATE_int\":\"0\",\"HOSTREF\":\"/users/example\"}'))
  ];
  List<CartStruct> get RENTEDCARTS => _RENTEDCARTS;
  set RENTEDCARTS(List<CartStruct> value) {
    _RENTEDCARTS = value;
    secureStorage.setStringList(
        'ff_RENTEDCARTS', value.map((x) => x.serialize()).toList());
  }

  void deleteRENTEDCARTS() {
    secureStorage.delete(key: 'ff_RENTEDCARTS');
  }

  void addToRENTEDCARTS(CartStruct value) {
    RENTEDCARTS.add(value);
    secureStorage.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void removeFromRENTEDCARTS(CartStruct value) {
    RENTEDCARTS.remove(value);
    secureStorage.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRENTEDCARTS(int index) {
    RENTEDCARTS.removeAt(index);
    secureStorage.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void updateRENTEDCARTSAtIndex(
    int index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    RENTEDCARTS[index] = updateFn(_RENTEDCARTS[index]);
    secureStorage.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRENTEDCARTS(int index, CartStruct value) {
    RENTEDCARTS.insert(index, value);
    secureStorage.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  List<BookingStruct> _MYBOOKINGS = [];
  List<BookingStruct> get MYBOOKINGS => _MYBOOKINGS;
  set MYBOOKINGS(List<BookingStruct> value) {
    _MYBOOKINGS = value;
    secureStorage.setStringList(
        'ff_MYBOOKINGS', value.map((x) => x.serialize()).toList());
  }

  void deleteMYBOOKINGS() {
    secureStorage.delete(key: 'ff_MYBOOKINGS');
  }

  void addToMYBOOKINGS(BookingStruct value) {
    MYBOOKINGS.add(value);
    secureStorage.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromMYBOOKINGS(BookingStruct value) {
    MYBOOKINGS.remove(value);
    secureStorage.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMYBOOKINGS(int index) {
    MYBOOKINGS.removeAt(index);
    secureStorage.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updateMYBOOKINGSAtIndex(
    int index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    MYBOOKINGS[index] = updateFn(_MYBOOKINGS[index]);
    secureStorage.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMYBOOKINGS(int index, BookingStruct value) {
    MYBOOKINGS.insert(index, value);
    secureStorage.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  bool _cartLock = false;
  bool get cartLock => _cartLock;
  set cartLock(bool value) {
    _cartLock = value;
    secureStorage.setBool('ff_cartLock', value);
  }

  void deleteCartLock() {
    secureStorage.delete(key: 'ff_cartLock');
  }

  List<ChatStruct> _CHATS = [];
  List<ChatStruct> get CHATS => _CHATS;
  set CHATS(List<ChatStruct> value) {
    _CHATS = value;
    secureStorage.setStringList(
        'ff_CHATS', value.map((x) => x.serialize()).toList());
  }

  void deleteCHATS() {
    secureStorage.delete(key: 'ff_CHATS');
  }

  void addToCHATS(ChatStruct value) {
    CHATS.add(value);
    secureStorage.setStringList(
        'ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void removeFromCHATS(ChatStruct value) {
    CHATS.remove(value);
    secureStorage.setStringList(
        'ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCHATS(int index) {
    CHATS.removeAt(index);
    secureStorage.setStringList(
        'ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void updateCHATSAtIndex(
    int index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    CHATS[index] = updateFn(_CHATS[index]);
    secureStorage.setStringList(
        'ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCHATS(int index, ChatStruct value) {
    CHATS.insert(index, value);
    secureStorage.setStringList(
        'ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  List<ChatMessageStruct> _CHATMESSAGES = [
    ChatMessageStruct.fromSerializableMap(jsonDecode(
        '{\"user\":\"123\",\"chat\":\"chat1\",\"text\":\"Hello World\",\"image\":\"https://picsum.photos/seed/2/600\",\"timestamp\":\"1711330118140\"}'))
  ];
  List<ChatMessageStruct> get CHATMESSAGES => _CHATMESSAGES;
  set CHATMESSAGES(List<ChatMessageStruct> value) {
    _CHATMESSAGES = value;
    secureStorage.setStringList(
        'ff_CHATMESSAGES', value.map((x) => x.serialize()).toList());
  }

  void deleteCHATMESSAGES() {
    secureStorage.delete(key: 'ff_CHATMESSAGES');
  }

  void addToCHATMESSAGES(ChatMessageStruct value) {
    CHATMESSAGES.add(value);
    secureStorage.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void removeFromCHATMESSAGES(ChatMessageStruct value) {
    CHATMESSAGES.remove(value);
    secureStorage.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCHATMESSAGES(int index) {
    CHATMESSAGES.removeAt(index);
    secureStorage.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void updateCHATMESSAGESAtIndex(
    int index,
    ChatMessageStruct Function(ChatMessageStruct) updateFn,
  ) {
    CHATMESSAGES[index] = updateFn(_CHATMESSAGES[index]);
    secureStorage.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCHATMESSAGES(int index, ChatMessageStruct value) {
    CHATMESSAGES.insert(index, value);
    secureStorage.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  MeetingStruct _currentMeeting = MeetingStruct.fromSerializableMap(jsonDecode(
      '{\"sub\":\"hiii\",\"start\":\"1711486320000\",\"end\":\"1711572720000\",\"id\":\"1\"}'));
  MeetingStruct get currentMeeting => _currentMeeting;
  set currentMeeting(MeetingStruct value) {
    _currentMeeting = value;
  }

  void updateCurrentMeetingStruct(Function(MeetingStruct) updateFn) {
    updateFn(_currentMeeting);
  }

  MeetingStruct _meetingThatChanged = MeetingStruct.fromSerializableMap(jsonDecode(
      '{\"sub\":\"hi\",\"col\":\"#4b39ef\",\"start\":\"1713312000000\",\"end\":\"1713315600000\"}'));
  MeetingStruct get meetingThatChanged => _meetingThatChanged;
  set meetingThatChanged(MeetingStruct value) {
    _meetingThatChanged = value;
  }

  void updateMeetingThatChangedStruct(Function(MeetingStruct) updateFn) {
    updateFn(_meetingThatChanged);
  }

  List<MeetingStruct> _meetings = [
    MeetingStruct.fromSerializableMap(jsonDecode(
        '{\"sub\":\"Hello World\",\"col\":\"#0000\",\"start\":\"1713325789829\",\"end\":\"1713329340000\",\"id\":\"Hello World\"}')),
    MeetingStruct.fromSerializableMap(jsonDecode(
        '{\"sub\":\"Hello World\",\"col\":\"#ee8b60\",\"start\":\"1713325810924\",\"end\":\"1713286800000\",\"id\":\"Hello World\"}'))
  ];
  List<MeetingStruct> get meetings => _meetings;
  set meetings(List<MeetingStruct> value) {
    _meetings = value;
  }

  void addToMeetings(MeetingStruct value) {
    meetings.add(value);
  }

  void removeFromMeetings(MeetingStruct value) {
    meetings.remove(value);
  }

  void removeAtIndexFromMeetings(int index) {
    meetings.removeAt(index);
  }

  void updateMeetingsAtIndex(
    int index,
    MeetingStruct Function(MeetingStruct) updateFn,
  ) {
    meetings[index] = updateFn(_meetings[index]);
  }

  void insertAtIndexInMeetings(int index, MeetingStruct value) {
    meetings.insert(index, value);
  }

  List<GoogleMapDataStruct> _googleMapData = [
    GoogleMapDataStruct.fromSerializableMap(jsonDecode(
        '{\"latLng\":\"30.3126834,-89.32703149999999\",\"iconPath\":\"icon.png\",\"title\":\"lol\",\"description\":\"lol\"}')),
    GoogleMapDataStruct.fromSerializableMap(jsonDecode(
        '{\"latLng\":\"0.0,0.0\",\"iconPath\":\"https://picsum.photos/seed/610/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}')),
    GoogleMapDataStruct.fromSerializableMap(jsonDecode(
        '{\"latLng\":\"0.0,0.0\",\"iconPath\":\"https://picsum.photos/seed/522/600\",\"title\":\"Hello World\",\"description\":\"Hello World\"}'))
  ];
  List<GoogleMapDataStruct> get googleMapData => _googleMapData;
  set googleMapData(List<GoogleMapDataStruct> value) {
    _googleMapData = value;
  }

  void addToGoogleMapData(GoogleMapDataStruct value) {
    googleMapData.add(value);
  }

  void removeFromGoogleMapData(GoogleMapDataStruct value) {
    googleMapData.remove(value);
  }

  void removeAtIndexFromGoogleMapData(int index) {
    googleMapData.removeAt(index);
  }

  void updateGoogleMapDataAtIndex(
    int index,
    GoogleMapDataStruct Function(GoogleMapDataStruct) updateFn,
  ) {
    googleMapData[index] = updateFn(_googleMapData[index]);
  }

  void insertAtIndexInGoogleMapData(int index, GoogleMapDataStruct value) {
    googleMapData.insert(index, value);
  }

  BookingStruct _booked = BookingStruct();
  BookingStruct get booked => _booked;
  set booked(BookingStruct value) {
    _booked = value;
  }

  void updateBookedStruct(Function(BookingStruct) updateFn) {
    updateFn(_booked);
  }

  List<BookingStruct> _CURRENTBOOKINGS = [];
  List<BookingStruct> get CURRENTBOOKINGS => _CURRENTBOOKINGS;
  set CURRENTBOOKINGS(List<BookingStruct> value) {
    _CURRENTBOOKINGS = value;
    secureStorage.setStringList(
        'ff_CURRENTBOOKINGS', value.map((x) => x.serialize()).toList());
  }

  void deleteCURRENTBOOKINGS() {
    secureStorage.delete(key: 'ff_CURRENTBOOKINGS');
  }

  void addToCURRENTBOOKINGS(BookingStruct value) {
    CURRENTBOOKINGS.add(value);
    secureStorage.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromCURRENTBOOKINGS(BookingStruct value) {
    CURRENTBOOKINGS.remove(value);
    secureStorage.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCURRENTBOOKINGS(int index) {
    CURRENTBOOKINGS.removeAt(index);
    secureStorage.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updateCURRENTBOOKINGSAtIndex(
    int index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    CURRENTBOOKINGS[index] = updateFn(_CURRENTBOOKINGS[index]);
    secureStorage.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCURRENTBOOKINGS(int index, BookingStruct value) {
    CURRENTBOOKINGS.insert(index, value);
    secureStorage.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  List<BookingStruct> _PASTBOOKINGS = [];
  List<BookingStruct> get PASTBOOKINGS => _PASTBOOKINGS;
  set PASTBOOKINGS(List<BookingStruct> value) {
    _PASTBOOKINGS = value;
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', value.map((x) => x.serialize()).toList());
  }

  void deletePASTBOOKINGS() {
    secureStorage.delete(key: 'ff_PASTBOOKINGS');
  }

  void addToPASTBOOKINGS(BookingStruct value) {
    PASTBOOKINGS.add(value);
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromPASTBOOKINGS(BookingStruct value) {
    PASTBOOKINGS.remove(value);
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPASTBOOKINGS(int index) {
    PASTBOOKINGS.removeAt(index);
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updatePASTBOOKINGSAtIndex(
    int index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    PASTBOOKINGS[index] = updateFn(_PASTBOOKINGS[index]);
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPASTBOOKINGS(int index, BookingStruct value) {
    PASTBOOKINGS.insert(index, value);
    secureStorage.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  String _link = '';
  String get link => _link;
  set link(String value) {
    _link = value;
  }

  List<dynamic> _origin = [];
  List<dynamic> get origin => _origin;
  set origin(List<dynamic> value) {
    _origin = value;
  }

  void addToOrigin(dynamic value) {
    origin.add(value);
  }

  void removeFromOrigin(dynamic value) {
    origin.remove(value);
  }

  void removeAtIndexFromOrigin(int index) {
    origin.removeAt(index);
  }

  void updateOriginAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    origin[index] = updateFn(_origin[index]);
  }

  void insertAtIndexInOrigin(int index, dynamic value) {
    origin.insert(index, value);
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  LatLng? _tappedLocation;
  LatLng? get tappedLocation => _tappedLocation;
  set tappedLocation(LatLng? value) {
    _tappedLocation = value;
  }

  LatLng? _tapped;
  LatLng? get tapped => _tapped;
  set tapped(LatLng? value) {
    _tapped = value;
  }

  LatLng? _center;
  LatLng? get center => _center;
  set center(LatLng? value) {
    _center = value;
  }

  bool _isFindingRide = false;
  bool get isFindingRide => _isFindingRide;
  set isFindingRide(bool value) {
    _isFindingRide = value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  List<MarkersStruct> _positions = [];
  List<MarkersStruct> get positions => _positions;
  set positions(List<MarkersStruct> value) {
    _positions = value;
  }

  void addToPositions(MarkersStruct value) {
    positions.add(value);
  }

  void removeFromPositions(MarkersStruct value) {
    positions.remove(value);
  }

  void removeAtIndexFromPositions(int index) {
    positions.removeAt(index);
  }

  void updatePositionsAtIndex(
    int index,
    MarkersStruct Function(MarkersStruct) updateFn,
  ) {
    positions[index] = updateFn(_positions[index]);
  }

  void insertAtIndexInPositions(int index, MarkersStruct value) {
    positions.insert(index, value);
  }

  String _tokl = '';
  String get tokl => _tokl;
  set tokl(String value) {
    _tokl = value;
  }

  String _toke = '';
  String get toke => _toke;
  set toke(String value) {
    _toke = value;
    secureStorage.setString('ff_toke', value);
  }

  void deleteToke() {
    secureStorage.delete(key: 'ff_toke');
  }

  bool _isHost = false;
  bool get isHost => _isHost;
  set isHost(bool value) {
    _isHost = value;
    secureStorage.setBool('ff_isHost', value);
  }

  void deleteIsHost() {
    secureStorage.delete(key: 'ff_isHost');
  }

  List<DocumentReference> _filterList = [];
  List<DocumentReference> get filterList => _filterList;
  set filterList(List<DocumentReference> value) {
    _filterList = value;
    secureStorage.setStringList(
        'ff_filterList', value.map((x) => x.path).toList());
  }

  void deleteFilterList() {
    secureStorage.delete(key: 'ff_filterList');
  }

  void addToFilterList(DocumentReference value) {
    filterList.add(value);
    secureStorage.setStringList(
        'ff_filterList', _filterList.map((x) => x.path).toList());
  }

  void removeFromFilterList(DocumentReference value) {
    filterList.remove(value);
    secureStorage.setStringList(
        'ff_filterList', _filterList.map((x) => x.path).toList());
  }

  void removeAtIndexFromFilterList(int index) {
    filterList.removeAt(index);
    secureStorage.setStringList(
        'ff_filterList', _filterList.map((x) => x.path).toList());
  }

  void updateFilterListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    filterList[index] = updateFn(_filterList[index]);
    secureStorage.setStringList(
        'ff_filterList', _filterList.map((x) => x.path).toList());
  }

  void insertAtIndexInFilterList(int index, DocumentReference value) {
    filterList.insert(index, value);
    secureStorage.setStringList(
        'ff_filterList', _filterList.map((x) => x.path).toList());
  }

  double _digit = 0.0;
  double get digit => _digit;
  set digit(double value) {
    _digit = value;
    secureStorage.setDouble('ff_digit', value);
  }

  void deleteDigit() {
    secureStorage.delete(key: 'ff_digit');
  }

  List<String> _addresses = [];
  List<String> get addresses => _addresses;
  set addresses(List<String> value) {
    _addresses = value;
  }

  void addToAddresses(String value) {
    addresses.add(value);
  }

  void removeFromAddresses(String value) {
    addresses.remove(value);
  }

  void removeAtIndexFromAddresses(int index) {
    addresses.removeAt(index);
  }

  void updateAddressesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    addresses[index] = updateFn(_addresses[index]);
  }

  void insertAtIndexInAddresses(int index, String value) {
    addresses.insert(index, value);
  }

  List<LatLng> _locs = [];
  List<LatLng> get locs => _locs;
  set locs(List<LatLng> value) {
    _locs = value;
  }

  void addToLocs(LatLng value) {
    locs.add(value);
  }

  void removeFromLocs(LatLng value) {
    locs.remove(value);
  }

  void removeAtIndexFromLocs(int index) {
    locs.removeAt(index);
  }

  void updateLocsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    locs[index] = updateFn(_locs[index]);
  }

  void insertAtIndexInLocs(int index, LatLng value) {
    locs.insert(index, value);
  }

  bool _waiting = false;
  bool get waiting => _waiting;
  set waiting(bool value) {
    _waiting = value;
  }

  List<String> _autocompletePredictions = [];
  List<String> get autocompletePredictions => _autocompletePredictions;
  set autocompletePredictions(List<String> value) {
    _autocompletePredictions = value;
  }

  void addToAutocompletePredictions(String value) {
    autocompletePredictions.add(value);
  }

  void removeFromAutocompletePredictions(String value) {
    autocompletePredictions.remove(value);
  }

  void removeAtIndexFromAutocompletePredictions(int index) {
    autocompletePredictions.removeAt(index);
  }

  void updateAutocompletePredictionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    autocompletePredictions[index] = updateFn(_autocompletePredictions[index]);
  }

  void insertAtIndexInAutocompletePredictions(int index, String value) {
    autocompletePredictions.insert(index, value);
  }

  String _placeID = '';
  String get placeID => _placeID;
  set placeID(String value) {
    _placeID = value;
  }

  LatLng? _deviceLoc;
  LatLng? get deviceLoc => _deviceLoc;
  set deviceLoc(LatLng? value) {
    _deviceLoc = value;
  }

  bool _deviceLocOn = false;
  bool get deviceLocOn => _deviceLocOn;
  set deviceLocOn(bool value) {
    _deviceLocOn = value;
  }

  List<String> _placeids = [];
  List<String> get placeids => _placeids;
  set placeids(List<String> value) {
    _placeids = value;
  }

  void addToPlaceids(String value) {
    placeids.add(value);
  }

  void removeFromPlaceids(String value) {
    placeids.remove(value);
  }

  void removeAtIndexFromPlaceids(int index) {
    placeids.removeAt(index);
  }

  void updatePlaceidsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    placeids[index] = updateFn(_placeids[index]);
  }

  void insertAtIndexInPlaceids(int index, String value) {
    placeids.insert(index, value);
  }

  bool _live = false;
  bool get live => _live;
  set live(bool value) {
    _live = value;
  }

  bool _isActive = false;
  bool get isActive => _isActive;
  set isActive(bool value) {
    _isActive = value;
  }

  int _normalizedDista = 0;
  int get normalizedDista => _normalizedDista;
  set normalizedDista(int value) {
    _normalizedDista = value;
  }

  double _normalizedDistance = 0.0;
  double get normalizedDistance => _normalizedDistance;
  set normalizedDistance(double value) {
    _normalizedDistance = value;
  }

  String _placeid = '';
  String get placeid => _placeid;
  set placeid(String value) {
    _placeid = value;
  }

  String _placeId = '';
  String get placeId => _placeId;
  set placeId(String value) {
    _placeId = value;
  }

  double _rate = 0.0;
  double get rate => _rate;
  set rate(double value) {
    _rate = value;
  }

  CreditCardStruct _cool = CreditCardStruct();
  CreditCardStruct get cool => _cool;
  set cool(CreditCardStruct value) {
    _cool = value;
  }

  void updateCoolStruct(Function(CreditCardStruct) updateFn) {
    updateFn(_cool);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
