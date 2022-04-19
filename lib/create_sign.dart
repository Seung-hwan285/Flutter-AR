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

            ),
              SizedBox(
                height: 16,
              ),

              _buildTextFormField("Id",_IdController),
              SizedBox(
                height: 20,
              ),
              _buildTextFormField("Password",_passwordController),
              SizedBox(
                height: 100,
              ),

              new FlatButton(
                onPressed: (){},
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_cornerRadius)
                ),
                padding: EdgeInsets.all(16),
                child: Text("Sign up"),

              ),
              SizedBox(
                height: 100,
              ),


              //
              Divider(height: 50,
                thickness: 1,
                color: Colors.white,
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