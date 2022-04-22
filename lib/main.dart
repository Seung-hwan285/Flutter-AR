import 'package:flutter/material.dart';
import 'package:flutter_ar/login_page.dart';
//하 제발 
void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: "hello",
      theme: ThemeData(
      ),
      home: new LoginPage(),
    );
  }
}
