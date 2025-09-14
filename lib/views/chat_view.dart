import 'package:flutter/material.dart';
import 'package:mansi/classes/message_data.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/providers/chat_session.dart';
import 'package:mansi/ui/chat_controls/chat_controls.dart';
import 'package:mansi/ui/chat_session_title/chat_session_title.dart';
import 'package:mansi/ui/chat_view_content/chat_view_content.dart';
import 'package:mansi/ui/chat_view_content/get_started_section/get_started_section.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    super.initState();

    // initialize settings
    // load data
    // load last states
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.watch<AppProvider>().activeChatSession,
      child: Consumer<ChatSessionProvider?>(
        builder: (context, value, child) => Column(
          children: [
            // header
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Icon(
                      Icons.menu,
                      size: 24,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const Spacer(),
        
                  const ChatSessionTitle(),
        
                  const Spacer(),

                  // Widescreen buttons
                  if (MediaQuery.of(context).size.width > 500) Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "Unsaved",
                      style: TextStyle(
                        color: Colors.grey,
                      )
                    ),
                  ),

                  Icon(
                    Icons.more_horiz_outlined,
                    size: 24,
                    color: Colors.grey.shade700,
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // const Spacer(),
        
                      Visibility(
                        visible: context.watch<AppProvider>().activeChatSession == null,
                        child: Column(
                          children: [
                            const GetStartedSection(),
        
                            // const Spacer(),
                          ],
                        ),
                      ),
        
                      // chat content
                      if (context.watch<AppProvider>().activeChatSession != null) Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: ChatViewContent(
                              data: context.watch<AppProvider>().activeChatSession!.messages.where((cm) => cm.role != "system").toList(),
                            ),
                          ),
                        ),
                      ),
                  
                      // chat controls
                      const ChatControls(),
                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}