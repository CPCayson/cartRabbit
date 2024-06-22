// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditCardStruct extends FFFirebaseStruct {
  CreditCardStruct({
    String? cards,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cards = cards,
        super(firestoreUtilData);

  // "cards" field.
  String? _cards;
  String get cards => _cards ?? '';
  set cards(String? val) => _cards = val;

  bool hasCards() => _cards != null;

  static CreditCardStruct fromMap(Map<String, dynamic> data) =>
      CreditCardStruct(
        cards: data['cards'] as String?,
      );

  static CreditCardStruct? maybeFromMap(dynamic data) => data is Map
      ? CreditCardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cards': _cards,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cards': serializeParam(
          _cards,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreditCardStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreditCardStruct(
        cards: deserializeParam(
          data['cards'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreditCardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreditCardStruct && cards == other.cards;
  }

  @override
  int get hashCode => const ListEquality().hash([cards]);
}

CreditCardStruct createCreditCardStruct({
  String? cards,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreditCardStruct(
      cards: cards,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreditCardStruct? updateCreditCardStruct(
  CreditCardStruct? creditCard, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creditCard
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreditCardStructData(
  Map<String, dynamic> firestoreData,
  CreditCardStruct? creditCard,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creditCard == null) {
    return;
  }
  if (creditCard.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creditCard.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creditCardData = getCreditCardFirestoreData(creditCard, forFieldValue);
  final nestedData = creditCardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creditCard.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreditCardFirestoreData(
  CreditCardStruct? creditCard, [
  bool forFieldValue = false,
]) {
  if (creditCard == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creditCard.toMap());

  // Add any Firestore field values
  creditCard.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreditCardListFirestoreData(
  List<CreditCardStruct>? creditCards,
) =>
    creditCards?.map((e) => getCreditCardFirestoreData(e, true)).toList() ?? [];
