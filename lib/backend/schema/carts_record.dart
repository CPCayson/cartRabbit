import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartsRecord extends FirestoreRecord {
  CartsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hostRef" field.
  DocumentReference? _hostRef;
  DocumentReference? get hostRef => _hostRef;
  bool hasHostRef() => _hostRef != null;

  // "cartID" field.
  String? _cartID;
  String get cartID => _cartID ?? '';
  bool hasCartID() => _cartID != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  bool hasIsAvailable() => _isAvailable != null;

  // "cartImage" field.
  String? _cartImage;
  String get cartImage => _cartImage ?? '';
  bool hasCartImage() => _cartImage != null;

  // "cartLoc" field.
  LatLng? _cartLoc;
  LatLng? get cartLoc => _cartLoc;
  bool hasCartLoc() => _cartLoc != null;

  // "ammenities" field.
  List<String>? _ammenities;
  List<String> get ammenities => _ammenities ?? const [];
  bool hasAmmenities() => _ammenities != null;

  // "cartPricer" field.
  int? _cartPricer;
  int get cartPricer => _cartPricer ?? 0;
  bool hasCartPricer() => _cartPricer != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "ownersName" field.
  String? _ownersName;
  String get ownersName => _ownersName ?? '';
  bool hasOwnersName() => _ownersName != null;

  // "plateNumber" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  bool hasPlateNumber() => _plateNumber != null;

  // "insuranceNumber" field.
  String? _insuranceNumber;
  String get insuranceNumber => _insuranceNumber ?? '';
  bool hasInsuranceNumber() => _insuranceNumber != null;

  // "isSigned" field.
  bool? _isSigned;
  bool get isSigned => _isSigned ?? false;
  bool hasIsSigned() => _isSigned != null;

  // "isBooked" field.
  bool? _isBooked;
  bool get isBooked => _isBooked ?? false;
  bool hasIsBooked() => _isBooked != null;

  void _initializeFields() {
    _hostRef = snapshotData['hostRef'] as DocumentReference?;
    _cartID = snapshotData['cartID'] as String?;
    _name = snapshotData['name'] as String?;
    _isAvailable = snapshotData['isAvailable'] as bool?;
    _cartImage = snapshotData['cartImage'] as String?;
    _cartLoc = snapshotData['cartLoc'] as LatLng?;
    _ammenities = getDataList(snapshotData['ammenities']);
    _cartPricer = castToType<int>(snapshotData['cartPricer']);
    _photos = getDataList(snapshotData['photos']);
    _description = snapshotData['description'] as String?;
    _ownersName = snapshotData['ownersName'] as String?;
    _plateNumber = snapshotData['plateNumber'] as String?;
    _insuranceNumber = snapshotData['insuranceNumber'] as String?;
    _isSigned = snapshotData['isSigned'] as bool?;
    _isBooked = snapshotData['isBooked'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Carts');

  static Stream<CartsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartsRecord.fromSnapshot(s));

  static Future<CartsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartsRecord.fromSnapshot(s));

  static CartsRecord fromSnapshot(DocumentSnapshot snapshot) => CartsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartsRecordData({
  DocumentReference? hostRef,
  String? cartID,
  String? name,
  bool? isAvailable,
  String? cartImage,
  LatLng? cartLoc,
  int? cartPricer,
  String? description,
  String? ownersName,
  String? plateNumber,
  String? insuranceNumber,
  bool? isSigned,
  bool? isBooked,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hostRef': hostRef,
      'cartID': cartID,
      'name': name,
      'isAvailable': isAvailable,
      'cartImage': cartImage,
      'cartLoc': cartLoc,
      'cartPricer': cartPricer,
      'description': description,
      'ownersName': ownersName,
      'plateNumber': plateNumber,
      'insuranceNumber': insuranceNumber,
      'isSigned': isSigned,
      'isBooked': isBooked,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartsRecordDocumentEquality implements Equality<CartsRecord> {
  const CartsRecordDocumentEquality();

  @override
  bool equals(CartsRecord? e1, CartsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.hostRef == e2?.hostRef &&
        e1?.cartID == e2?.cartID &&
        e1?.name == e2?.name &&
        e1?.isAvailable == e2?.isAvailable &&
        e1?.cartImage == e2?.cartImage &&
        e1?.cartLoc == e2?.cartLoc &&
        listEquality.equals(e1?.ammenities, e2?.ammenities) &&
        e1?.cartPricer == e2?.cartPricer &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.description == e2?.description &&
        e1?.ownersName == e2?.ownersName &&
        e1?.plateNumber == e2?.plateNumber &&
        e1?.insuranceNumber == e2?.insuranceNumber &&
        e1?.isSigned == e2?.isSigned &&
        e1?.isBooked == e2?.isBooked;
  }

  @override
  int hash(CartsRecord? e) => const ListEquality().hash([
        e?.hostRef,
        e?.cartID,
        e?.name,
        e?.isAvailable,
        e?.cartImage,
        e?.cartLoc,
        e?.ammenities,
        e?.cartPricer,
        e?.photos,
        e?.description,
        e?.ownersName,
        e?.plateNumber,
        e?.insuranceNumber,
        e?.isSigned,
        e?.isBooked
      ]);

  @override
  bool isValidKey(Object? o) => o is CartsRecord;
}
