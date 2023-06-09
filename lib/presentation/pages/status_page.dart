import 'package:flutter/material.dart';
import 'package:whats_app_clone_clean_architecture/presentation/pages/sub_pages/singe_item_story_page.dart';

import '../theme/style.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _customFloatingActionButton(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _storyWidget(),
                  const SizedBox(height: 8,),
                  _recentTextWidget(),
                  const SizedBox(height: 8,),
                  _listStories(),
                ],
              ),
            )
          ],
        ),);
  }

  Widget _customFloatingActionButton() {
    return Positioned(
      right: 10,
      bottom: 15,
      child: Column(
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4.0),
                    blurRadius: 0.50,
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 0.10)
              ],
            ),
            child: const Icon(
              Icons.edit,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4.0),
                    blurRadius: 0.50,
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 0.10)
              ],
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _storyWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 10,top: 4),
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 55,
            width: 55,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset("assets/profile_default.png"),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                "My Status",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Tap to add status update",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _recentTextWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      child: const Text("Recent updates"),
    );
  }

  Widget _listStories() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const SingleItemStoryPage();
      },
    );
  }
}
