import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/ui/chat_session_options/chat_session_options.dart';
import 'package:provider/provider.dart';

class ChatSessionTitle extends StatefulWidget {
  const ChatSessionTitle({super.key});

  @override
  State<ChatSessionTitle> createState() => _ChatSessionTitleState();
}

class _ChatSessionTitleState extends State<ChatSessionTitle> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _hovered = true),
        onExit: (event) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () => showDialog(context: context, builder: (context) => ChatSessionOptions()),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _hovered ? Colors.amber.withValues(alpha: 0.3) : Colors.amber.withValues(alpha: 0),
            ),
            child: Text(
              context.watch<AppProvider>().activeChatSession?.topicTitle ?? "New conversation",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              )
            ),
          ),
        ),
      ),
    );
  }
}