import 'package:flutter/material.dart';
import 'package:levelup_gaming/models/user.dart';
import 'package:levelup_gaming/services/database.dart';
import 'package:provider/provider.dart';

class OusseynouForm extends StatefulWidget {
  _OusseynouFormState createState() => _OusseynouFormState();
}

String name = "";
String update = "";
String notes = "";

class _OusseynouFormState extends State<OusseynouForm> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return MaterialApp(
        home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Container(
            height: 300,
            width: 300,
            child: Form(
              child: Column(
                children: [
                  Image(
                    image: new AssetImage('images/levelup.jpg'),
                    alignment: Alignment.center,
                    width: 300,
                    height: 300,
                  ),
                  TextFormField(
                    obscureText: false,
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => name = val.trim());
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Name',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 300+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => update = val.trim());
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Update',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: false,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => notes = val.trim());
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Add Notes',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        DataService(
                          uid: user.uid,
                        ).savePost(name, update, notes);
                      },
                      child: Text(
                        "Post Update",
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
          ),
        ),
      ),
    ));
  }
}
