import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:hacker_club/screens/login/login_widgets/loginform.dart';
import 'signupwidgets/signUpForm.dart';
import 'package:hacker_club/screens/login/login.dart';

class OurSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            //child: Padding(
            //padding: EdgeInsets.all(20),
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButton(),
                    ]),
                SizedBox(
                  height: 40.0,
                ),
                OurSignUpForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
