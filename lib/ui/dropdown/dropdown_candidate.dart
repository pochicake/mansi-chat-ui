import 'package:flutter/material.dart';

class DropDownCandidate extends StatefulWidget {
  final String candidate;
  const DropDownCandidate({super.key, required this.candidate});

  @override
  State<DropDownCandidate> createState() => _DropDownCandidateState();
}

class _DropDownCandidateState extends State<DropDownCandidate> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: MouseRegion(
        onEnter: (event) => setState(() => _hovered = true),
        onExit: (event) => setState(() => _hovered = false),
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: _hovered ? Colors.amber.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            maxHeight: 200,
          ),
          child: Text(
            widget.candidate,
          )
        ),
      ),
    );
  }
}