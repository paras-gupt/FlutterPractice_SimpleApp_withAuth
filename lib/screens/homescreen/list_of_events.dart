import 'package:aml_two/classes/Events.dart';
import 'package:aml_two/screens/InfoEvent.dart';
import 'package:flutter/material.dart';


class EventsList extends StatelessWidget {

  final List<Events> events = [
    Events(eventName: 'DCODE' , info: 'D’code is a three-hour competitive programming contest held on Codechef. Light up your coding spirits and seek the accepted (AC) verdict on your submissions!' , venue: 'Online', date: '1 November 2019', time: '21:00 hrs IST', image: 'dcode.png'),
    Events(eventName: 'LOGIX', info: 'Do you think you’re smart? Are you proud of being the “logical guy” in your friend circle? Get a chance to put your logical skills to good use and win exciting prizes. Participate in the new and exciting Logix as a set of logical puzzles await you. ', venue: 'IIT GN Campus' , date: '19 - 20 October 2019', time: '21:00 hrs IST', image: 'logix.png'),
    Events(eventName: 'TECHARTS', info: 'An artist is the one who makes a perfect balance between both. TechArts is an event which aims at challenging the brain with unconventional problems which intrigue the artist within to come up with a rather logical solution.', venue: 'IIT GN Campus', date: '19 - 20 October 2019', time:'TBA',image: 'TechArts.png' ),
    Events(eventName: 'BRAINWIZ', info: 'It is an event aimed at testing the participants logical aptitude and applicative knowledge of science and maths. The event consists of three rounds - logical aptitude tests, chosen genre and buzzer round each with a surprise sub round.', venue: 'IIT GN Campus', date: '19 - 20 October 2019', time:'TBA',image: 'brainwiz.png' ),


  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/blues.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: events.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 70.0,
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.lightBlue[50],
                  margin: EdgeInsets.symmetric(vertical: 0.0),
                  child: ListTile(
                    leading: Hero(
                      tag: events[index].eventName,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/${events[index].image}'),
                        radius: 50.0,
                      ),
                    ),
                    title: Text(events[index].eventName, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Info(event: events[index],)));
                    },
                  ),
                ),
              ),
            );
          }),
    );;
  }
}



