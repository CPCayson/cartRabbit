import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "productType" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  // "productPrice" field.
  double? _productPrice;
  double get productPrice => _productPrice ?? 0.0;
  bool hasProductPrice() => _productPrice != null;

  void _initializeFields() {
    _productId = snapshotData['productId'] as String?;
    _productName = snapshotData['productName'] as String?;
    _productType = snapshotData['productType'] as String?;
    _productPrice = castToType<double>(snapshotData['productPrice']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productId,
  String? productName,
  String? productType,
  double? productPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productType': productType,
      'productPrice': productPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.productId == e2?.productId &&
        e1?.productName == e2?.productName &&
        e1?.productType == e2?.productType &&
        e1?.productPrice == e2?.productPrice;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality()
      .hash([e?.productId, e?.productName, e?.productType, e?.productPrice]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
