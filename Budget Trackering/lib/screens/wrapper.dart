import 'package:brew_crew/Screens/authenticate/authenticate.dart';
import 'package:brew_crew/models/UserID.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID?>(context);
    // Either shows authenticate or home
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
