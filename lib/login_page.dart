import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ar/home_screen.dart';
import 'create_page.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String _id;
  late String _password;

  TextEditingController _IdController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static final _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_cornerRadius),
      borderSide: BorderSide(
          color: Colors.transparent,width: 0));

  var logger;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_id, password: $_password');
    } else {
      print('Form is invalid Email: $_id, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: new Container(
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: new Form(
          key: formKey,
          child: new ListView(
            reverse: true,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[CircleAvatar(
              backgroundColor: Colors.white54,
              radius: 100 ,
              child: Image.asset("assets/augmented-reality.png"),
            ),
              SizedBox(
                height: 16,
              ),
              ButtonBar(children: [
                FlatButton(onPressed: () {
                },

                    child: Text("Login", style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600 ,
                        color: Colors.black87),
                    )),


                FlatButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>CreatePage()));
                },

                    child: Text(
                      "Register",style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w600  ,
                        color: Colors.black87),
                    ))
              ],),
              _buildTextFormField("Id",_IdController),
              SizedBox(
                height: 8,
              ),
              _buildPasswordFormFiled("Password",_passwordController),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 16,
              ),

              new FlatButton(
                onPressed: () async {
                  try{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _IdController.text,
                      password: _passwordController.text,
                    );
                    Get.offAll(()=> HomeScreen());
                  } on FirebaseAuthException catch(e){
                    print(e);

                    //logger.e(e);
                    String message =' ';

                    if(e.code == 'user-not-found'){
                      message = '사용자가 존재하지 않습니다.';
                    }else if (e.code == 'wrong-password') {
                      message = '비밀번호를 확인하세요';
                    } else if (e.code == 'invalid-email') {
                      message = '이메일을 확인하세요.';
                    }
                    print(message);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.deepOrange,),);
                  }
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_cornerRadius)
                ),
                padding: EdgeInsets.all(16),
                child: Text("Login"),
              ),
              Divider(height: 31,
                thickness: 1,
                color: Colors.black54,
                indent: 16,
                endIndent: 16,),

            ].reversed.toList(),
          ),
        ),
      ),
    );
  }

  TextFormField _buildPasswordFormFiled(String passwordText, TextEditingController controller){

    return TextFormField(

      cursorColor:  Colors.white,
      controller:  controller,
      obscureText: true,

      onSaved: (value) {
        _passwordController.text=value!;
      },

      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(

        prefixIcon: Icon(Icons.lock),
        labelText: passwordText,
        filled: true,
        fillColor: Colors.black54,

        border: _border,

        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: _border,
        focusedBorder: _border,
      ),
    );
  }

  TextFormField _buildTextFormField(String labelText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "이메일을 확인해주세요";
        }
        return null;
      },

      onSaved: (value) {
        _IdController.text=value!;
      },
      style: TextStyle(color: Colors.white),
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        labelText: labelText,
        filled: true,
        fillColor: Colors.black45,
        border: _border,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: _border,
        focusedBorder: _border,),

    );
  }
}