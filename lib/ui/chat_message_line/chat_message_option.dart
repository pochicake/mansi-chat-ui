import 'package:flutter/material.dart';

class ChatMessageOption extends StatefulWidget {
  final IconData icon;
  final Function()? onTap;
  const ChatMessageOption({super.key, required this.icon, this.onTap});

  @override
  State<ChatMessageOption> createState() => _ChatMessageOptionState();
}

class _ChatMessageOptionState extends State<ChatMessageOption> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            color: _hovered ? Colors.grey.shade300 : Colors.transparent,
          ),
          child: Icon(
            widget.icon,
            color: Colors.grey,
            size: 18,
          ),
        ),
      ),
    );
  }
}