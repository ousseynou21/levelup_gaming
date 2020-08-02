import 'dart:async';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:levelup_gaming/models/user.dart';
import 'package:levelup_gaming/services/auth.dart';

class DataService {
  final String uid;
  DataService({this.uid});
  final database = FirebaseDatabase.instance;

  Future<Void> saveUser(user) {
    final userRef = database.reference().child('users').child(uid);
    userRef.set({
      'uid': user.uid,
      'email': user.email,
    });
  }

  Future<Void> savePost(name, update, notes) {
    final postRef = database.reference().child('posts').child(uid);
    postRef.push().set({
      'name': name,
      'update': update,
      'notes': notes,
    });
  }
}
