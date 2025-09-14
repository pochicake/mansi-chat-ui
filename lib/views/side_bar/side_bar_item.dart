import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SideBarItem extends StatefulWidget {
  final String text;
  final bool isActive;
  const SideBarItem({super.key, required this.text, this.isActive = false});

  @override
  State<SideBarItem> createState() => _SideBarItemState();
}

class _SideBarItemState extends State<SideBarItem> {
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
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: widget.isActive ? Colors.amber.shade100 : !_hovered ? Colors.amber.shade100.withValues(alpha: 0) : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.text,
          ),
        ),
      ),
    );
  }
}