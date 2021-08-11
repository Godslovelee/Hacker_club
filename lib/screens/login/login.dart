import 'package:flutter/material.dart';
import 'package:hacker_club/screens/Home/home.dart';
import 'package:hacker_club/screens/login/local_widgets/loginform.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'package:provider/provider.dart';
class OurLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(//child: Padding(
            //padding: EdgeInsets.all(20),
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Padding(padding: EdgeInsets.all(30.0),
                  child: Image.asset("assets/glasses.png"),),
                SizedBox(height: 19.0,),
                OurLoginForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//event that would be implemented, so keep a user signed in, across the app's life cycle
