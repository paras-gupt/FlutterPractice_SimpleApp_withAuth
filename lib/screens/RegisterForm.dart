import 'package:flutter/material.dart';
import 'package:aml_two/loading.dart';
import 'package:aml_two/constant.dart';
import 'package:aml_two/classes/user.dart';
import 'package:aml_two/firebaseFiles/firedata.dart';
import 'package:provider/provider.dart';

class RegForm extends StatefulWidget {

  final String nameOfEvent ;
  RegForm({this.nameOfEvent});

  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {

  final _formKey = GlobalKey<FormState>();

  // text form fields
  String name = '';
  String phone = '';
  String clg = '';
  String email = '';
  String password = '';
  String error = '';
  List _currentEvents;
  bool check = false;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              resizeToAvoidBottomInset: false,
                backgroundColor: Colors.blue[100],
                appBar: AppBar(
                  backgroundColor: Colors.blue[700],
                  elevation: 0.0,
                  title: Text('Register Form', style: TextStyle(color: Colors.white),),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/blues.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0,),
                            Text('Registeration for', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0)),
                            SizedBox(height: 8.0,),
                            Text(widget.nameOfEvent, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34.0)),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Name: ${userData.name}'),
                              validator: (val) => val.isEmpty ? 'Enter your name' : null,
                              onChanged: (val) {
                                setState(() {
                                  return name = val ?? userData.name;
                                });
                              },
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Phone No.: ${userData.phone}'),
                              validator: (val) =>
                              val.length < 10
                                  ? 'Enter a valid phone number'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  return phone = val ?? userData.phone;
                                });
                              },
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'College : ${userData.clg}'),
                              validator: (val) =>
                              val.isEmpty
                                  ? 'Enter the name of your college'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  return clg = val ?? userData.clg;
                                });
                              },
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Email: ${userData.email}'),
                              validator: (val) =>
                              val.isEmpty
                                  ? 'Enter an email'
                                  : null,
                              onChanged: (val) {
                                setState(() {
                                  return email = val ?? userData.email;
                                });
                              },
                            ),
                            SizedBox(height: 40.0),
                            RaisedButton(
                                child: Text('Sumbit',style: TextStyle(color: Colors.white)),
                                color: Colors.blue[900],
                                onPressed: () async {

                                  setState(() {
                                    _currentEvents = userData.events;
                                    _currentEvents = _currentEvents + [widget.nameOfEvent];
                                  });


                                  if (_formKey.currentState.validate()) {
                                    await DatabaseService(uid: user.uid).updateUserData(
                                        email ,
                                        name,
                                        phone,
                                        clg,
                                        _currentEvents ?? userData.events);
                                    Navigator.pop(context);
                                  }
                                  else {
                                    setState(() {
                                      error = 'Enter correct details';
                                    });
                                  }
                                }
                            ),
                            SizedBox(height: 12.0,),
                            Text(error,
                                style: TextStyle(color: Colors.red,
                                    fontSize: 14.0)


                            )
                          ],
                        ),
                      ),
                    ),
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
