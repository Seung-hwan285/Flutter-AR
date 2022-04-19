import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateApp extends StatelessWidget{

  static const String _title = 'Sample App';
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: Text(_title),),
      body: CreateStateFul(),
    );
  }
}

class CreateStateFul extends StatefulWidget{
  State<CreateStateFul> createState()=> _CreateStateFul();
}

class _CreateStateFul extends State<CreateStateFul>{

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConntroller = TextEditingController();


  Widget build(BuildContext context){


    return Padding(padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              '회원가입',
            ),

          )
        ],
      ),
    );
  }

}