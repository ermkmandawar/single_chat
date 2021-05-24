import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:single_chat/chats.dart';
import 'package:single_chat/contacts.dart';
import 'package:single_chat/setting.dart';
import 'package:single_chat/status.dart';

import 'main.dart';

class MyBottomBarDemo extends StatefulWidget {
  @override
  _MyBottomBarDemoState createState() => new _MyBottomBarDemoState();
}

class _MyBottomBarDemoState extends State<MyBottomBarDemo> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    ChatScreen(),
    StatusScreen(),
    ContactScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Modify
      appBar: AppBar(
        title: Text(SingleChat.title),
        backgroundColor: Colors.blue[900],
        // centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            }),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.black,
              // iconTheme: IconThemeData(color: Colors.white),
              // textTheme: TextTheme().apply(bodyColor: Colors.black),
            ),

            child: PopupMenuButton<int>(
              // color: Colors.indigo,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Settings"),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Info"),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(width: 10.0),
          ),
        ],
      ),
      //
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.blue[900],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.white,
            ),
            title: Text("Chats"),
            activeIcon: Icon(
              CupertinoIcons.chat_bubble_fill,
              size: 40,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.add_circled,
              color: Colors.white,
            ),
            title: Text("Status"),
            activeIcon: Icon(
              CupertinoIcons.add_circled_solid,
              size: 40,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_2,
              color: Colors.white,
            ),
            title: Text("Contacts"),
            activeIcon: Icon(
              CupertinoIcons.person_2_fill,
              size: 40,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ContactScreen()),
          (route) => false,
        );
    }
  }
}
