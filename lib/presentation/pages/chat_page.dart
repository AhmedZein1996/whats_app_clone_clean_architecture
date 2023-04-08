import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/sub_pages/single_item_chat_user_page.dart';

import '../theme/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Start chat with your friends and family,\n on WhatsApp Clone',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 14, color: Colors.black.withOpacity(.4)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }

  _myChats() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return const SingleItemChatUserPage();
      },
    );
  }
}
