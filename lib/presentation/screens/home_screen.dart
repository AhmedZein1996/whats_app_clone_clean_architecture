import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclonecleanarch/presentation/pages/calls_page.dart';
import 'package:whatsappclonecleanarch/presentation/pages/camera_page.dart';
import 'package:whatsappclonecleanarch/presentation/pages/chat_page.dart';
import 'package:whatsappclonecleanarch/presentation/pages/status_page.dart';
import 'package:whatsappclonecleanarch/presentation/theme/style.dart';
import 'package:whatsappclonecleanarch/presentation/widgets/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;

  int _currentPageIndex = 1;

  PageController _pageViewController = PageController(initialPage: 1);

  List<Widget> get _pages => [
        CameraPage(),
        ChatPage(),
        StatusPage(),
        CallsPage(),
      ];

  _buildSearch() {
    return SafeArea(
      child: Container(
        height: 45,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: Offset(0.0, 0.50))
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
                //TODO:
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
      appBar: _currentPageIndex != 0
          ? AppBar(
              elevation: 0.0,
              automaticallyImplyLeading: false,
              backgroundColor:
                  _isSearch == false ? primaryColor : Colors.transparent,
              title: _isSearch == false
                  ? Text("WhatsApp Clone")
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    ),
              flexibleSpace: _isSearch == false
                  ? Container(
                      height: 0.0,
                      width: 0.0,
                    )
                  : _buildSearch(),
              actions: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: Icon(Icons.search)),
                SizedBox(
                  width: 5,
                ),
                InkWell(onTap: () {}, child: Icon(Icons.more_vert))
              ],
            )
          : null,
      body: Column(
        children: <Widget>[
          _isSearch == false
              ? _currentPageIndex != 0
                  ? CustomTabBar(index: _currentPageIndex)
                  : Container(
                      height: 0.0,
                      width: 0.0,
                    )
              : Container(
                  height: 0.0,
                  width: 0.0,
                ),
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
