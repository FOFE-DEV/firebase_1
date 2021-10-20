import 'package:firebase_1/services/auth.dart';
import 'package:firebase_1/shared/constant.dart';
import 'package:firebase_1/shared/loading.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;
  const SingIn({ Key? key, required this.toggleView, }) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _formKey=GlobalKey<FormState>();
  final AuthService _auth=AuthService();
  //text  fiel state
  String email='';
  String pwd='';
  String error='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text("Sing in to brew"),
        actions: [
          TextButton.icon(
            onPressed: (){
              widget.toggleView();
            },
            icon: Icon(Icons.person,color: Colors.black),
            label: Text("Register",style: TextStyle(color: Colors.black),)
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
                decoration: textInputdecoration.copyWith(hintText:"Email"),
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
                decoration: textInputdecoration.copyWith(hintText:"Password"),
                obscureText: true,
                onChanged: (value){
                  setState(() {
                    pwd=value;
                  });
                  //pwd=value;
                },
                validator: (val){
                  return val!.isEmpty ?'Enter a password':null;
                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      loading=true;
                    });
                    dynamic result=await _auth.loginEmailAndPwd(email, pwd);
                  if(result==null){
                    setState(() {
                      loading=false;
                      error='bad credential';
                    });
                  }
                  }
                },
                child: Text("Sign in")
              ),
              SizedBox(height: 10.0,),
              Text(error,style: TextStyle(fontSize: 14.0,color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}