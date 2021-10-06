import 'package:firebase_1/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({ Key? key, required this.toggleView }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();

  // test form 
  String email='';
  String pwd='';
  String error="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("sign up to brew"),
        actions: [
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person,color: Colors.black,),
            label: Text("Sign in",style: TextStyle(color: Colors.black),)
          )
        ],
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
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  setState(() {
                    email=value;
                  });
                  //email=value;
                },
                validator: (val){
                  return val!.isEmpty?'Enter an email':null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    pwd=value;
                  });
                  //pwd=value;
                },
                validator: (val){
                  return val!.length<4 ?'Enter a password 4+ chars long ':null;
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    dynamic result=await _auth.registerEmailAndPwd(email, pwd);
                    if(result==null){
                      setState(() {
                        error="please supply a valid email";
                      });
                    }
                  }
                  
                },
                child: Text("Register")
              ),
              SizedBox(height: 10,),
              Text(error,style: TextStyle(color: Colors.red,fontSize: 14.0),)
            ],
          ),
        ),
      ),
    );
  }
}

