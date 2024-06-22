// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    String? userA,
    String? userB,
    String? lastMessage,
    DateTime? lastMessageTime,
    String? lastMessageSentBy,
    List<DocumentReference>? users,
    List<DocumentReference>? lastMessageSeenBy,
    int? chatId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userA = userA,
        _userB = userB,
        _lastMessage = lastMessage,
        _lastMessageTime = lastMessageTime,
        _lastMessageSentBy = lastMessageSentBy,
        _users = users,
        _lastMessageSeenBy = lastMessageSeenBy,
        _chatId = chatId,
        super(firestoreUtilData);

  // "user_a" field.
  String? _userA;
  String get userA => _userA ?? '';
  set userA(String? val) => _userA = val;

  bool hasUserA() => _userA != null;

  // "user_b" field.
  String? _userB;
  String get userB => _userB ?? '';
  set userB(String? val) => _userB = val;

  bool hasUserB() => _userB != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;

  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  set lastMessageTime(DateTime? val) => _lastMessageTime = val;

  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sent_by" field.
  String? _lastMessageSentBy;
  String get lastMessageSentBy => _lastMessageSentBy ?? '';
  set lastMessageSentBy(String? val) => _lastMessageSentBy = val;

  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  set users(List<DocumentReference>? val) => _users = val;

  void updateUsers(Function(List<DocumentReference>) updateFn) {
    updateFn(users ??= []);
  }

  bool hasUsers() => _users != null;

  // "last_message_seen_by" field.
  List<DocumentReference>? _lastMessageSeenBy;
  List<DocumentReference> get lastMessageSeenBy =>
      _lastMessageSeenBy ?? const [];
  set lastMessageSeenBy(List<DocumentReference>? val) =>
      _lastMessageSeenBy = val;

  void updateLastMessageSeenBy(Function(List<DocumentReference>) updateFn) {
    updateFn(lastMessageSeenBy ??= []);
  }

  bool hasLastMessageSeenBy() => _lastMessageSeenBy != null;

  // "chat_id" field.
  int? _chatId;
  int get chatId => _chatId ?? 0;
  set chatId(int? val) => _chatId = val;

  void incrementChatId(int amount) => chatId = chatId + amount;

  bool hasChatId() => _chatId != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        userA: data['user_a'] as String?,
        userB: data['user_b'] as String?,
        lastMessage: data['last_message'] as String?,
        lastMessageTime: data['last_message_time'] as DateTime?,
        lastMessageSentBy: data['last_message_sent_by'] as String?,
        users: getDataList(data['users']),
        lastMessageSeenBy: getDataList(data['last_message_seen_by']),
        chatId: castToType<int>(data['chat_id']),
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_a': _userA,
        'user_b': _userB,
        'last_message': _lastMessage,
        'last_message_time': _lastMessageTime,
        'last_message_sent_by': _lastMessageSentBy,
        'users': _users,
        'last_message_seen_by': _lastMessageSeenBy,
        'chat_id': _chatId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_a': serializeParam(
          _userA,
          ParamType.String,
        ),
        'user_b': serializeParam(
          _userB,
          ParamType.String,
        ),
        'last_message': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'last_message_time': serializeParam(
          _lastMessageTime,
          ParamType.DateTime,
        ),
        'last_message_sent_by': serializeParam(
          _lastMessageSentBy,
          ParamType.String,
        ),
        'users': serializeParam(
          _users,
          ParamType.DocumentReference,
          isList: true,
        ),
        'last_message_seen_by': serializeParam(
          _lastMessageSeenBy,
          ParamType.DocumentReference,
          isList: true,
        ),
        'chat_id': serializeParam(
          _chatId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        userA: deserializeParam(
          data['user_a'],
          ParamType.String,
          false,
        ),
        userB: deserializeParam(
          data['user_b'],
          ParamType.String,
          false,
        ),
        lastMessage: deserializeParam(
          data['last_message'],
          ParamType.String,
          false,
        ),
        lastMessageTime: deserializeParam(
          data['last_message_time'],
          ParamType.DateTime,
          false,
        ),
        lastMessageSentBy: deserializeParam(
          data['last_message_sent_by'],
          ParamType.String,
          false,
        ),
        users: deserializeParam<DocumentReference>(
          data['users'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        lastMessageSeenBy: deserializeParam<DocumentReference>(
          data['last_message_seen_by'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        chatId: deserializeParam(
          data['chat_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatStruct &&
        userA == other.userA &&
        userB == other.userB &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        lastMessageSentBy == other.lastMessageSentBy &&
        listEquality.equals(users, other.users) &&
        listEquality.equals(lastMessageSeenBy, other.lastMessageSeenBy) &&
        chatId == other.chatId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userA,
        userB,
        lastMessage,
        lastMessageTime,
        lastMessageSentBy,
        users,
        lastMessageSeenBy,
        chatId
      ]);
}

ChatStruct createChatStruct({
  String? userA,
  String? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  String? lastMessageSentBy,
  int? chatId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      userA: userA,
      userB: userB,
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      lastMessageSentBy: lastMessageSentBy,
      chatId: chatId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  chat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
