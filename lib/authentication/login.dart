import 'package:flutter/material.dart';
import 'package:levelup_gaming/authentication/register.dart';
import 'package:levelup_gaming/models/user.dart';
import 'package:levelup_gaming/screens/home.dart';
import 'package:levelup_gaming/screens/user_data.dart';
import 'package:levelup_gaming/services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variables for user email & password

  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 300,
                ),
                TextFormField(
                  obscureText: false,
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'Email',
                      border: OutlineInputBorder(
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
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.purple,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        User user = await _auth.loginUser(email, password);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
