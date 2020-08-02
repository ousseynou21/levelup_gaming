import 'package:flutter/material.dart';
import 'package:levelup_gaming/authentication/register.dart';
import 'package:levelup_gaming/models/user.dart';
import 'package:levelup_gaming/authentication/authentication.dart';
import 'package:levelup_gaming/screens/home.dart';
import 'package:levelup_gaming/screens/user_data.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
