import 'package:flutter/material.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'utils/ourTheme.dart';
import 'package:provider/provider.dart';
import 'package:hacker_club/screens/root/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),

      ),
    );
  }

}
