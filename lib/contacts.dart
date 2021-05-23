import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_contact/contacts.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contact/contact.dart';

Uint8List avatar;

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List listContacts;

  // ignore: unused_field

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    listContacts = new List();
    readContact();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
          // color: Colors.white,
          // margin: EdgeInsets.fromLTRB(0, 10, 0, 7),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   // border: Border.all(width: 1),
          //   // borderRadius: BorderRadius.circular(30),
          // ),
          child: (listContacts.length > 0)
              ? ListView.builder(
                  itemCount: listContacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = listContacts.get(index);
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.black,
                      elevation: 7,
                      color: Colors.blue[100],
                      margin: EdgeInsets.fromLTRB(3, 0, 3, 10),
                      child: ListTile(
                        trailing: Icon(
                          Icons.person,
                        ),
                        leading: (contact.avatar != null &&
                                contact.avatar.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar),
                              )
                            : CircleAvatar(
                                child: Text(contact.initials()),
                                backgroundColor: Theme.of(context).accentColor,
                              ),
                        title: Text("${contact.displayName}"),
                        subtitle: Text((contact.phones.length > 0)
                            ? "${contact.phones.get(0)}"
                            : "${contact.givenName}"),
                      ),
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        backgroundColor: Colors.indigo[900],
                      ),
                      Text("Loading Contacts...")
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.restricted;
    } else {
      return permission;
    }
  }

  readContact() async {
    final PermissionStatus permissionStatus = await _getPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Contacts.streamContacts().forEach((contact) {
        print("${contact.displayName}");
        setState(() {
          listContacts.add(contact);
        });
      });
    }
//ask end code
  }
}
