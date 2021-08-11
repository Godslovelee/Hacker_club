import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:hacker_club/screens/createGroup/creategroup.dart';
import 'package:hacker_club/screens/joinGroup/joingroup.dart';

class OurNoGRoup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => OurJoinGroup()));
    }
    void _goToCreate(BuildContext context) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OurCreateGroup()));
    }
    return Scaffold(
        body: Column(
      children: [
        Spacer(
          flex: 1,
        ),
        Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/Anime.png")),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text("Welcome to Hackers Forum", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Colors.grey)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Feel free to Express yourself",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40.0, color: Colors.grey),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Create"),
                onPressed: () => _goToCreate(context),
                color: Theme.of(context).canvasColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor,
                    width: 2,
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Join",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _goToJoin(context),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
