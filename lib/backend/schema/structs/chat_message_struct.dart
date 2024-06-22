// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends FFFirebaseStruct {
  ChatMessageStruct({
    String? user,
    String? chat,
    String? text,
    String? image,
    DateTime? timestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _user = user,
        _chat = chat,
        _text = text,
        _image = image,
        _timestamp = timestamp,
        super(firestoreUtilData);

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  set user(String? val) => _user = val;

  bool hasUser() => _user != null;

  // "chat" field.
  String? _chat;
  String get chat => _chat ?? '';
  set chat(String? val) => _chat = val;

  bool hasChat() => _chat != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        user: data['user'] as String?,
        chat: data['chat'] as String?,
        text: data['text'] as String?,
        image: data['image'] as String?,
        timestamp: data['timestamp'] as DateTime?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user': _user,
        'chat': _chat,
        'text': _text,
        'image': _image,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user': serializeParam(
          _user,
          ParamType.String,
        ),
        'chat': serializeParam(
          _chat,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        user: deserializeParam(
          data['user'],
          ParamType.String,
          false,
        ),
        chat: deserializeParam(
          data['chat'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        user == other.user &&
        chat == other.chat &&
        text == other.text &&
        image == other.image &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([user, chat, text, image, timestamp]);
}

ChatMessageStruct createChatMessageStruct({
  String? user,
  String? chat,
  String? text,
  String? image,
  DateTime? timestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessageStruct(
      user: user,
      chat: chat,
      text: text,
      image: image,
      timestamp: timestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessageStruct? updateChatMessageStruct(
  ChatMessageStruct? chatMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessageStructData(
  Map<String, dynamic> firestoreData,
  ChatMessageStruct? chatMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessage == null) {
    return;
  }
  if (chatMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessageData =
      getChatMessageFirestoreData(chatMessage, forFieldValue);
  final nestedData =
      chatMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessageFirestoreData(
  ChatMessageStruct? chatMessage, [
  bool forFieldValue = false,
]) {
  if (chatMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessage.toMap());

  // Add any Firestore field values
  chatMessage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessageListFirestoreData(
  List<ChatMessageStruct>? chatMessages,
) =>
    chatMessages?.map((e) => getChatMessageFirestoreData(e, true)).toList() ??
    [];
