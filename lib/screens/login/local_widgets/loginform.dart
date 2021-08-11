import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_club/screens/Home/home.dart';
import 'package:hacker_club/screens/root/root.dart';
import 'package:hacker_club/screens/signup/signup.dart';

import 'package:hacker_club/states/currentUser.dart';
import 'package:hacker_club/widgets/theContainer.dart';
import 'package:provider/provider.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(
      {@required LoginType type,
      String email,
      String password,
      BuildContext context}) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString;
      switch (type) {
        case LoginType.email:
          _returnString =
              await _currentUser.loginUserWithEmail(email, password);
          break;
        case LoginType.google:
          _returnString = await _currentUser.loginUserWithGoogle();
          break;
        default:
      }

      if (_returnString == "success") {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OurRoot()),
                    (route) => false);
              }
    } catch (e) {
      print(e);
    }
  }

  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _loginUser(type: LoginType.google, context: context);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/google.png"),
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OurContainer(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Login",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outlined), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Log in",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () {
              _loginUser(
                  type: LoginType.email,
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context);
            }),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OurSignUp(),
              ));
            },
            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Text("Dont have an account?..create here")),
        _googleButton()
      ],
    ));
  }
}
