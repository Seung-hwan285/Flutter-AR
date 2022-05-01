import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CreatePage extends StatefulWidget {

  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isButtonActive = true;
  late TextEditingController controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;



  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
          color: Colors.transparent, width: 0));

  //test
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState(){
    super.initState();

    controller = TextEditingController();
    controller.addListener((){
      final isButtonActive = controller.text.isNotEmpty;


      setState(() => this.isButtonActive=isButtonActive);
    });
  }

  @override
  Widget build(BuildContext context) {

    final firstNameField = TextFormField(
      autocorrect: false,
      controller: _nameController,
      keyboardType: TextInputType.emailAddress,


      onSaved: (value)  {
        _nameController.text = value!;
      },

      //키보드에 사용할 작업 버튼

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(

        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    final passwordFiled = TextFormField(
      autocorrect: false,
      controller: _passwordController,
      obscureText: true,

      validator:(value)=> value!.length < 6 ? 'Enter a 6 password': null,

      onSaved: (value)  {
        _passwordController.text = value!;
      },

      //키보드에 사용할 작업 버튼
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    final confirmPasswordFiled = TextFormField(
      autocorrect: false,
      controller: _confirmPasswordController,
      obscureText: true,

      onSaved: (value){
        _confirmPasswordController.text = value!;
      },

      textInputAction:  TextInputAction.done,

      validator: (value)=>value!.length < 6 ? 'Enter a 6 password':null,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'confirmPassword',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

    );



    final IdFiled = TextFormField(
      autocorrect: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,


      onSaved: (value){
        _emailController.text = value!;
      },



      validator: (value)=> value!.isEmpty ? 'Id is Empty': null,
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Id',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );



    // Material 디자인 버튼 생성
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: ()async {

         await Firebase.initializeApp();

         // 회원가입 기능
          if(formKey.currentState!.validate()){
              _register();
          }
        },
        minWidth: MediaQuery.of(context).size.width,
        child:
        Text('sign up',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
      ),
    );

    // 외부 클릭시 키보드 사라지게
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },


      // final secondName =TextFormField(
      //   autocorrect: false,
      //   controller: _secondController,
      //   keyboardType: TextInputType.emailAddress,
      // )
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[


     
                        SizedBox(height : 20),
                        IdFiled,

                        SizedBox(height: 20),
                        passwordFiled,
                        SizedBox(height: 20),


                        SizedBox(height: 50),
                        signUpButton,

                      ],
                    ),

                  ),
                ),

              ),
            ),
          )
      ),
    );

  }


  // 회원가입 메소드
  void _register() async {

    final User? user=(await
    _auth.createUserWithEmailAndPassword(
      // trim() 안하면 format 에러발생
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      )
    ).user;


  }
}

