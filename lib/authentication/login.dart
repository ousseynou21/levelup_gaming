import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:levelup_gaming/authentication/auth.dart';
import 'package:levelup_gaming/authentication/user.dart';


class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variables for user email & password

  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  Auth auth= Auth();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: Text('Level Up Login',   style: TextStyle(
                  color: Colors.purple[700],), 
        
      )),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                      setState(() => email = val.trim());
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(32.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.purple,
                            ),
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    onChanged: (val) {
                      setState(() => password = val.trim());
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(32.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:Colors.purple,
                            ),
                            borderRadius: BorderRadius.circular(32.0))) ,
                            
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF7B1FA2),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                            
                         User user = await auth.registerUser(email, password);
                         print(user.uid);
                          print(user.email);
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
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
    )
    );
   
  }
}