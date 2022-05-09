import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ar/login_page.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class HomeScreen extends StatefulWidget{

  @override
  _HomeScreenState createState() =>_HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen>{
  final _authentication = FirebaseAuth.instance;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("logout"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            onPressed: (){
              _authentication.signOut();

              //return Navigator.pop(context);

              //Navigator.of(context).maybePop();

              //Navigator.maybePop(context);
              //뒷 페이지가 없는 상태에서 Pop을 하게 된다면 blackScreen 이 뜬다.

              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>LoginPage()));

             // Get.offAll(()=> LoginPage());


            },
          )
        ],
        //centerTitle: true,
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