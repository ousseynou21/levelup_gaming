import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:levelup_gaming/authentication/login.dart';
import 'package:levelup_gaming/authentication/register.dart';
import 'package:levelup_gaming/screens/post_data.dart';
import 'package:levelup_gaming/screens/home.dart';
import 'package:levelup_gaming/screens/profile.dart';
import 'package:levelup_gaming/screens/user_data.dart';
import 'package:levelup_gaming/services/auth.dart';

class Design extends StatefulWidget {
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: 300,
      width: 300,
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  child: Form(
                      child: Column(children: [
                Image(
                  image: AssetImage('images/levelup.jpg'),
                  alignment: Alignment.center,
                  width: 300,
                  height: 600,
                )
              ])))),
          Material(
            color: Colors.grey[900],
            child: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
                await _auth.signOut();
              }, // handle your onTap here
              child: Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.white,
                  color: Colors.purple,
                  elevation: 7.0,
                  child: Center(
                    child: Text(
                      ' Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
