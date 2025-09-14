import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/providers/chat_session.dart';
import 'package:mansi/providers/chat_message.dart';
import 'package:mansi/ui/chat_message_line/chat_message_line.dart';
import 'package:mansi/ui/chat_view_content/get_started_section/get_started_section.dart';
import 'package:provider/provider.dart';

class ChatViewContent extends StatelessWidget {
  final List<ChatMessage> data;
  const ChatViewContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.watch<AppProvider>().activeChatSession,
      child: Consumer<ChatSessionProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ChatMessageLine(
            data: data[index],
          ),
        ),
      ),
    );
  }
}