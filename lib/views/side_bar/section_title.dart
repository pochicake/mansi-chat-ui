import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}