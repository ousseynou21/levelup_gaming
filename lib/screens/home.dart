import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:levelup_gaming/authentication/login.dart';
import 'package:levelup_gaming/authentication/register.dart';
import 'package:levelup_gaming/screens/class.dart';
import 'package:levelup_gaming/screens/post_data.dart';
import 'package:levelup_gaming/screens/profile.dart';
import 'package:levelup_gaming/screens/user_data.dart';
import 'package:levelup_gaming/screens/class.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  final widgetOptions = [
    Design(),
    PostData(),
    OusseynouForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Level Up Gaming',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Games')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text('post page')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
