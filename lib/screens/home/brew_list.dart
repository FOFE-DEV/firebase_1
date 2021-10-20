import 'package:firebase_1/models/brew.dart';
import 'package:firebase_1/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({ Key? key }) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final List<Brew>? brews=Provider.of<List<Brew>?>(context);
    /* print("##### taille");

    if(brews!=null){
      print(brews.length);
      print("#####  taille ");
      brews.forEach((element) {print(element.name);});
    }
 */
    if(brews!=null){
        return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context,index){
          return BrewTile(brew:brews[index]);
        },
      );
    }else{
      return ListTile(
        title: Text("No data to show"),
      );
    }
    
  }
}