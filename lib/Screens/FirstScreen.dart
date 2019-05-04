import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/SecondScreen.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 1"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
          child: Text("You are in Screen 1"),
        ),
      ),
    );
  }
}