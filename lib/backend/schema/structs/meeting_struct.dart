// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeetingStruct extends FFFirebaseStruct {
  MeetingStruct({
    String? sub,
    Color? col,
    DateTime? start,
    DateTime? end,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sub = sub,
        _col = col,
        _start = start,
        _end = end,
        _id = id,
        super(firestoreUtilData);

  // "sub" field.
  String? _sub;
  String get sub => _sub ?? '';
  set sub(String? val) => _sub = val;
  bool hasSub() => _sub != null;

  // "col" field.
  Color? _col;
  Color get col => _col ?? const Color(0xFFFF0303);
  set col(Color? val) => _col = val;
  bool hasCol() => _col != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  set start(DateTime? val) => _start = val;
  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  set end(DateTime? val) => _end = val;
  bool hasEnd() => _end != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static MeetingStruct fromMap(Map<String, dynamic> data) => MeetingStruct(
        sub: data['sub'] as String?,
        col: getSchemaColor(data['col']),
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
        id: data['id'] as String?,
      );

  static MeetingStruct? maybeFromMap(dynamic data) =>
      data is Map ? MeetingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'sub': _sub,
        'col': _col,
        'start': _start,
        'end': _end,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sub': serializeParam(
          _sub,
          ParamType.String,
        ),
        'col': serializeParam(
          _col,
          ParamType.Color,
        ),
        'start': serializeParam(
          _start,
          ParamType.DateTime,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static MeetingStruct fromSerializableMap(Map<String, dynamic> data) =>
      MeetingStruct(
        sub: deserializeParam(
          data['sub'],
          ParamType.String,
          false,
        ),
        col: deserializeParam(
          data['col'],
          ParamType.Color,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.DateTime,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MeetingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MeetingStruct &&
        sub == other.sub &&
        col == other.col &&
        start == other.start &&
        end == other.end &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([sub, col, start, end, id]);
}

MeetingStruct createMeetingStruct({
  String? sub,
  Color? col,
  DateTime? start,
  DateTime? end,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MeetingStruct(
      sub: sub,
      col: col,
      start: start,
      end: end,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MeetingStruct? updateMeetingStruct(
  MeetingStruct? meeting, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meeting
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMeetingStructData(
  Map<String, dynamic> firestoreData,
  MeetingStruct? meeting,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meeting == null) {
    return;
  }
  if (meeting.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && meeting.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final meetingData = getMeetingFirestoreData(meeting, forFieldValue);
  final nestedData = meetingData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meeting.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMeetingFirestoreData(
  MeetingStruct? meeting, [
  bool forFieldValue = false,
]) {
  if (meeting == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meeting.toMap());

  // Add any Firestore field values
  meeting.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMeetingListFirestoreData(
  List<MeetingStruct>? meetings,
) =>
    meetings?.map((e) => getMeetingFirestoreData(e, true)).toList() ?? [];
