import 'package:flutter/material.dart';

class ChatMessage extends ChangeNotifier {
  final String role;
  String content;

  ChatMessage({this.role = "user", this.content = ""});

  bool _isTyping = true;
  bool get isTyping => _isTyping;

  bool isSent = false;

  updateContent(String msgContent) {
    content = msgContent;
    notifyListeners();
  }

  addContentChunk(String chunk) {
    content += chunk;
    notifyListeners();
  }

  addToken(String token) {
    content += token;
    notifyListeners();
  }

  resend() {
    isSent = true;
    notifyListeners();
  }
}