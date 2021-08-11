import 'package:flutter/material.dart';
import 'package:hacker_club/models/group.dart';
import 'package:hacker_club/screens/addBook/addBook.dart';
import 'package:hacker_club/screens/login/login.dart';
import 'package:hacker_club/screens/noGroup/noGroup.dart';
import 'package:hacker_club/screens/root/root.dart';
import 'package:hacker_club/states/currentGroup.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'package:hacker_club/widgets/theContainer.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  
  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (
            context,
          ) =>
                  OurRoot()),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    CurrentGroup _currentGroup =
        Provider.of<CurrentGroup>(context, listen: false);
    _currentGroup.uppdateStateFromDatabase(_currentUser.getCurrentUser.groupId);
  }

  void _goToAddBook(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (
          context,
        ) =>
                OurAddBook(onGroupCreation: false,)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(21.0),
          child: OurContainer(
            child: Consumer<CurrentGroup>(
              builder: (BuildContext context, value, Widget child) {
                return Column(children: [
                  Text(
                    value.getCurrentBook.name ?? "loading..",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Text(
                          "Must Finish In: ",
                          style: TextStyle(fontSize: 30, color: Colors.grey[500]),
                        ),
                        Expanded(
                          child: Text(
                            (value.getCurrentGroup.currentBookDue != null)
                                ? value.getCurrentGroup.currentBookDue.toDate()
                                    .toString()
                                : "New Task..",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    child: Text("Finished Material",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  )
                ]);
              },
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(21.0),
            child: OurContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next Topic in: ",
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                      Text(
                        "72 hours",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 22.0),
          child: RaisedButton(
              child: Text(
                "Hacker News ",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _goToAddBook(context)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: RaisedButton(
            child: Text("Sign Out "),
            onPressed: () => _signOut(context),
            color: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor, width: 2)),
          ),
        )
      ],
    ));
  }
}
