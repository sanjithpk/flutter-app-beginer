import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
      ),
      body: Center(
        child: FlatButton(onPressed: (){
          Navigator.of(context).pop();  //Nacigator.pop(context);
        },
         child: Text("You are in Screen 2"),),
      ),
    );
  }
}