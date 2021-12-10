import 'package:flutter/material.dart';
import 'package:hacker_club/screens/Home/home.dart';
import 'package:hacker_club/screens/login/login.dart';
import 'package:hacker_club/screens/noGroup/noGroup.dart';
import 'package:hacker_club/screens/splashScreen/splashScreen.dart';
import 'package:hacker_club/states/currentGroup.dart';
import 'package:hacker_club/states/currentUser.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notLoggedIn,
  notInGroup,
  unknown,
  inGroup,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  void didChangeDependencies() async {
    super.didChangeDependencies();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    String _returnString = await _currentUser.onStartUp();

    if (_returnString == "success") {
      if(_currentUser.getCurrentUser.groupId != null ){
        setState(() {
        _authStatus = AuthStatus.inGroup;
      });

      }else
      setState(() {
        _authStatus = AuthStatus.notInGroup;
      });
    }
    else{
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
       case AuthStatus.unknown:
        retVal = OurSplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = OurLogin();
        break;
      case AuthStatus.notInGroup:
        retVal =OurNoGRoup();
        break;
         case AuthStatus.inGroup:
        retVal = ChangeNotifierProvider(create: (BuildContext context) => CurrentGroup(),
        //child: HomeScreen(),
    // );
        );break;
      default:
    }

    return retVal;
  }
}
