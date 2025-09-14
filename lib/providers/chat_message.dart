import 'package:flutter/material.dart';
import 'package:mansi/classes/error_data.dart';

class ChatMessage extends ChangeNotifier {
  final String role;
  String content;

  ChatMessage({this.role = "user", this.content = ""});

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool isSent = false;

  ErrorData? error;

  setLoadingStatus(bool status) {
    _isLoading = false;
    notifyListeners();
  }

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

  setError(ErrorData errorData) {
    error = errorData;
    notifyListeners();
  }
}