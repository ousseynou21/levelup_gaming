import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  // variables for user email & password

  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        home: new Scaffold(
            backgroundColor: Colors.white,
            appBar: new AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Games',
                style: TextStyle(
                  color: Colors.purple[700],
                ),
              ),
            ),
            body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[     
                          Container(
                              padding: const EdgeInsets.all(11.0),
                              margin: const EdgeInsets.all(13.0),
                          
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                             Border.all(
                              color: Colors.purple,

                            )
                            ),
                            child: Text(
                              'CSGO',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Image(
                            image: new AssetImage('images/cs-go.jpg'),
                            width: 300,
                            height: 300,
                          ),
                          Container(
                              padding: const EdgeInsets.all(11.0),
                              margin: const EdgeInsets.all(13.0),
                          
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                             Border.all(
                              color: Colors.purple,

                            )
                            ),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Container (
                             padding: const EdgeInsets.all(11.0),
                              margin: const EdgeInsets.all(13.0),
                            child: Text('CSGO is an online multiplayer first person shooter devloped by Valve and Hidden Path entertainment made by Mike Morasky'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                             Border.all(
                               
                              color: Colors.purple,

  
                          )
        ))])))))));
  }
}
