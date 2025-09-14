class MessageData {
  final String role;
  final String content;
  final List<String> editHistory;
  late final DateTime dateSent;
  MessageData(this.role, this.content, {this.editHistory = const []}) {
    dateSent = DateTime.now();
  }
}