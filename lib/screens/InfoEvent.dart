import 'package:aml_two/classes/Events.dart';
import 'package:aml_two/screens/RegisterForm.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {

  final Events event ;

  Info({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(event.eventName,style: TextStyle(color: Colors.white)),
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/blues.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: event.eventName,
                child: Container(
                  height: 250.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage('assets/${event.image}'),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(8.0),
                color: Colors.blueAccent[300],
                child: Text(event.info, style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
            ),
            SizedBox(height: 20.0),
            FlatButton(
              child: Text('Register',style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Colors.blue[900],
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegForm(nameOfEvent: event.eventName)));
              },
            ),

          ],
        ),
      ),
    );
  }
}
