import 'package:flutter/material.dart';
import '../pages/calls_page.dart';
import '../pages/camera_page.dart';
import '../pages/chat_page.dart';
import '../pages/status_page.dart';
import '../theme/style.dart';
import '../widgets/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  final String uid;

  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;

  int _currentPageIndex = 1;

  final PageController _pageViewController = PageController(initialPage: 1);

  List<Widget> get _pages => [
        const CameraPage(),
        const ChatPage(),
        const StatusPage(),
        const CallsPage(),
      ];

  _buildSearch() {
    return SafeArea(
      child: Container(
        height: 45,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: const Offset(0.0, 0.50))
        ]),
        child: TextField(
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: "Search...",
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            prefixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isSearch = false;
                });
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: _isSearch == false ? primaryColor : Colors.transparent,
        title: _isSearch == false
            ? const Text("WhatsApp Clone")
            : const SizedBox(
                height: 0.0,
                width: 0.0,
              ),
        flexibleSpace: _isSearch == false
            ? const SizedBox(
                height: 0.0,
                width: 0.0,
              )
            : _buildSearch(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.photo_camera),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
              onTap: () {
                setState(() {
                  _isSearch = true;
                });
              },
              child: const Icon(Icons.search)),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.more_vert),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _isSearch == true
              ? const SizedBox(
                  height: 0.0,
                  width: 0.0,
                )
              : CustomTabBar(index: _currentPageIndex),
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return _pages[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
