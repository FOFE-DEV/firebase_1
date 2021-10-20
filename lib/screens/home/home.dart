import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_1/models/brew.dart';
import 'package:firebase_1/screens/home/brew_list.dart';
import 'package:firebase_1/screens/home/settings_form.dart';
import 'package:firebase_1/services/auth.dart';
import 'package:firebase_1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child: SettingsForm(),
      );
    }); 
    }
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: Text("Home brew"),
          actions: [
            IconButton(
              onPressed: ()=>_showSettingsPanel(),
              icon: Icon(Icons.settings,color: Colors.white,)
            ),
            IconButton(
              onPressed: ()async{
                await _auth.logout();
              },
              icon: Icon(Icons.logout,color: Colors.white,)
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}