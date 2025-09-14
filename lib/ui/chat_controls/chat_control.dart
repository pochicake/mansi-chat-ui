import 'package:flutter/material.dart';

class ChatControl extends StatefulWidget {
  final IconData icon;
  const ChatControl({super.key, required this.icon});

  @override
  State<ChatControl> createState() => _ChatControlState();
}

class _ChatControlState extends State<ChatControl> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: MouseRegion(
        onEnter: (event) => setState(() => _hovered = true),
        onExit: (event) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Icon(
            widget.icon,
            color: _hovered ? Colors.grey.shade600 : Colors.grey.shade700,
            size: 20,
          ),
        ),
      ),
    );
  }
}