import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aml_two/classes/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userCollection = Firestore.instance.collection('UserInfo');

  Future<void> updateUserData(String email, String name, String phone, String clg, List events) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'name': name,
      'phone': phone,
      'clg': clg,
      'events': events,
    });
  }


  //userdata from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      phone: snapshot.data['phone'],
      clg : snapshot.data['clg'],
      events: snapshot.data['events'],
    );
  }


  Stream<UserData> get userData{
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}
