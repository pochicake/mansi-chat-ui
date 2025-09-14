import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatUserTextbox extends StatefulWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;
  const ChatUserTextbox({super.key, required this.controller, this.onChanged});

  @override
  State<ChatUserTextbox> createState() => _ChatUserTextboxState();
}

class _ChatUserTextboxState extends State<ChatUserTextbox> {
  final FocusNode _fn = FocusNode();
  final TextStyle _ts = TextStyle(
    fontSize: 13,
    color: Colors.grey.shade900,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // text input
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: EditableText(
            controller: widget.controller,
            focusNode: _fn,
            style: _ts,
            cursorColor: Colors.amber.shade900,
            backgroundCursorColor: Colors.amber.shade900,
            selectionColor: Colors.amber.shade300,
            onChanged: (value) => setState(() {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            }),
            cursorWidth: 1.5,
            enableInteractiveSelection: true,
            enableSuggestions: true,
            autocorrect: true,
            cursorOpacityAnimates: true,
            enableIMEPersonalizedLearning: true,
            expands: true,
            maxLines: null,
            minLines: null,
            cursorHeight: 14,
          ),
        ),
    
        // placeholder
        if (widget.controller.text.isEmpty) IgnorePointer(
          child: Text(
            "Ask me anything!",
            textAlign: TextAlign.center,
            style: _ts.apply(
              color: Colors.grey.shade500,
            ),
          ),
        )
      ],
    );
  }
}