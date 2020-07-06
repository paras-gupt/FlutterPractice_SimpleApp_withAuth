import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aml_two/firebaseFiles/fireauth.dart';
import 'package:aml_two/loading.dart';
import 'package:aml_two/constant.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView()});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text form fields
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          elevation: 0.0,
          title: Text('AMALTHEA 20',style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: (){
                  widget.toggleView();
                },
                icon: Icon(Icons.person_outline, color: Colors.white,),
                label: Text('Register', style: TextStyle(color: Colors.white)))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/blues.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Text('Sign In', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 27.0)),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'Enter an email': null,
                      onChanged: (val){
                        setState(() {
                          return email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      validator: (val) => val.length <6 ? 'Enter a password having 6+ chars': null,
                      obscureText: true,
                      onChanged: (val){
                        setState(() {
                          return password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      child: Text('Sign In',style: TextStyle(color: Colors.white)),
                      color: Colors.blue[900],
                      onPressed: () async{
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading = true;
                          });
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            if(result == null){
                              setState((){
                                error = 'could not sign in';
                                loading = false;
                              });

                            }
                          }
                        }
                      },
                    ),
                    SizedBox(height: 12.0,),
                    Text(error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}