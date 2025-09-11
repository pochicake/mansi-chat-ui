import 'package:flutter/material.dart';

class ChatSession extends ChangeNotifier {
  /// Stores all message history of the chat session
  List<String> get messages => _msgs;

  /// Allow manipulating assistant's messages.
  bool adminMode = false;

  /// If set, password protection is assumed enabled.
  String? passphraseHash;

  /// Enables searching on the internet.
  bool searchFeature = false;

  /// Optionally sets prompt instructions to the model
  String? promptInstructions;

  /// Sets the temperature of the model inference.
  double temperature = 0.7;

  /// Enables streaming messages or acquire entire message once.
  bool streaming = true;

  List<String> _msgs = [];

  void addMessage(String msg) {
    _msgs.add(msg);
    notifyListeners();
  }

  void deleteMessage(int index) {
    _msgs.removeAt(index);
    notifyListeners();
  }
}