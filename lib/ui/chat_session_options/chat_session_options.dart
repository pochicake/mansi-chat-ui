import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/ui/chat_session_options/simple_button.dart';
import 'package:mansi/ui/chat_session_options/system_prompt.dart';
import 'package:mansi/ui/dropdown/dropdown.dart';
import 'package:provider/provider.dart';

class ChatSessionOptions extends StatelessWidget {
  const ChatSessionOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        "Conversation Options",
        textAlign: TextAlign.center,
      ),
      titlePadding: const EdgeInsetsGeometry.all(4),
      contentPadding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
      backgroundColor: Colors.white,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.8),
        // title
        Row(
          children: [
            Text("Topic Title: "),
            Expanded(
              child: Text(context.watch<AppProvider>().activeChatSession?.topicTitle ?? ""),
            ),
          ],
        ),
    
        // provider selection
        Row(
          children: [
            Text("Provider: "),
            Expanded(
              child: DropDown(
                // displayText: "testing",
                displayText: context.read<AppProvider>().activeChatSession!.provider.name,
                candidates: [
                  "awoo?",
                  "awooooo",
                  "awoooo!!!",
                ],
              ),
            ),
          ],
        ),
    
        // model selection
        Row(
          children: [
            Text("Model: "),

            Expanded(
              child: DropDown(
                // displayText: "moonshotai/Kimi-K2-Instruct-0905",
                displayText: context.read<AppProvider>().activeChatSession!.modelName,
                candidates: [
                  "openbmb/MiniCPM4.1-8B",
                  "Qwen/Qwen3-Next-80B-A3B-Instruct",
                  "microsoft/VibeVoice-1.5B",
                ],
              ),
            ),
          ],
        ),
    
        // system prompt
        Text("System Prompt: "),
        const SystemPrompt(),
    
        // features
    
        // conversation options: save, delete
        SimpleButton(
          color: Colors.grey,
          text: "Export conversation",
          icon: Icons.download,
        ),
        
        SimpleButton(
          color: Colors.red.shade300,
          text: "Delete conversation",
          icon: Icons.delete_rounded,
        ),
      ],
    );
  }
}