import 'package:flutter/material.dart';

import 'create_sign.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String _email;
  late String _password;

  TextEditingController _emilController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  static final _cornerRadius = 8.0;
  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_cornerRadius),
      borderSide: BorderSide(
          color: Colors.transparent,width: 0));

  bool isRegister = true;
  Duration _duration = Duration(milliseconds: 300);
  Curve _curve = Curves.fastOutSlowIn;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Form is valid Email: $_email, password: $_password');
    } else {
      print('Form is invalid Email: $_email, password: $_password');
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
              ButtonBar(

                children: [
                TextButton(onPressed: () {
                  setState(() {

                    // false 연한거
                    isRegister = false;

                  });
                },
                    child: Text("Login", style: TextStyle(fontSize: 18,
                        fontWeight: isRegister?FontWeight.w400:FontWeight.w600 ,
                        color: isRegister?Colors.black45:Colors.black87),
                    )),
                  TextButton(onPressed: (){

                    Navigator.push(context,

                    MaterialPageRoute(builder: (context)=>CreateApp()),
                    );
                    setState(() {
                      // true 일때는 진하게
                        isRegister = true;
                    });
                },
                      child: Text(
                        "Register",style: TextStyle(fontSize: 20,
                          fontWeight: isRegister?FontWeight.w600:FontWeight.w400  ,
                          color: isRegister?Colors.black87:Colors.black45),
                    ))
              ],),
              _buildTextFormField("Email",_emilController),
              SizedBox(
                height: 8,
              ),
              _buildTextFormField("Password",_passwordController),
              SizedBox(
                height: 8,
              ),
              AnimatedContainer(
                  duration: _duration,
                  curve: _curve,
                  height: isRegister?60:0,
                  child: _buildTextFormField("Confirm Password",_cPasswordController)),
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
                child: Text(isRegister?"Register":"Login"),
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

  Container _buildContainer(String imagePath, onPressed) {
    return Container(
      width:50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey),
      child: IconButton(
          icon: ImageIcon(
              AssetImage(imagePath)),
          onPressed: onPressed),
    );
  }
}