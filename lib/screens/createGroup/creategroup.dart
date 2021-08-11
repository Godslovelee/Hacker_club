import 'package:flutter/material.dart';
import 'package:hacker_club/screens/addBook/addBook.dart';
import 'package:hacker_club/screens/root/root.dart';
import 'package:hacker_club/services/database.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'package:hacker_club/widgets/theContainer.dart';
import 'package:provider/provider.dart';

class OurCreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<OurCreateGroup> {

  void _goToAddBook (BuildContext context, String groupName) async{
    

    
      Navigator.push(context, MaterialPageRoute(builder: (context) => OurAddBook(onGroupCreation: true, groupName: groupName,)));
    

  }
 
  TextEditingController _groupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Group Name",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () => _goToAddBook(context, _groupNameController.text)

                    
                  ),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}