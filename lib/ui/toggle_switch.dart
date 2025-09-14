import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    final double size = 20;
    final double length = 36;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _enabled = !_enabled),
        child: SizedBox(
          width: length,
          height: size,
          child: Stack(
            children: [
              // frame
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10000),
                  color: _enabled ? Colors.amber.shade100 : Colors.grey.shade300,
                  border: Border.all(
                    // color: _enabled ? Colors.amber.shade900 : Colors.grey.shade500,
                    color: Colors.black.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
              ),
        
              // button
              AnimatedPositioned(
                top: size * 0.8 / 8,
                left: _enabled ? length - size + (size * 0.8 / 8) : size * 0.8 / 8,
                duration: const Duration(milliseconds: 200),
                curve: Curves.decelerate,
                child: AnimatedContainer(
                  width: size * 0.8,
                  height: size * 0.8,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.decelerate,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10000),
                    color: _enabled ? Colors.amberAccent.shade700 : Colors.grey,
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