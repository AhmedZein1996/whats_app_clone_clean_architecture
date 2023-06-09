import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/sub_pages/single_item_call_page.dart';

import '../theme/style.dart';


class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const SingleItemCallPage();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: primaryColor,
        child: const Icon(Icons.add_call,color: Colors.white,),
      ),
    );
  }
}
