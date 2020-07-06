class User{

  final String uid;

  User({ this.uid });

}

class UserData{

  final String uid;
  final String email;
  final String name;
  final String phone;
  final String clg;
  final List events;

  UserData({this.uid,this.name,this.email,this.phone, this.clg, this.events});


}