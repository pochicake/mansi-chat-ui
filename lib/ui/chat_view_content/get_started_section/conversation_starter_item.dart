import 'package:flutter/material.dart';

class ConversationStarterItem extends StatefulWidget {
  final String title;
  final String prompt;
  const ConversationStarterItem({super.key, required this.prompt, required this.title});

  @override
  State<ConversationStarterItem> createState() => _ConversationStarterItemState();
}

class _ConversationStarterItemState extends State<ConversationStarterItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() => _hovered = true),
      onExit: (event) => setState(() => _hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        scale: _hovered ? 1.02 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 239, 156),
            borderRadius: BorderRadiusGeometry.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: _hovered ? Colors.black.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0),
                offset: Offset(0, 3),
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.prompt,
                style: TextStyle(
                  fontSize: 18,
                )
              ),

              const SizedBox(height:4),
        
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 172, 55).withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}