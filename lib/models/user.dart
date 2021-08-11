import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String uid;
  String email;
  String fullName;
  String groupId;
  Timestamp aacountCreated;

  OurUser({this.groupId ,this.uid, this.email, this.fullName, this.aacountCreated});
}
