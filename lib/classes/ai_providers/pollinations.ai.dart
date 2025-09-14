import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mansi/classes/ai_providers/ai_provider.dart';
import 'package:mansi/classes/logger.dart';
import 'package:mansi/providers/chat_message.dart';

class PollinationsAI extends AIProvider {
  @override
  String get name => "pollinations.ai";

  static final String domain = "pollinations.ai";
  static Future<Map<String, dynamic>> getModels() async {
    return {};
  }

  /// Sends messages to the server for inference
  @override
  void inference({
    /// All messages to be processed, *including* the prompt instructions, if available.
    required List<ChatMessage> messages,

    /// Name of the model provided by the service.
    required String model,

    /// Optionally sets instructions to the model
    String? systemPrompt,

    /// Sets the temperature of the model inference.
    double temperature = 0.7,

    /// Enables streaming messages or acquire entire message once.
    bool streaming = true,

    /// Returns tokens individually otherwise full message if non-streaming.
    Function(String token)? callback,

    /// Called when the inference is finished
    Function()? onDone,

    /// Called the was an error while inferencing
    Function(dynamic error)? onError,
  }) async {
    (() async {
      Logger.writeLine("Creating server request...");
      final body = jsonEncode({
        "temperature":temperature,
        "model":model,
        "stream":streaming,
        "private": true,
        "messages": [
          if (systemPrompt != null) {
            "role":"system",
            "content":systemPrompt
          },
          ...messages.map((cm) => {
            "role":cm.role,
            "content":cm.content,
          })
        ]
      });

      // print(body);

      // return;
      final client = http.Client();
      final request = http.Request("POST", Uri.parse("https://text.pollinations.ai/"))
        ..headers['Content-Type'] = 'application/json'
        ..body = body;

      Logger.writeLine("Sending server request...");
      var response;

      try {
        response = await client.send(request);
      } catch (e) {
        if (onError != null) onError(e);
        return;
      }

      Logger.writeLine("Waiting for server response...");

      if (response.statusCode != 200) {
        Logger.writeLine("Error ${response.statusCode}: ${response.reasonPhrase}");
        return;
      }

      // ChatMessage assistantResponse = ChatMessage(
      //   role: "assistant",
      //   content: "",
      // );

      // messages.add(assistantResponse);

      response.stream
      .transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((chunk) {
        if (chunk.isEmpty) return;

        var sub = chunk.substring(5);

        if (sub.trim() == "[DONE]") return;

        final chunkObj = jsonDecode(sub);
        final content = chunkObj['choices'][0]['delta']['content'];

        if (content == null) return;

        // print(content);

        // assistantResponse.addContentChunk(content);
        if (callback != null) callback(content);
      }, onDone: () {
        Logger.writeLine("Server response finished!");
        if (onDone != null) onDone();
      }, onError: (e) {
        Logger.writeLine("Server error! $e");
        if (onError != null) onError(e);
      });
    })();
  }
}