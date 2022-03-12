import 'package:chatapp/pages/contacts.dart';
import 'package:chatapp/pages/messages.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Chat App'),
              centerTitle: true,
              backgroundColor: Colors.pinkAccent,
              bottom: TabBar(
                tabs: [
                  Tab(text:'Messages', icon: Icon(Icons.add_comment_rounded)),
                  Tab(text: 'Contacts', icon: Icon(Icons.add_ic_call_rounded)),
                  Tab(text: 'Profile', icon: Icon(Icons.account_box)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Messages(),
                Contacts(),
                Center(child: Text('Tab 3')),
              ],
            )
        ));
  }
}


