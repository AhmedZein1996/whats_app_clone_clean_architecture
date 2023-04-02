import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/sub_pages/single_item_chat_user_page.dart';

import '../theme/style.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return SingleItemChatUserPage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
