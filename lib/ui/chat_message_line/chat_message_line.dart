import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/chat_message.dart';
import 'package:mansi/ui/chat_message.dart';
import 'package:mansi/ui/chat_message_line/chat_message_option.dart';

class ChatMessageLine extends StatefulWidget {
  final ChatMessage data;
  const ChatMessageLine({super.key, required this.data});

  @override
  State<ChatMessageLine> createState() => _ChatMessageLineState();
}

class _ChatMessageLineState extends State<ChatMessageLine> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Widget options = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: IgnorePointer(
        ignoring: !_hovered,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _hovered ? 1 : 0,
          curve: Curves.decelerate,
          child: Row(
            spacing: 4,
            children: [
              ChatMessageOption(
                icon: Icons.edit,
              ),

              ChatMessageOption(
                icon: Icons.more_horiz,
              ),
            ],
          ),
        ),
      ),
    );

    return MouseRegion(
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: Row(
        children: [
          if (widget.data.role == "user") const Spacer(),
      
          // message options (Desktop)
          if (!Platform.isAndroid && !Platform.isIOS && widget.data.role == "user") options,
      
          ChatMessageUI(
            data: widget.data,
          ),
      
          // message options (Desktop)
          if (!Platform.isAndroid && !Platform.isIOS && widget.data.role == "assistant") options,
          
      
          if (widget.data.role == "assistant") const Spacer(),
          
        ],
      ),
    );
  }
}