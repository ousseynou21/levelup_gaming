import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Register extends StatefulWidget {
  _RegisterApp createState() => _RegisterApp();
}

class _RegisterApp extends State<Register> {
  // variables for user email & password

  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white, 
         title: Text('Join Level Up Gaming',style: TextStyle(
                  color: Colors.purple[700],fontFamily: 'RobotoMono' )),
            centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                            borderRadius: BorderRadius.circular(32.0))) ,
                            
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
                        hintText: 'Confirm Password',
                        labelStyle: new TextStyle(color: Colors.purple),
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
                          print(email);
                          print(password);
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
              )
              
            ),
          ),
        ),
      ),
    );
  }
}