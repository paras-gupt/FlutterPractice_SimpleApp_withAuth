import 'package:aml_two/classes/user.dart';
import 'package:aml_two/firebaseFiles/fireauth.dart';
import 'package:aml_two/screens/wScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WScreen(),
      ),
    );
  }
}

