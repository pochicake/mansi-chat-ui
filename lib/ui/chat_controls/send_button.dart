import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SendButton extends StatefulWidget {
  final bool shown;
  final bool isStop;
  final Function() onTap;
  const SendButton({super.key, required this.shown, required this.onTap, this.isStop = false});

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.shown,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        opacity: !widget.shown ? 0 : 1,
        child: GestureDetector(
          onTap: widget.onTap,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(10000),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black.withValues(alpha: 0.2),
                    offset: Offset(0, 3),
                  ),
                ]
              ),
              child: Icon(
                // Icons.arrow_circle_right,
                // widget.isStop ? Icons.stop_circle : Icons.arrow_circle_right,
                widget.isStop ? Icons.stop : Icons.arrow_right_rounded,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}