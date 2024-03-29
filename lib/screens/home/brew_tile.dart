import 'package:flutter/material.dart';
import 'package:firebase_1/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  const BrewTile({ Key? key, required this.brew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} Sugar(s)'),
        ),
      ),
    );
  }
}