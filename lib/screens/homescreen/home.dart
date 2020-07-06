import 'package:aml_two/classes/user.dart';
import 'package:aml_two/screens/display%20user%20info.dart';
import 'package:aml_two/screens/homescreen/list_of_events.dart';
import 'package:flutter/material.dart';
import 'package:aml_two/firebaseFiles/fireauth.dart';
import 'package:aml_two/firebaseFiles/firedata.dart';
import 'package:provider/provider.dart';
import 'package:aml_two/classes/Events.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('AML EVENTS',style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
        actions: <Widget>[
          FlatButton.icon(onPressed:() async {
            return await _auth.signOut();
          } ,
              icon: Icon(Icons.person),
              label: Text('Log Out',style: TextStyle(color: Colors.white))),
          FlatButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayUserInfo()));
          },
              icon: Icon(Icons.settings), label: Text('Profile',style: TextStyle(color: Colors.white)))
        ],
      ),
      body: EventsList(),
    );
  }
}
