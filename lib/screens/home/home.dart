import 'package:firebase_1/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Home brew"),
        actions: [
          IconButton(
            onPressed: ()async{
              await _auth.logout();
            },
            icon: Icon(Icons.logout,color: Colors.white,)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: RaisedButton(
          child: Text("Home "),
          onPressed: (){
            print("sing in"); 
          },
        ),
      ),
    );
  }
}