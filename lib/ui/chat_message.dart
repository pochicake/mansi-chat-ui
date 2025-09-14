import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/providers/chat_message.dart';
import 'package:mansi/providers/chat_session.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';

class ChatMessageUI extends StatelessWidget {
  // final MessageData data;
  final ChatMessage data;
  const ChatMessageUI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // print(data.content);
    return ChangeNotifierProvider.value(
      value: context.watch<AppProvider>().activeChatSession,
      child: Consumer<ChatSessionProvider?>(
        builder: (context, value, child) {
          if (data.isLoading) {
            return Row(
              spacing: 8,
              children: [
                SizedBox.square(
                  dimension: 14,
                  child: CircularProgressIndicator(
                    color: Colors.amber.shade300,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                  ),
                ),

                Text(
                  "Querying server...",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: data.role == "user" ? Colors.grey.shade200 : const Color.fromARGB(255, 255, 248, 221),
                border: Border.all(
                  color: data.role == "user" ? Colors.white : const Color.fromARGB(255, 255, 219, 156),
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside,
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                minWidth: 120,
              ),
              child: MarkdownWidget(
                config: MarkdownConfig(
                  configs: [
                    PConfig(
                      textStyle: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    CodeConfig(
                      style: TextStyle(
                        fontSize: 13,
                        backgroundColor: Colors.white,
                        fontFamily: "Consolas",
                      ),
                    ),
                    H1Config(
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    H2Config(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    H3Config(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    H4Config(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    H5Config(
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    HrConfig(
                      height: 1,
                      color: Colors.black,
                    ),
                    PreConfig(
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontFamily: "Consolas",
                      ),
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber.shade300,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    BlockquoteConfig(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(4),

                    ),
                  ],
                ),
                data: data.content,
                shrinkWrap: true,
              ),
            ),
          );
        },
      ),
    );
  }
}