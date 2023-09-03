import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

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

  final _okokokManager = StreamRequestManager<List<CartsRecord>>();
  Stream<List<CartsRecord>> okokok({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CartsRecord>> Function() requestFn,
  }) =>
      _okokokManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOkokokCache() => _okokokManager.clear();
  void clearOkokokCacheKey(String? uniqueKey) =>
      _okokokManager.clearRequest(uniqueKey);
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
