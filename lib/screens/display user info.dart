import 'package:aml_two/firebaseFiles/firedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aml_two/classes/user.dart';
import 'package:aml_two/loading.dart';

class DisplayUserInfo extends StatefulWidget {


  @override
  _DisplayUserInfoState createState() => _DisplayUserInfoState();
}

class _DisplayUserInfoState extends State<DisplayUserInfo> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
                backgroundColor: Colors.blue[100],
                appBar: AppBar(
                  title: Text('User Info', style: TextStyle(color: Colors.white),),
                  elevation: 0.0,
                  backgroundColor: Colors.blue[700],
                ),
                body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/blues.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 20.0,),
                      Text('Name: ${userData.name}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600,), textAlign: TextAlign.center,),
                      SizedBox(height: 10.0,),
                      Text('Phone No.: ${userData.phone}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                      SizedBox(height: 10.0,),
                      Text('College: ${userData.clg}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                      SizedBox(height: 10.0,),
                      Text('Email-Id: ${userData.email}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
                      SizedBox(height: 45.0,),
                      Text('Events Registered:',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600), textAlign: TextAlign.justify,),
                      SizedBox(height: 10.0,),
                      Expanded(
                        child: ListView.builder(
                            itemCount: userData.events.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Card(
                                    color: Colors.lightBlue[50],
                                    margin: EdgeInsets.symmetric(vertical: 0.0),
                                    child: ListTile(
                                      leading: Icon(Icons.arrow_forward),
                                      title: Text(userData.events[index], style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),


                    ],
                  ),
                )

            );

          }
          else {
            return Loading();
          }





        }

    );
  }
}
