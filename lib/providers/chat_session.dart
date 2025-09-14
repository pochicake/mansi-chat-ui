import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mansi/classes/ai_providers/ai_provider.dart';
import 'package:mansi/classes/ai_providers/pollinations.ai.dart';
import 'package:mansi/classes/logger.dart';
import 'package:mansi/providers/chat_message.dart';
import 'package:http/http.dart' as http;

class ChatSessionProvider extends ChangeNotifier {
  /// Stores all message history of the chat session
  List<ChatMessage> get messages => _msgs;

  /// Allow manipulating assistant's messages.
  bool adminMode = false;

  /// If set, password protection is assumed enabled.
  String? passphraseHash;

  /// Enables searching on the internet.
  bool searchFeature = false;

  /// Optionally sets instructions to the model
  String? systemPrompt;

  /// Sets the temperature of the model inference.
  double temperature = 0.7;

  /// Enables streaming messages or acquire entire message once.
  bool streaming = true;

  /// Automatically set in every new topic.
  String? topicTitle;

  /// The name of the model provided by the service
  // String modelName = "mistral";
  String modelName = "gemini";

  /// The name of the provider
  AIProvider provider = PollinationsAI();

  List<ChatMessage> _msgs = [];

  /// Models that were previously used on this conversation. Useful to check what model was used that is no longer available or offered bt the provider.
  List<String> usedModels = [];

  /// Enables users to selectively keep conversations to avoid cluttering their conversation history list (sidebar).
  bool isSaved = false;

  bool _finishedResponding = true;
  bool get finishedResponding => _finishedResponding;

  void addMessage(ChatMessage msg) {
    msg.setLoadingStatus(false);
    _msgs.add(msg);

    // inference
    _finishedResponding = false;
    notifyListeners();
      
    ChatMessage assistantResponse = ChatMessage(
      role: "assistant",
      content: "",
    );

    _msgs.add(assistantResponse);

    provider.inference(
      model: modelName,
      // model:"mistral",
      messages: _msgs,
      systemPrompt: systemPrompt,
      callback: (token) {
        // if (!_msgs.contains(assistantResponse)) {
        //   _msgs.add(assistantResponse);
        //   return;
        // }
        if (assistantResponse.isLoading && assistantResponse.content.isNotEmpty) {
          // Hide loading UI now
          assistantResponse.setLoadingStatus(false);
        }

        assistantResponse.addContentChunk(token);
        notifyListeners();
      },
      onDone: () {
        // summarize title

        if (topicTitle == null && _msgs.length <= 2) {
          Logger.writeLine("Generating topic title...");
          var prompt = """Summarize the following conversation into a concise topic title.
          Without Markdown, Respond only in strict raw JSON format like this: {'title': ''}.

          Conversation:\n""";

          for (var line in _msgs.where((msg) => msg.role != "system")) {
            prompt += "${line.content}\n";
          }

          var m = ChatMessage(
            role: "user",
            content: prompt,
          );
          
          var _topicTitle = "";

          provider.inference(
            messages: [
              m,
            ],
            model: modelName,
            callback: (token) => _topicTitle += token,
            onDone: () {
              try {
                var _titleObj = jsonDecode(_topicTitle.trim());
                var _title = _titleObj['title'];
                Logger.writeLine("Topic title: $_title");
                topicTitle = _title;
                notifyListeners();
              } catch (e) {
                Logger.writeLine("Failed to get topic title!");
                Logger.writeLine("Raw JSON: $_topicTitle");
              }
              m.dispose();
            },
            onError: (e) {
              m.dispose();
            },
          );
        }
      }
    );
  }

  void deleteMessage(int index) {
    _msgs.removeAt(index);
    notifyListeners();
  }
}