import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  final Color color;
  final String text;
  final IconData icon;
  const SimpleButton({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
  });

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _hovered = true),
        onExit: (event) => setState(() => _hovered = false),
        child: Container(
          padding: const EdgeInsets.all(4),
          constraints: BoxConstraints(
            minHeight: 40,
          ),
          decoration: BoxDecoration(
            // color: widget.color,
            border: Border.all(
              color: widget.color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              // icon
              Icon(
                widget.icon,
                color: widget.color,
              ),
        
              // text
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}