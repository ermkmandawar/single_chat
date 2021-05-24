import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:single_chat/bottomNav.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);

//   void main() => runApp(SingleChat());
// }

// class SingleChat extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.indigo[900],
//         accentColor: Colors.cyan[600],
//       ),
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             // centerTitle: true,
//             title: Text('Single Chat'),
//             automaticallyImplyLeading: false,
//             leading: GestureDetector(
//               onTap: () {},
//               child: Icon(Icons.person),
//             ),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: Icon(Icons.wb_sunny_sharp),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: Icon(Icons.search),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: 20.0),
//                 child: GestureDetector(
//                   child: Icon(Icons.more_vert),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => DestinationScreen()),
//                     );
//                   },
//                 ),
//               )
//             ],
//             bottom: TabBar(
//               // indicatorColor: Colors.amberAccent,
//               // indicatorSize: TabBarIndicatorSize.label,
//               // indicatorWeight: 3,
//               // labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
//               indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.white70,
//               ),
//               automaticIndicatorColorAdjustment: true,
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.white,
//               tabs: [
//                 Tab(
//                   text: "Chats",
//                 ),
//                 Tab(
//                   text: "Status",
//                 ),
//                 Tab(
//                   text: "Contacts",
//                 )
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               ChatScreen(),
//               StatusScreen(),
//               ContactScreen(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(SingleChat());
}

class SingleChat extends StatelessWidget {
  static final String title = 'Single Chat';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        // theme: ThemeData(
        //   brightness: Brightness.dark,
        //   primaryColor: Colors.indigo[900],
        //   accentColor: Colors.cyan[600],
        // ),
        // home: MyBottomBarDemo(),
        initialRoute: '/',
        routes: {
          '/': (_) => MyBottomBarDemo(),
        },
      );
}

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(SingleChat.title),
//           backgroundColor: Colors.blue[900],
//           // centerTitle: true,
//           leading: IconButton(
//               icon: Icon(Icons.person),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ChatScreen()));
//               }),
//           actions: [
//             Theme(
//               data: Theme.of(context).copyWith(
//                 dividerColor: Colors.black,
//                 // iconTheme: IconThemeData(color: Colors.white),
//                 // textTheme: TextTheme().apply(bodyColor: Colors.black),
//               ),

//               child: PopupMenuButton<int>(
//                 // color: Colors.indigo,
//                 onSelected: (item) => onSelected(context, item),
//                 itemBuilder: (context) => [
//                   PopupMenuItem<int>(
//                     value: 0,
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.settings,
//                           color: Colors.black,
//                         ),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         Text("Settings"),
//                       ],
//                     ),
//                   ),
//                   PopupMenuItem<int>(
//                     value: 1,
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.info,
//                           color: Colors.black,
//                         ),
//                         const SizedBox(
//                           width: 8,
//                         ),
//                         Text("Info"),
//                       ],
//                     ),
//                   ),
//                   PopupMenuDivider(),
//                   PopupMenuItem<int>(
//                     value: 2,
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.logout,
//                           color: Colors.black,
//                         ),
//                         const SizedBox(width: 8),
//                         Text('Sign Out'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               // SizedBox(width: 10.0),
//             ),
//           ],
//         ),
//       );

//   void onSelected(BuildContext context, int item) {
//     switch (item) {
//       case 0:
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => SettingPage()),
//         );
//         break;
//       case 1:
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context) => ChatScreen()),
//         );
//         break;
//       case 2:
//         Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => ContactScreen()),
//           (route) => false,
//         );
//     }
//   }
// }
