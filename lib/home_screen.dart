import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() =>_HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 150,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}