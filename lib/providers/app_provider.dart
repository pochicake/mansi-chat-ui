import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/chat_session.dart';
import 'package:mansi/providers/chat_message.dart';

class AppProvider extends ChangeNotifier {
  ChatSessionProvider? get activeChatSession => _activeIndex < 0 ? null : chats[_activeIndex];
  String defaultSystemInstruction = "You are a friendly AI.";
  int _activeIndex = -1;

  List<ChatSessionProvider> chats = [
    // ChatSessionProvider()
    //   ..addMessage(ChatMessage(role:"system", content:"You are a friendly AI."))
    //   ..addMessage(ChatMessage(role:"user", content:"Hello."))
    //   ..addMessage(ChatMessage(role:"assistant", content:"Hi! What can i do for you?")),
  ];

  setActiveChatSession(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  /// Creates new chat session and automatically sets it as active chat session
  newChatSession() {
    ChatSessionProvider csp = ChatSessionProvider();
    chats.add(csp);

    // set to active
    _activeIndex = chats.indexOf(csp);

    notifyListeners();
    return csp;
  }
}