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
            fontSize: 24,
            fontWeight: FontWeight.w600,
          )
        ),
        Text(
          "What should we start a conversation with?",
          style: TextStyle(
            fontSize: 16,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
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