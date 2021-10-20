import 'package:flutter/material.dart';
import 'package:firebase_1/shared/constant.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({ Key? key }) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final formKey =GlobalKey<FormState>();
  final List<String> sugars=['0','1','2','3','4'];
  int _ratingController=0;
  //form values
  String? _currentName;
  String _currentSugar="0";
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, 
      child: Column(
        children: [
          Text('Update your Brew settings',style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputdecoration,
            validator:(val){
              return val!.isEmpty?"please enter a name":null;
            },
            onChanged: (val){
              setState(() {
                _currentName=val;
              });
            },  
          ),
          SizedBox(height: 20.0,),
          DropdownButtonFormField<int>(
            decoration: textInputdecoration,
            value: _ratingController,
            items: [0,1, 2, 3, 4, 5]
                .map((label) => DropdownMenuItem(
              child: Text('$label sugars'),
              value: label,
            ))
                .toList(),
            hint: Text('Rating'),
            onChanged: (int? value) {
              setState(() {
               // _ratingController = value!;
                _currentSugar = value.toString();
              });
            },
          ),
          ElevatedButton(
            onPressed: (){
              print(_currentName);
              print(_currentSugar);
              print(_currentStrength);
            },
            
            child: Text("Update")
          )
        ],
      ),
      
    );
  }
}