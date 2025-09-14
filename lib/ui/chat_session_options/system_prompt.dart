import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SystemPrompt extends StatefulWidget {
  const SystemPrompt({super.key});

  @override
  State<SystemPrompt> createState() => _SystemPromptState();
}

class _SystemPromptState extends State<SystemPrompt> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _fn = FocusNode();

  @override
  void initState() {
    super.initState();

    if (context.read<AppProvider>().activeChatSession != null) {
      _controller.text = context.read<AppProvider>().activeChatSession!.systemPrompt ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.amber.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: EditableText(
        controller: _controller,
        focusNode: _fn,
        style: TextStyle(
          color: Colors.grey.shade900,
          fontSize: 12,
        ),
        cursorColor: Colors.black,
        backgroundCursorColor: Colors.black,
        selectionColor: Colors.amber.shade200,
        onChanged: (value) {
          if (context.read<AppProvider>().activeChatSession != null) context.read<AppProvider>().activeChatSession!.systemPrompt = _controller.text;
        },
      ),
    );
  }
}