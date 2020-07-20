import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text('Home',  style: TextStyle(
                  color: Colors.purple[700],), 
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: new AssetImage('images/levelup.jpg'),
                  alignment: Alignment.center,

              width: 300,
              height: 300,
            ),
            Material(
              elevation: 20.0,
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
              child: MaterialButton(
                onPressed: (null),
                child: Text(
                  "Game Rooms",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
              child: MaterialButton(
                onPressed: (null),
                child: Text( 
                  "Membership",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
              child: MaterialButton(
                onPressed: (null),
                child: Text(
                  "Game Profiles",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}