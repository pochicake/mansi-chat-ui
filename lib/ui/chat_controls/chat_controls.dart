import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/providers/chat_message.dart';
import 'package:mansi/providers/chat_session.dart';
import 'package:mansi/ui/chat_controls/chat_control.dart';
import 'package:mansi/ui/chat_controls/send_button.dart';
import 'package:mansi/ui/chat_message.dart';
import 'package:mansi/ui/chat_user_textbox/chat_user_textbox.dart';
import 'package:mansi/ui/toggle_switch.dart';
import 'package:provider/provider.dart';

class ChatControls extends StatefulWidget {
  const ChatControls({super.key});

  @override
  State<ChatControls> createState() => _ChatControlsState();
}

class _ChatControlsState extends State<ChatControls> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.watch<AppProvider>().activeChatSession,
      child: Consumer<ChatSessionProvider>(
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                // user input
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 4,
                  ),
                  child: ChatUserTextbox(
                    controller: _controller,
                    onChanged: (value) => setState(() {}),
                  ),
                ),
          
                // chat options
                Row(
                  children: [
                    // reasoning mode
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   "Reasoning",
                        //   style: TextStyle(
                        //     fontSize: 12
                        //   ),
                        // ),
                        // ToggleSwitch(),
          
                        ChatControl(
                          icon: Icons.image,
                        ),
          
                        ChatControl(
                          icon: Icons.attachment,
                        ),
          
                        ChatControl(
                          icon: Icons.plagiarism_outlined,
                        ),
                      ],
                    ),
          
                    const Spacer(),
          
                    // send button
                    // TODO: Allow stopping inference
                    // TODO: Add scroll to bottom when scrolled up
                    SendButton(
                      shown: _controller.text.isNotEmpty || !(context.watch<AppProvider>().activeChatSession?.finishedResponding ?? true),
                      isStop: !(context.watch<AppProvider>().activeChatSession?.finishedResponding ?? true),
                      onTap: () {
                        // safety check
                        if (context.read<AppProvider>().activeChatSession == null && _controller.text.isEmpty) {
                          return;
                        }else if (context.read<AppProvider>().activeChatSession == null) {
                          context.read<AppProvider>().newChatSession();
                        }
          
                        // update list
                        final String content = _controller.text;
                        _controller.clear();
          
                        // inference
                        context.read<AppProvider>().activeChatSession!.addMessage(ChatMessage(role: "user", content: content));
                      },
                    ),
                  ],
                )
              ],
            )
          );
        },
      ),
    );
  }
}