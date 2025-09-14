import 'package:mansi/providers/chat_message.dart';

abstract class AIProvider {
  final String name = "";
  void inference({
    /// All messages to be processed, *including* the prompt instructions, if available.
    required List<ChatMessage> messages,

    /// Optionally sets instructions to the model
    String? systemPrompt,

    /// Name of the model provided by the service.
    required String model,

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
  }) async {}
}