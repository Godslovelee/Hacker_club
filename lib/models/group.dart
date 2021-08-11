import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup{
  String id;
  String name;
  String leader; 
  String curentBookId;
  List<String>members;
  Timestamp groupCreated;
  Timestamp currentBookDue;

  OurGroup({
    this.id,
    this.name,
    this.leader,
    this.members,
    this.groupCreated,
    this.curentBookId,
    this.currentBookDue

  });


}