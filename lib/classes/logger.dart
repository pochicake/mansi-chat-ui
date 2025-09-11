// Custom basic logging class with history

class Logger {
  static String _history = "";
  static String get history => _history;
  static final List<Function(String message)> _callbacks = [];

  static void write(String message) {
    final String msg = message;
    _history += msg;
    for (var callback in _callbacks) {
      callback(msg);
    }
  }

  static void writeLine(String message) {
    final String msg = "$message\n";
    _history += msg;
    for (var callback in _callbacks) {
      callback(msg);
    }
  }

  static void listen(Function(String message) callback) {
    _callbacks.add(callback);
  }
}