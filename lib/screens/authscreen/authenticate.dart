import 'package:flutter/material.dart';
import 'package:aml_two/screens/authscreen/Login.dart';
import 'package:aml_two/screens/authscreen/register.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signInShow = true;
  void toggleView(){
    setState(() {
      return signInShow = !signInShow;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(signInShow){
      return SignIn(toggleView: toggleView,);
    }else{
      return Register(toggleView: toggleView,);
    }
  }
}
