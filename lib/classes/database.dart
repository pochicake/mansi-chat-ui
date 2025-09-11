class AppDatabase {
  bool _isInit = false;

  void init() {
    if (_isInit) return;
    _isInit = true;
  }
}