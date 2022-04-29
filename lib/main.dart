import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar/login_page.dart';
//하 제발 
void main(){

  // 호출할 수 있게 함수가 생긴거고
  // 사용할수 있게 추가해주는거거
 // WidgetsFlutterBinding.ensureInitialized();
 //  Firebase.initializeApp();
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
