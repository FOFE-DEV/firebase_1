import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_1/models/brew.dart';

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});
  //collectiuon references
  final CollectionReference brewCollection=FirebaseFirestore.instance.collection("brews");

  Future updateData(String sugar,String name,int strength)async{
    return await brewCollection.doc(uid).set({
      'sugar':sugar,
      'name':name,
      'strength':strength,
    });
  }

  //brew list from query snapshot
  List<Brew> _brewListFromSnapShot(QuerySnapshot? snapshot){
    return snapshot!.docs.map((doc){
          Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
          return Brew(
          name: data['name'],
          strength: data["strength"]?? 0,
          sugars: data["sugars"]?? '0'
        );

    }).toList();
  }

  Stream<List<Brew>>get brews{
    return brewCollection.snapshots().map(_brewListFromSnapShot);
  }


}