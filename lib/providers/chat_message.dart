import 'package:flutter/material.dart';

class ChatMessage extends ChangeNotifier {
  final String role;
  ChatMessage({this.role = "user"});

  String _content = "";
  String get content => _content;

  bool _isTyping = true;
  bool get isTyping => _isTyping;

  bool isSent = false;

  updateContent(String msgContent) {
    _content = msgContent;
    notifyListeners();
  }

  addToken(String token) {
    _content += token;
    notifyListeners();
  }

  resend() {
    isSent = true;
    notifyListeners();
  }
}