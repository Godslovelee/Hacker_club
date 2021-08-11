import 'package:flutter/material.dart';
import 'package:hacker_club/models/book.dart';
import 'package:hacker_club/screens/root/root.dart';
import 'package:hacker_club/services/database.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'package:hacker_club/widgets/theContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class OurAddBook extends StatefulWidget {

  final bool onGroupCreation;
  final String groupName;


  OurAddBook({
    this.onGroupCreation,
    this.groupName
  });
  @override
  _OurAddBookState createState() => _OurAddBookState();
}

class _OurAddBookState extends State<OurAddBook> {
TextEditingController _booknameController = TextEditingController();
TextEditingController _authorController = TextEditingController();
TextEditingController _lengthController = TextEditingController();


DateTime _selectedDate = DateTime.now();

Future<void> _selectDate(BuildContext context)async
{
  final DateTime picked = await DatePicker.showDateTimePicker(context, showTitleActions: true);
  if(picked != null && picked != _selectedDate)
  {
    setState(() {
      _selectedDate = picked;
    });
  } 
}



  void _addBook(BuildContext context, String groupName, OurBook book) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString; 
    
    if(widget.onGroupCreation){
      _returnString = await OurDatabase().createGroup(groupName, _currentUser.getCurrentUser.uid, book);


    }else{
       //CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
       _returnString = await OurDatabase().addBook(_currentUser.getCurrentUser.groupId, book);


    }

    if(_returnString == "success"){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OurRoot()), (route) => false);
    }

  }


  
 
  //TextEditingController _groupNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    controller: _booknameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Book Name",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Author",
                    ),
                  ),

                    SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: _lengthController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Length",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  Text(DateFormat.yMMMMd("en_Us").format(_selectedDate)),
                  Text(DateFormat("H: mm").format(_selectedDate)),
                  FlatButton(
                    child: Text("Change Date"),
                    onPressed: ()=> _selectDate(context) ),
                  
                  //date


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
                    onPressed: ()   {
                      OurBook  book  = OurBook();
                      book.name = _booknameController.text;
                      book.author = _authorController.text;
                      book.length = int.parse(_lengthController.text);
                      book.dateCompleted = Timestamp.fromDate(_selectedDate);



                     
                         _addBook(context, widget.groupName, book);
                      }


                     
                    

                    
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