import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:levelup_gaming/authentication/user.dart';

class Auth {

FirebaseAuth _auth = FirebaseAuth.instance;
  
Future<User> registerUser(email, password) async {
  AuthResult result = 
  await _auth.createUserWithEmailAndPassword(email: email, password: password);
FirebaseUser user= result.user;
  return userFromFirebase(user);
} 
    User userFromFirebase(user) {
      return User(email: user.email, uid: user.uid);
}

}