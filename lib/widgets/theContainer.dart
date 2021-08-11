import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurContainer extends StatelessWidget{

  final Widget child;

  const OurContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(4.0, 3.0))
          ]),
      child: child,
    );
  }
}