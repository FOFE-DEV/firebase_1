import 'package:firebase_1/services/auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  const SingIn({ Key? key }) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sing in to brew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        /* child: RaisedButton(
          child: Text("Sing-in "),
          onPressed: () async {
            print("sing in"); 
            dynamic result= await _auth.signAnon();
            if(result==null){
              print("user is not singIn");
            }else{
              print('user is on the app ');
              print(result.uid);
            }
          },
        ), */
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextField(
                onChanged: (value){

                },
              ),
              SizedBox(height: 10,),
              TextField(
                obscureText: true,
                onChanged: (value){

                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){

                },
                child: Text("connect")
              )
            ],
          ),
        ),
      ),
    );
  }
}