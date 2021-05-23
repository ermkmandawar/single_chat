import 'package:flutter/material.dart';
import 'package:single_chat/chats.dart';
import 'chats.dart';
import 'contacts.dart';
import 'status.dart';

void main() => runApp(SingleChat());

class SingleChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo[900],
        accentColor: Colors.cyan[600],
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // centerTitle: true,
            title: Text('Single Chat'),
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {},
              child: Icon(Icons.menu),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.wb_sunny_sharp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert),
                ),
              ),
            ],
            bottom: TabBar(
              // indicatorColor: Colors.amberAccent,
              // indicatorSize: TabBarIndicatorSize.label,
              // indicatorWeight: 3,
              // labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70,
              ),
              automaticIndicatorColorAdjustment: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Contacts",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatScreen(),
              StatusScreen(),
              ContactScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate {}
