import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_APPUSER')) {
        try {
          final serializedData = prefs.getString('ff_APPUSER') ?? '{}';
          _APPUSER = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_CURRENTBOOKING')) {
        try {
          final serializedData = prefs.getString('ff_CURRENTBOOKING') ?? '{}';
          _CURRENTBOOKING =
              BookingStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _LOCALCARTS = prefs
              .getStringList('ff_LOCALCARTS')
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
    _safeInit(() {
      _CARTS = prefs
              .getStringList('ff_CARTS')
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
    _safeInit(() {
      _RENTEDCARTS = prefs
              .getStringList('ff_RENTEDCARTS')
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
    _safeInit(() {
      _BOOKINGS = prefs
              .getStringList('ff_BOOKINGS')
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
          _BOOKINGS;
    });
    _safeInit(() {
      _MYBOOKINGS = prefs
              .getStringList('ff_MYBOOKINGS')
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
    _safeInit(() {
      _cartLock = prefs.getBool('ff_cartLock') ?? _cartLock;
    });
    _safeInit(() {
      _CHATS = prefs
              .getStringList('ff_CHATS')
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
    _safeInit(() {
      _CHATMESSAGES = prefs
              .getStringList('ff_CHATMESSAGES')
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
    _safeInit(() {
      _CURRENTBOOKINGS = prefs
              .getStringList('ff_CURRENTBOOKINGS')
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
    _safeInit(() {
      _PASTBOOKINGS = prefs
              .getStringList('ff_PASTBOOKINGS')
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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _APPUSER = UserStruct.fromSerializableMap(jsonDecode(
      '{\"UID\":\"123\",\"APP_UID\":\"123\",\"USER_DISPLAY_NAME\":\"cONNOR\",\"USER_CURRENT_LOCATION\":\"30.3126834,-89.32703149999999\",\"USER_SHORT_DESCRIP\":\"IM COOL\",\"USER_ROLE_SET\":\"[]\",\"hasBooked\":\"true\"}'));
  UserStruct get APPUSER => _APPUSER;
  set APPUSER(UserStruct _value) {
    _APPUSER = _value;
    prefs.setString('ff_APPUSER', _value.serialize());
  }

  void updateAPPUSERStruct(Function(UserStruct) updateFn) {
    updateFn(_APPUSER);
    prefs.setString('ff_APPUSER', _APPUSER.serialize());
  }

  BookingStruct _CURRENTBOOKING = BookingStruct();
  BookingStruct get CURRENTBOOKING => _CURRENTBOOKING;
  set CURRENTBOOKING(BookingStruct _value) {
    _CURRENTBOOKING = _value;
    prefs.setString('ff_CURRENTBOOKING', _value.serialize());
  }

  void updateCURRENTBOOKINGStruct(Function(BookingStruct) updateFn) {
    updateFn(_CURRENTBOOKING);
    prefs.setString('ff_CURRENTBOOKING', _CURRENTBOOKING.serialize());
  }

  List<LocalCartStruct> _LOCALCARTS = [];
  List<LocalCartStruct> get LOCALCARTS => _LOCALCARTS;
  set LOCALCARTS(List<LocalCartStruct> _value) {
    _LOCALCARTS = _value;
    prefs.setStringList(
        'ff_LOCALCARTS', _value.map((x) => x.serialize()).toList());
  }

  void addToLOCALCARTS(LocalCartStruct _value) {
    _LOCALCARTS.add(_value);
    prefs.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void removeFromLOCALCARTS(LocalCartStruct _value) {
    _LOCALCARTS.remove(_value);
    prefs.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLOCALCARTS(int _index) {
    _LOCALCARTS.removeAt(_index);
    prefs.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void updateLOCALCARTSAtIndex(
    int _index,
    LocalCartStruct Function(LocalCartStruct) updateFn,
  ) {
    _LOCALCARTS[_index] = updateFn(_LOCALCARTS[_index]);
    prefs.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLOCALCARTS(int _index, LocalCartStruct _value) {
    _LOCALCARTS.insert(_index, _value);
    prefs.setStringList(
        'ff_LOCALCARTS', _LOCALCARTS.map((x) => x.serialize()).toList());
  }

  List<CartStruct> _CARTS = [
    CartStruct.fromSerializableMap(jsonDecode(
        '{\"APPLCART_ID\":\"Hello World\",\"CART_ID\":\"Hello World\",\"CART_DISPLAY_NAME\":\"Hello World\",\"CART_LOCATION\":\"0.0,0.0\",\"CART_RATE_dbl\":\"0.0\",\"CART_DESCRIPTION\":\"Hello World\",\"CART_PLATE\":\"Hello World\",\"CART_IS_INUSER\":\"false\",\"CART_CAPACITY\":\"0\",\"HOST_ID\":\"Hello World\",\"CART_ONLINE\":\"false\",\"IS_ELECTRIC\":\"false\",\"DECAL_PHOTO\":\"https://picsum.photos/seed/752/600\",\"AIR\":\"false\",\"STORAGE\":\"false\",\"RADIO\":\"false\",\"CART_BOOKED\":\"false\",\"CART_PHOTO\":\"https://picsum.photos/seed/761/600\",\"CART_RATE_int\":\"0\"}'))
  ];
  List<CartStruct> get CARTS => _CARTS;
  set CARTS(List<CartStruct> _value) {
    _CARTS = _value;
    prefs.setStringList('ff_CARTS', _value.map((x) => x.serialize()).toList());
  }

  void addToCARTS(CartStruct _value) {
    _CARTS.add(_value);
    prefs.setStringList('ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void removeFromCARTS(CartStruct _value) {
    _CARTS.remove(_value);
    prefs.setStringList('ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCARTS(int _index) {
    _CARTS.removeAt(_index);
    prefs.setStringList('ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void updateCARTSAtIndex(
    int _index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    _CARTS[_index] = updateFn(_CARTS[_index]);
    prefs.setStringList('ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCARTS(int _index, CartStruct _value) {
    _CARTS.insert(_index, _value);
    prefs.setStringList('ff_CARTS', _CARTS.map((x) => x.serialize()).toList());
  }

  List<CartStruct> _RENTEDCARTS = [
    CartStruct.fromSerializableMap(jsonDecode(
        '{\"APPLCART_ID\":\"Hello World\",\"CART_ID\":\"Hello World\",\"CART_DISPLAY_NAME\":\"Hello World\",\"CART_LOCATION\":\"0.0,0.0\",\"CART_RATE_dbl\":\"0.0\",\"CART_DESCRIPTION\":\"Hello World\",\"CART_PLATE\":\"Hello World\",\"CART_IS_INUSER\":\"false\",\"CART_CAPACITY\":\"0\",\"HOST_ID\":\"Hello World\",\"CART_ONLINE\":\"false\",\"IS_ELECTRIC\":\"false\",\"DECAL_PHOTO\":\"https://picsum.photos/seed/996/600\",\"AIR\":\"false\",\"STORAGE\":\"false\",\"RADIO\":\"false\",\"CART_BOOKED\":\"false\",\"CART_PHOTO\":\"https://picsum.photos/seed/831/600\",\"CART_RATE_int\":\"0\",\"HOSTREF\":\"/users/example\"}'))
  ];
  List<CartStruct> get RENTEDCARTS => _RENTEDCARTS;
  set RENTEDCARTS(List<CartStruct> _value) {
    _RENTEDCARTS = _value;
    prefs.setStringList(
        'ff_RENTEDCARTS', _value.map((x) => x.serialize()).toList());
  }

  void addToRENTEDCARTS(CartStruct _value) {
    _RENTEDCARTS.add(_value);
    prefs.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void removeFromRENTEDCARTS(CartStruct _value) {
    _RENTEDCARTS.remove(_value);
    prefs.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRENTEDCARTS(int _index) {
    _RENTEDCARTS.removeAt(_index);
    prefs.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void updateRENTEDCARTSAtIndex(
    int _index,
    CartStruct Function(CartStruct) updateFn,
  ) {
    _RENTEDCARTS[_index] = updateFn(_RENTEDCARTS[_index]);
    prefs.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRENTEDCARTS(int _index, CartStruct _value) {
    _RENTEDCARTS.insert(_index, _value);
    prefs.setStringList(
        'ff_RENTEDCARTS', _RENTEDCARTS.map((x) => x.serialize()).toList());
  }

  List<BookingStruct> _BOOKINGS = [
    BookingStruct.fromSerializableMap(jsonDecode(
        '{\"CART_REF\":\"Hello World\",\"BOOKING_UID\":\"Hello World\",\"TIMESTAMP\":\"1711082758916\",\"START_TIME\":\"1711082758916\",\"END_TIME\":\"1711082758916\",\"USER_REF\":\"Hello World\",\"PRICE\":\"0\",\"HOURS\":\"0\",\"STATUS\":\"Hello World\",\"HOST_REF\":\"Hello World\",\"STARTLOC\":\"0,0\"}')),
    BookingStruct.fromSerializableMap(jsonDecode(
        '{\"CART_REF\":\"Hello World\",\"BOOKING_UID\":\"Hello World\",\"TIMESTAMP\":\"1711082760061\",\"START_TIME\":\"1711082760061\",\"END_TIME\":\"1711082760061\",\"USER_REF\":\"Hello World\",\"PRICE\":\"0\",\"HOURS\":\"0\",\"STATUS\":\"Hello World\",\"HOST_REF\":\"Hello World\",\"STARTLOC\":\"0,0\"}')),
    BookingStruct.fromSerializableMap(jsonDecode(
        '{\"CART_REF\":\"Hello World\",\"BOOKING_UID\":\"Hello World\",\"TIMESTAMP\":\"1711082761081\",\"START_TIME\":\"1711082761081\",\"END_TIME\":\"1711082761081\",\"USER_REF\":\"Hello World\",\"PRICE\":\"0\",\"HOURS\":\"0\",\"STATUS\":\"Hello World\",\"HOST_REF\":\"Hello World\",\"STARTLOC\":\"0,0\"}'))
  ];
  List<BookingStruct> get BOOKINGS => _BOOKINGS;
  set BOOKINGS(List<BookingStruct> _value) {
    _BOOKINGS = _value;
    prefs.setStringList(
        'ff_BOOKINGS', _value.map((x) => x.serialize()).toList());
  }

  void addToBOOKINGS(BookingStruct _value) {
    _BOOKINGS.add(_value);
    prefs.setStringList(
        'ff_BOOKINGS', _BOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromBOOKINGS(BookingStruct _value) {
    _BOOKINGS.remove(_value);
    prefs.setStringList(
        'ff_BOOKINGS', _BOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBOOKINGS(int _index) {
    _BOOKINGS.removeAt(_index);
    prefs.setStringList(
        'ff_BOOKINGS', _BOOKINGS.map((x) => x.serialize()).toList());
  }

  void updateBOOKINGSAtIndex(
    int _index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    _BOOKINGS[_index] = updateFn(_BOOKINGS[_index]);
    prefs.setStringList(
        'ff_BOOKINGS', _BOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBOOKINGS(int _index, BookingStruct _value) {
    _BOOKINGS.insert(_index, _value);
    prefs.setStringList(
        'ff_BOOKINGS', _BOOKINGS.map((x) => x.serialize()).toList());
  }

  List<BookingStruct> _MYBOOKINGS = [];
  List<BookingStruct> get MYBOOKINGS => _MYBOOKINGS;
  set MYBOOKINGS(List<BookingStruct> _value) {
    _MYBOOKINGS = _value;
    prefs.setStringList(
        'ff_MYBOOKINGS', _value.map((x) => x.serialize()).toList());
  }

  void addToMYBOOKINGS(BookingStruct _value) {
    _MYBOOKINGS.add(_value);
    prefs.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromMYBOOKINGS(BookingStruct _value) {
    _MYBOOKINGS.remove(_value);
    prefs.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMYBOOKINGS(int _index) {
    _MYBOOKINGS.removeAt(_index);
    prefs.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updateMYBOOKINGSAtIndex(
    int _index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    _MYBOOKINGS[_index] = updateFn(_MYBOOKINGS[_index]);
    prefs.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMYBOOKINGS(int _index, BookingStruct _value) {
    _MYBOOKINGS.insert(_index, _value);
    prefs.setStringList(
        'ff_MYBOOKINGS', _MYBOOKINGS.map((x) => x.serialize()).toList());
  }

  bool _cartLock = false;
  bool get cartLock => _cartLock;
  set cartLock(bool _value) {
    _cartLock = _value;
    prefs.setBool('ff_cartLock', _value);
  }

  List<ChatStruct> _CHATS = [];
  List<ChatStruct> get CHATS => _CHATS;
  set CHATS(List<ChatStruct> _value) {
    _CHATS = _value;
    prefs.setStringList('ff_CHATS', _value.map((x) => x.serialize()).toList());
  }

  void addToCHATS(ChatStruct _value) {
    _CHATS.add(_value);
    prefs.setStringList('ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void removeFromCHATS(ChatStruct _value) {
    _CHATS.remove(_value);
    prefs.setStringList('ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCHATS(int _index) {
    _CHATS.removeAt(_index);
    prefs.setStringList('ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void updateCHATSAtIndex(
    int _index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    _CHATS[_index] = updateFn(_CHATS[_index]);
    prefs.setStringList('ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCHATS(int _index, ChatStruct _value) {
    _CHATS.insert(_index, _value);
    prefs.setStringList('ff_CHATS', _CHATS.map((x) => x.serialize()).toList());
  }

  List<ChatMessageStruct> _CHATMESSAGES = [
    ChatMessageStruct.fromSerializableMap(jsonDecode(
        '{\"user\":\"123\",\"chat\":\"chat1\",\"text\":\"Hello World\",\"image\":\"https://picsum.photos/seed/2/600\",\"timestamp\":\"1711330118140\"}'))
  ];
  List<ChatMessageStruct> get CHATMESSAGES => _CHATMESSAGES;
  set CHATMESSAGES(List<ChatMessageStruct> _value) {
    _CHATMESSAGES = _value;
    prefs.setStringList(
        'ff_CHATMESSAGES', _value.map((x) => x.serialize()).toList());
  }

  void addToCHATMESSAGES(ChatMessageStruct _value) {
    _CHATMESSAGES.add(_value);
    prefs.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void removeFromCHATMESSAGES(ChatMessageStruct _value) {
    _CHATMESSAGES.remove(_value);
    prefs.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCHATMESSAGES(int _index) {
    _CHATMESSAGES.removeAt(_index);
    prefs.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void updateCHATMESSAGESAtIndex(
    int _index,
    ChatMessageStruct Function(ChatMessageStruct) updateFn,
  ) {
    _CHATMESSAGES[_index] = updateFn(_CHATMESSAGES[_index]);
    prefs.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCHATMESSAGES(int _index, ChatMessageStruct _value) {
    _CHATMESSAGES.insert(_index, _value);
    prefs.setStringList(
        'ff_CHATMESSAGES', _CHATMESSAGES.map((x) => x.serialize()).toList());
  }

  MeetingStruct _currentMeeting = MeetingStruct.fromSerializableMap(jsonDecode(
      '{\"sub\":\"hiii\",\"start\":\"1711486320000\",\"end\":\"1711572720000\",\"id\":\"1\"}'));
  MeetingStruct get currentMeeting => _currentMeeting;
  set currentMeeting(MeetingStruct _value) {
    _currentMeeting = _value;
  }

  void updateCurrentMeetingStruct(Function(MeetingStruct) updateFn) {
    updateFn(_currentMeeting);
  }

  MeetingStruct _meetingThatChanged = MeetingStruct.fromSerializableMap(jsonDecode(
      '{\"sub\":\"hi\",\"col\":\"#4b39ef\",\"start\":\"1713312000000\",\"end\":\"1713315600000\"}'));
  MeetingStruct get meetingThatChanged => _meetingThatChanged;
  set meetingThatChanged(MeetingStruct _value) {
    _meetingThatChanged = _value;
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
  set meetings(List<MeetingStruct> _value) {
    _meetings = _value;
  }

  void addToMeetings(MeetingStruct _value) {
    _meetings.add(_value);
  }

  void removeFromMeetings(MeetingStruct _value) {
    _meetings.remove(_value);
  }

  void removeAtIndexFromMeetings(int _index) {
    _meetings.removeAt(_index);
  }

  void updateMeetingsAtIndex(
    int _index,
    MeetingStruct Function(MeetingStruct) updateFn,
  ) {
    _meetings[_index] = updateFn(_meetings[_index]);
  }

  void insertAtIndexInMeetings(int _index, MeetingStruct _value) {
    _meetings.insert(_index, _value);
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
  set googleMapData(List<GoogleMapDataStruct> _value) {
    _googleMapData = _value;
  }

  void addToGoogleMapData(GoogleMapDataStruct _value) {
    _googleMapData.add(_value);
  }

  void removeFromGoogleMapData(GoogleMapDataStruct _value) {
    _googleMapData.remove(_value);
  }

  void removeAtIndexFromGoogleMapData(int _index) {
    _googleMapData.removeAt(_index);
  }

  void updateGoogleMapDataAtIndex(
    int _index,
    GoogleMapDataStruct Function(GoogleMapDataStruct) updateFn,
  ) {
    _googleMapData[_index] = updateFn(_googleMapData[_index]);
  }

  void insertAtIndexInGoogleMapData(int _index, GoogleMapDataStruct _value) {
    _googleMapData.insert(_index, _value);
  }

  BookingStruct _booked = BookingStruct();
  BookingStruct get booked => _booked;
  set booked(BookingStruct _value) {
    _booked = _value;
  }

  void updateBookedStruct(Function(BookingStruct) updateFn) {
    updateFn(_booked);
  }

  List<BookingStruct> _CURRENTBOOKINGS = [];
  List<BookingStruct> get CURRENTBOOKINGS => _CURRENTBOOKINGS;
  set CURRENTBOOKINGS(List<BookingStruct> _value) {
    _CURRENTBOOKINGS = _value;
    prefs.setStringList(
        'ff_CURRENTBOOKINGS', _value.map((x) => x.serialize()).toList());
  }

  void addToCURRENTBOOKINGS(BookingStruct _value) {
    _CURRENTBOOKINGS.add(_value);
    prefs.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromCURRENTBOOKINGS(BookingStruct _value) {
    _CURRENTBOOKINGS.remove(_value);
    prefs.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCURRENTBOOKINGS(int _index) {
    _CURRENTBOOKINGS.removeAt(_index);
    prefs.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updateCURRENTBOOKINGSAtIndex(
    int _index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    _CURRENTBOOKINGS[_index] = updateFn(_CURRENTBOOKINGS[_index]);
    prefs.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCURRENTBOOKINGS(int _index, BookingStruct _value) {
    _CURRENTBOOKINGS.insert(_index, _value);
    prefs.setStringList('ff_CURRENTBOOKINGS',
        _CURRENTBOOKINGS.map((x) => x.serialize()).toList());
  }

  List<BookingStruct> _PASTBOOKINGS = [];
  List<BookingStruct> get PASTBOOKINGS => _PASTBOOKINGS;
  set PASTBOOKINGS(List<BookingStruct> _value) {
    _PASTBOOKINGS = _value;
    prefs.setStringList(
        'ff_PASTBOOKINGS', _value.map((x) => x.serialize()).toList());
  }

  void addToPASTBOOKINGS(BookingStruct _value) {
    _PASTBOOKINGS.add(_value);
    prefs.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeFromPASTBOOKINGS(BookingStruct _value) {
    _PASTBOOKINGS.remove(_value);
    prefs.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPASTBOOKINGS(int _index) {
    _PASTBOOKINGS.removeAt(_index);
    prefs.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void updatePASTBOOKINGSAtIndex(
    int _index,
    BookingStruct Function(BookingStruct) updateFn,
  ) {
    _PASTBOOKINGS[_index] = updateFn(_PASTBOOKINGS[_index]);
    prefs.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPASTBOOKINGS(int _index, BookingStruct _value) {
    _PASTBOOKINGS.insert(_index, _value);
    prefs.setStringList(
        'ff_PASTBOOKINGS', _PASTBOOKINGS.map((x) => x.serialize()).toList());
  }

  String _link = '';
  String get link => _link;
  set link(String _value) {
    _link = _value;
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
