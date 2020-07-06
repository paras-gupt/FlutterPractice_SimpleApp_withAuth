import 'package:flutter/material.dart';
import 'package:aml_two/firebaseFiles/fireauth.dart';
import 'package:aml_two/loading.dart';
import 'package:aml_two/constant.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView()});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text form fields
  String name = '';
  String phone = '';
  String clg = '';
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
        backgroundColor: Colors.blue[100],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          elevation: 0.0,
          title: Text('AMALTHEA 20',style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            FlatButton.icon(onPressed: (){
              widget.toggleView();
            },
                icon: Icon(Icons.person_outline,color: Colors.white,), label: Text('Sign In',style: TextStyle(color: Colors.white),))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/blues.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text('New user', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 27.0)),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    validator: (val) => val.isEmpty ? 'Enter your name': null,
                    onChanged: (val){
                      setState(() {
                        return name = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
                    validator: (val) => val.length <10 ? 'Enter a valid phone number': null,
                    onChanged: (val){
                      setState(() {
                        return  phone = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Name of College'),
                    validator: (val) => val.isEmpty ? 'Enter the name of your college': null,
                    onChanged: (val){
                      setState(() {
                        return clg = val;
                      });
                    },
                  ),
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
                    child: Text('Register',style: TextStyle(color: Colors.white)),
                    color: Colors.blue[900],
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(name, phone, clg, email, password);
                        if(result == null){
                          setState((){
                            error = 'Enter a valid Email';
                            loading = false;
                          });
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
        )
    );
  }
}