import 'package:flutter/material.dart';
import 'package:mansi/classes/logger.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/views/side_bar/section_title.dart';
import 'package:mansi/views/side_bar/side_bar_item.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideBarItem(
              text: "New Conversation",
              onTap: () {
                Logger.writeLine("[New Conversation]: Creating new session...");
                final ses = context.read<AppProvider>().newChatSession();
                
                Logger.writeLine("[New Conversation]: Setting new session to active...");
                context.read<AppProvider>().setActiveChatSession(context.read<AppProvider>().chats.indexOf(ses));
                Scaffold.of(context).closeDrawer();
              },
            ),
      
            const SectionTitle("Favorites"),
      
            const SectionTitle("Conversations"),
        
            // chat list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(context.watch<AppProvider>().chats.length, (i) => SideBarItem(
                    text: context.watch<AppProvider>().chats[i].topicTitle ?? "",
                    isActive: context.watch<AppProvider>().activeChatSession == context.watch<AppProvider>().chats[i],
                    onTap: () {
                      Logger.writeLine("Setting to selected chat session...");
                      context.read<AppProvider>().setActiveChatSession(i);
                      Scaffold.of(context).closeDrawer();
                    },
                  )),
                ),
              ),
            ),
        
            // basic settings
            const SectionTitle("Settings"),
            
            Column(
              children: [
                SideBarItem(
                  text: ""
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}