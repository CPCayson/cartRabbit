import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cardNumber = prefs.getString('ff_cardNumber') ?? _cardNumber;
    });
    _safeInit(() {
      _cardHolderName = prefs.getString('ff_cardHolderName') ?? _cardHolderName;
    });
    _safeInit(() {
      _cardName = prefs.getString('ff_cardName') ?? _cardName;
    });
    _safeInit(() {
      _zipCode = prefs.getString('ff_zipCode') ?? _zipCode;
    });
    _safeInit(() {
      _amenities = prefs.getStringList('ff_amenities')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _amenities;
    });
    _safeInit(() {
      _selectedCartID = prefs.getString('ff_selectedCartID') ?? _selectedCartID;
    });
    _safeInit(() {
      _isLooking = prefs.getBool('ff_isLooking') ?? _isLooking;
    });
    _safeInit(() {
      _hostID = prefs.getString('ff_hostID') ?? _hostID;
    });
    _safeInit(() {
      _totalBookings = prefs.getString('ff_totalBookings') ?? _totalBookings;
    });
    _safeInit(() {
      _userID = prefs.getString('ff_userID') ?? _userID;
    });
    _safeInit(() {
      _numberOfActiveBookings = prefs.getString('ff_numberOfActiveBookings') ??
          _numberOfActiveBookings;
    });
    _safeInit(() {
      _tripEndDate = prefs.containsKey('ff_tripEndDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_tripEndDate')!)
          : _tripEndDate;
    });
    _safeInit(() {
      _tripBeginDate = prefs.containsKey('ff_tripBeginDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_tripBeginDate')!)
          : _tripBeginDate;
    });
    _safeInit(() {
      _tripID = prefs.getString('ff_tripID') ?? _tripID;
    });
    _safeInit(() {
      _paymentAmount = prefs.getDouble('ff_paymentAmount') ?? _paymentAmount;
    });
    _safeInit(() {
      _paymentFees = prefs.getDouble('ff_paymentFees') ?? _paymentFees;
    });
    _safeInit(() {
      _selectedAdditionalFees = prefs.getString('ff_selectedAdditionalFees') ??
          _selectedAdditionalFees;
    });
    _safeInit(() {
      _isBooked = prefs.getBool('ff_isBooked') ?? _isBooked;
    });
    _safeInit(() {
      _numBookings = prefs.getInt('ff_numBookings') ?? _numBookings;
    });
    _safeInit(() {
      _dashType = prefs.getBool('ff_dashType') ?? _dashType;
    });
    _safeInit(() {
      _statusGo = prefs.getBool('ff_statusGo') ?? _statusGo;
    });
    _safeInit(() {
      _cartPricer = prefs.getInt('ff_cartPricer') ?? _cartPricer;
    });
    _safeInit(() {
      _timerUp = prefs.getBool('ff_timerUp') ?? _timerUp;
    });
    _safeInit(() {
      _ac = prefs.getBool('ff_ac') ?? _ac;
    });
    _safeInit(() {
      _gps = prefs.getBool('ff_gps') ?? _gps;
    });
    _safeInit(() {
      _isScannedStart = prefs.getBool('ff_isScannedStart') ?? _isScannedStart;
    });
    _safeInit(() {
      _isScannedStop = prefs.getBool('ff_isScannedStop') ?? _isScannedStop;
    });
    _safeInit(() {
      _endTime = prefs.containsKey('ff_endTime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_endTime')!)
          : _endTime;
    });
    _safeInit(() {
      _startTime = prefs.containsKey('ff_startTime')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_startTime')!)
          : _startTime;
    });
    _safeInit(() {
      _cartlikes = prefs
              .getStringList('ff_cartlikes')
              ?.map((path) => path.ref)
              .toList() ??
          _cartlikes;
    });
    _safeInit(() {
      _selectedcarts = prefs
              .getStringList('ff_selectedcarts')
              ?.map((path) => path.ref)
              .toList() ??
          _selectedcarts;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _cardNumber = '';
  String get cardNumber => _cardNumber;
  set cardNumber(String _value) {
    _cardNumber = _value;
    prefs.setString('ff_cardNumber', _value);
  }

  String _cardHolderName = '';
  String get cardHolderName => _cardHolderName;
  set cardHolderName(String _value) {
    _cardHolderName = _value;
    prefs.setString('ff_cardHolderName', _value);
  }

  String _cardName = '';
  String get cardName => _cardName;
  set cardName(String _value) {
    _cardName = _value;
    prefs.setString('ff_cardName', _value);
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String _value) {
    _zipCode = _value;
    prefs.setString('ff_zipCode', _value);
  }

  List<dynamic> _amenities = [jsonDecode('{}'), jsonDecode('{}')];
  List<dynamic> get amenities => _amenities;
  set amenities(List<dynamic> _value) {
    _amenities = _value;
    prefs.setStringList(
        'ff_amenities', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToAmenities(dynamic _value) {
    _amenities.add(_value);
    prefs.setStringList(
        'ff_amenities', _amenities.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAmenities(dynamic _value) {
    _amenities.remove(_value);
    prefs.setStringList(
        'ff_amenities', _amenities.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAmenities(int _index) {
    _amenities.removeAt(_index);
    prefs.setStringList(
        'ff_amenities', _amenities.map((x) => jsonEncode(x)).toList());
  }

  void updateAmenitiesAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _amenities[_index] = updateFn(_amenities[_index]);
    prefs.setStringList(
        'ff_amenities', _amenities.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAmenities(int _index, dynamic _value) {
    _amenities.insert(_index, _value);
    prefs.setStringList(
        'ff_amenities', _amenities.map((x) => jsonEncode(x)).toList());
  }

  bool _colors = false;
  bool get colors => _colors;
  set colors(bool _value) {
    _colors = _value;
  }

  String _selectedCartID = '';
  String get selectedCartID => _selectedCartID;
  set selectedCartID(String _value) {
    _selectedCartID = _value;
    prefs.setString('ff_selectedCartID', _value);
  }

  String _selectUserID = '';
  String get selectUserID => _selectUserID;
  set selectUserID(String _value) {
    _selectUserID = _value;
  }

  bool _isLooking = false;
  bool get isLooking => _isLooking;
  set isLooking(bool _value) {
    _isLooking = _value;
    prefs.setBool('ff_isLooking', _value);
  }

  String _hostID = '';
  String get hostID => _hostID;
  set hostID(String _value) {
    _hostID = _value;
    prefs.setString('ff_hostID', _value);
  }

  String _totalBookings = '';
  String get totalBookings => _totalBookings;
  set totalBookings(String _value) {
    _totalBookings = _value;
    prefs.setString('ff_totalBookings', _value);
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String _value) {
    _userID = _value;
    prefs.setString('ff_userID', _value);
  }

  String _numberOfActiveBookings = '';
  String get numberOfActiveBookings => _numberOfActiveBookings;
  set numberOfActiveBookings(String _value) {
    _numberOfActiveBookings = _value;
    prefs.setString('ff_numberOfActiveBookings', _value);
  }

  DateTime? _tripEndDate;
  DateTime? get tripEndDate => _tripEndDate;
  set tripEndDate(DateTime? _value) {
    _tripEndDate = _value;
    _value != null
        ? prefs.setInt('ff_tripEndDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_tripEndDate');
  }

  DateTime? _tripBeginDate;
  DateTime? get tripBeginDate => _tripBeginDate;
  set tripBeginDate(DateTime? _value) {
    _tripBeginDate = _value;
    _value != null
        ? prefs.setInt('ff_tripBeginDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_tripBeginDate');
  }

  String _tripID = '';
  String get tripID => _tripID;
  set tripID(String _value) {
    _tripID = _value;
    prefs.setString('ff_tripID', _value);
  }

  double _paymentAmount = 0.0;
  double get paymentAmount => _paymentAmount;
  set paymentAmount(double _value) {
    _paymentAmount = _value;
    prefs.setDouble('ff_paymentAmount', _value);
  }

  double _paymentFees = 0.0;
  double get paymentFees => _paymentFees;
  set paymentFees(double _value) {
    _paymentFees = _value;
    prefs.setDouble('ff_paymentFees', _value);
  }

  String _cartID = '';
  String get cartID => _cartID;
  set cartID(String _value) {
    _cartID = _value;
  }

  List<String> _selectedAmenities = [];
  List<String> get selectedAmenities => _selectedAmenities;
  set selectedAmenities(List<String> _value) {
    _selectedAmenities = _value;
  }

  void addToSelectedAmenities(String _value) {
    _selectedAmenities.add(_value);
  }

  void removeFromSelectedAmenities(String _value) {
    _selectedAmenities.remove(_value);
  }

  void removeAtIndexFromSelectedAmenities(int _index) {
    _selectedAmenities.removeAt(_index);
  }

  void updateSelectedAmenitiesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _selectedAmenities[_index] = updateFn(_selectedAmenities[_index]);
  }

  void insertAtIndexInSelectedAmenities(int _index, String _value) {
    _selectedAmenities.insert(_index, _value);
  }

  String _selectedAdditionalFees = '';
  String get selectedAdditionalFees => _selectedAdditionalFees;
  set selectedAdditionalFees(String _value) {
    _selectedAdditionalFees = _value;
    prefs.setString('ff_selectedAdditionalFees', _value);
  }

  double _selectedDiscount = 0.0;
  double get selectedDiscount => _selectedDiscount;
  set selectedDiscount(double _value) {
    _selectedDiscount = _value;
  }

  String _selectedHostID = '';
  String get selectedHostID => _selectedHostID;
  set selectedHostID(String _value) {
    _selectedHostID = _value;
  }

  String _selectedTripCost = '';
  String get selectedTripCost => _selectedTripCost;
  set selectedTripCost(String _value) {
    _selectedTripCost = _value;
  }

  String _selectedLocation = '';
  String get selectedLocation => _selectedLocation;
  set selectedLocation(String _value) {
    _selectedLocation = _value;
  }

  DateTime? _selectedTripEndDate;
  DateTime? get selectedTripEndDate => _selectedTripEndDate;
  set selectedTripEndDate(DateTime? _value) {
    _selectedTripEndDate = _value;
  }

  DateTime? _selectedTripBeginDate;
  DateTime? get selectedTripBeginDate => _selectedTripBeginDate;
  set selectedTripBeginDate(DateTime? _value) {
    _selectedTripBeginDate = _value;
  }

  String _bookingStatus = '';
  String get bookingStatus => _bookingStatus;
  set bookingStatus(String _value) {
    _bookingStatus = _value;
  }

  bool _isBooked = false;
  bool get isBooked => _isBooked;
  set isBooked(bool _value) {
    _isBooked = _value;
    prefs.setBool('ff_isBooked', _value);
  }

  int _numBookings = 0;
  int get numBookings => _numBookings;
  set numBookings(int _value) {
    _numBookings = _value;
    prefs.setInt('ff_numBookings', _value);
  }

  double _cartPrice = 0.0;
  double get cartPrice => _cartPrice;
  set cartPrice(double _value) {
    _cartPrice = _value;
  }

  double _cartCleanFee = 0.0;
  double get cartCleanFee => _cartCleanFee;
  set cartCleanFee(double _value) {
    _cartCleanFee = _value;
  }

  bool _dashType = false;
  bool get dashType => _dashType;
  set dashType(bool _value) {
    _dashType = _value;
    prefs.setBool('ff_dashType', _value);
  }

  bool _statusGo = false;
  bool get statusGo => _statusGo;
  set statusGo(bool _value) {
    _statusGo = _value;
    prefs.setBool('ff_statusGo', _value);
  }

  double _newBalance = 0.0;
  double get newBalance => _newBalance;
  set newBalance(double _value) {
    _newBalance = _value;
  }

  int _cartPricer = 0;
  int get cartPricer => _cartPricer;
  set cartPricer(int _value) {
    _cartPricer = _value;
    prefs.setInt('ff_cartPricer', _value);
  }

  bool _isbookedHost = false;
  bool get isbookedHost => _isbookedHost;
  set isbookedHost(bool _value) {
    _isbookedHost = _value;
  }

  bool _timerUp = false;
  bool get timerUp => _timerUp;
  set timerUp(bool _value) {
    _timerUp = _value;
    prefs.setBool('ff_timerUp', _value);
  }

  bool _ac = false;
  bool get ac => _ac;
  set ac(bool _value) {
    _ac = _value;
    prefs.setBool('ff_ac', _value);
  }

  bool _radio = false;
  bool get radio => _radio;
  set radio(bool _value) {
    _radio = _value;
  }

  bool _gps = false;
  bool get gps => _gps;
  set gps(bool _value) {
    _gps = _value;
    prefs.setBool('ff_gps', _value);
  }

  int _hoursMult = 0;
  int get hoursMult => _hoursMult;
  set hoursMult(int _value) {
    _hoursMult = _value;
  }

  bool _isScannedStart = false;
  bool get isScannedStart => _isScannedStart;
  set isScannedStart(bool _value) {
    _isScannedStart = _value;
    prefs.setBool('ff_isScannedStart', _value);
  }

  bool _isScannedStop = false;
  bool get isScannedStop => _isScannedStop;
  set isScannedStop(bool _value) {
    _isScannedStop = _value;
    prefs.setBool('ff_isScannedStop', _value);
  }

  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? _value) {
    _endTime = _value;
    _value != null
        ? prefs.setInt('ff_endTime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_endTime');
  }

  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? _value) {
    _startTime = _value;
    _value != null
        ? prefs.setInt('ff_startTime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_startTime');
  }

  List<DocumentReference> _cartlikes = [];
  List<DocumentReference> get cartlikes => _cartlikes;
  set cartlikes(List<DocumentReference> _value) {
    _cartlikes = _value;
    prefs.setStringList('ff_cartlikes', _value.map((x) => x.path).toList());
  }

  void addToCartlikes(DocumentReference _value) {
    _cartlikes.add(_value);
    prefs.setStringList('ff_cartlikes', _cartlikes.map((x) => x.path).toList());
  }

  void removeFromCartlikes(DocumentReference _value) {
    _cartlikes.remove(_value);
    prefs.setStringList('ff_cartlikes', _cartlikes.map((x) => x.path).toList());
  }

  void removeAtIndexFromCartlikes(int _index) {
    _cartlikes.removeAt(_index);
    prefs.setStringList('ff_cartlikes', _cartlikes.map((x) => x.path).toList());
  }

  void updateCartlikesAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cartlikes[_index] = updateFn(_cartlikes[_index]);
    prefs.setStringList('ff_cartlikes', _cartlikes.map((x) => x.path).toList());
  }

  void insertAtIndexInCartlikes(int _index, DocumentReference _value) {
    _cartlikes.insert(_index, _value);
    prefs.setStringList('ff_cartlikes', _cartlikes.map((x) => x.path).toList());
  }

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  set isFavorite(bool _value) {
    _isFavorite = _value;
  }

  DateTime? _expiration;
  DateTime? get expiration => _expiration;
  set expiration(DateTime? _value) {
    _expiration = _value;
  }

  List<DocumentReference> _selectedcarts = [];
  List<DocumentReference> get selectedcarts => _selectedcarts;
  set selectedcarts(List<DocumentReference> _value) {
    _selectedcarts = _value;
    prefs.setStringList('ff_selectedcarts', _value.map((x) => x.path).toList());
  }

  void addToSelectedcarts(DocumentReference _value) {
    _selectedcarts.add(_value);
    prefs.setStringList(
        'ff_selectedcarts', _selectedcarts.map((x) => x.path).toList());
  }

  void removeFromSelectedcarts(DocumentReference _value) {
    _selectedcarts.remove(_value);
    prefs.setStringList(
        'ff_selectedcarts', _selectedcarts.map((x) => x.path).toList());
  }

  void removeAtIndexFromSelectedcarts(int _index) {
    _selectedcarts.removeAt(_index);
    prefs.setStringList(
        'ff_selectedcarts', _selectedcarts.map((x) => x.path).toList());
  }

  void updateSelectedcartsAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedcarts[_index] = updateFn(_selectedcarts[_index]);
    prefs.setStringList(
        'ff_selectedcarts', _selectedcarts.map((x) => x.path).toList());
  }

  void insertAtIndexInSelectedcarts(int _index, DocumentReference _value) {
    _selectedcarts.insert(_index, _value);
    prefs.setStringList(
        'ff_selectedcarts', _selectedcarts.map((x) => x.path).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
