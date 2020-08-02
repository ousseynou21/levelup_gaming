import 'package:flutter/material.dart';

import 'package:levelup_gaming/models/user.dart';

import 'package:levelup_gaming/screens/home.dart';

import 'package:levelup_gaming/authentication/login.dart';

import 'package:levelup_gaming/authentication/register.dart';

import 'package:levelup_gaming/screens/profile.dart';

import 'package:levelup_gaming/screens/post_data.dart';

import 'package:levelup_gaming/services/auth.dart';

import 'package:levelup_gaming/wrapper.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
      catchError: (_, __) => null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
