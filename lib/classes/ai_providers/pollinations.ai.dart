class PollinationsAI {
  static final String domain = "pollinations.ai";
  static Future<Map<String, dynamic>> getModels() async {
    return {};
  }

  /// Sends messages to the server and waits until it finishes
  static void inference({
    /// All messages to be processed, *including* the prompt instructions, if available.
    required List<String> messages,

    /// Name of the model provided by the service.
    required String model,
    double temperature = 0.7,
    bool streaming = true,

    /// Returns tokens individually otherwise full message if non-streaming.
    Function(String token)? callback,
  }) async {

  }
}