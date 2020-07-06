import 'package:aml_two/screens/authscreen/authenticate.dart';
import 'package:aml_two/screens/homescreen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aml_two/classes/user.dart';

class WScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
