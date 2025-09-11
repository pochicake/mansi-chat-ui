import '../enums/theme_mode.dart';

class AppSettings {
  bool _isInit = false;
  static final List<String> supportedProviders = [
    "pollinations.ai",
    "openrouter",
    "openai",
    "ollama"
  ];

  void init() {
    if (_isInit) return;
    _isInit = true;
  }

  ThemeMode themeMode = ThemeMode.system;
}