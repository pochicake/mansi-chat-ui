import 'package:flutter/material.dart';
import 'package:mansi/ui/chat_view_content/get_started_section/conversation_starter_item.dart';

class GetStartedSection extends StatelessWidget {
  const GetStartedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to Mansi Chat UI! 🍋",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )
        ),
        Text("What should we start a conversation with?"),

        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            runSpacing: 5,
            children: [
              ConversationStarterItem(prompt: "Help me write a story about", title: "Creativity"),
              ConversationStarterItem(prompt: "I need help studying about", title: "Creativity"),
              ConversationStarterItem(prompt: "What are the recipes for", title: "Creativity"),
              ConversationStarterItem(prompt: "Tell me a random fact", title: "Creativity"),
            ],
          ),
        )
      ],
    );
  }
}