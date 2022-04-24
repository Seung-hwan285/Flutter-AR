import 'package:flutter/material.dart';

import 'create_page.dart';


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
    return new Scaffold(
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
              _buildTextFormField("Password",_passwordController),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 16,
              ),
              new FlatButton(
                onPressed: (){},
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




  TextFormField _buildTextFormField(String labelText, TextEditingController controller) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      validator: (text){
        if(text==null||text.isEmpty){
          return "Email can\'t be empty";
        }

        return null;
      },
      style: TextStyle(color: Colors.white),
      decoration: new InputDecoration(
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