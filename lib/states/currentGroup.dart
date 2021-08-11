import 'package:flutter/material.dart';
import 'package:hacker_club/models/book.dart';
import 'package:hacker_club/models/group.dart';
import 'package:hacker_club/services/database.dart';

class CurrentGroup extends ChangeNotifier{
  OurGroup _currentGroup = OurGroup();
  OurBook __currentBook = OurBook();

  OurGroup get getCurrentGroup => _currentGroup;
  OurBook get getCurrentBook => __currentBook;

  void uppdateStateFromDatabase(String groupId)async{

    try{
      _currentGroup = await OurDatabase().getGroupInfo(groupId);
      __currentBook = await OurDatabase().getCurrentBook(groupId, _currentGroup.curentBookId);
      notifyListeners();
      //recover info my firebase
    }catch(e){
      print(e);
    }

  }
}

