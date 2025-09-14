import 'package:flutter/material.dart';
import 'package:mansi/providers/app_provider.dart';
import 'package:mansi/views/side_bar/section_title.dart';
import 'package:mansi/views/side_bar/side_bar_item.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBarItem(
            text: "New Conversation",
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
                )),
              ),
            ),
          ),
      
          // basic settings
          const SectionTitle("Settings"),
          
          // TODO: Active = Colors.amber (no borders)
          Column(
            children: [
              SideBarItem(
                text: ""
              ),
            ],
          )
        ],
      ),
    );
  }
}