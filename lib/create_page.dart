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

  OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
          color: Colors.transparent, width: 0));

  //
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

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
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final eamilFiled = TextFormField(
      autocorrect: false,
      controller: _nameController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value)  {
        _nameController.text = value!;
      },

      //키보드에 사용할 작업 버튼
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    // 외부 클릭시 키보드 사라지게
   return GestureDetector(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),

      // final secondName =TextFormField(
      //   autocorrect: false,
      //   controller: _secondController,
      //   keyboardType: TextInputType.emailAddress,
      // )
          child: Scaffold(
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
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height : 45),
                    eamilFiled,
                  ],
                ),

              ),
            ),
          ),
        ),
      )
    ),
    );
  //     body: ListView(
  //       padding: EdgeInsets.all(16),
  //       children: <Widget>[
  //
  //         Container(
  //           child: Text("이름",
  //             style: TextStyle(
  //                 fontSize: 20, fontWeight: FontWeight.w600),),
  //         ),
  //         Padding(padding: EdgeInsets.all(1)),
  //         _buildTextFormField("이름을 입력해주세요", _nameController),
  //         Padding(padding: EdgeInsets.all(10)),
  //
  //         Container(
  //           child: Text("휴대폰 번호",
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
  //         ),
  //
  //         Padding(padding: EdgeInsets.all(1)),
  //         _buildTextFormField("(예시) 01010041004", _phoneNumberController),
  //         Padding(padding: EdgeInsets.all(10)),
  //
  //         Container(
  //           child: Text("계정 이메일",
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
  //         ),
  //         Padding(padding: EdgeInsets.all(1)),
  //         _buildTextFormField("계정 이메일을 입력해주세요", _emailController),
  //         Padding(padding: EdgeInsets.all(10)),
  //
  //         Container(
  //           child: Text("비밀번호",
  //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
  //         ),
  //         Padding(padding: EdgeInsets.all(1)),
  //         Padding(padding: EdgeInsets.all(2)),
  //         _passwordTextFormField("비밀번호를 입력해주세요", _passwordController),
  //         Padding(padding: EdgeInsets.all(10)),
  //
  //
  //         Row(
  //           children: <Widget>[
  //             Padding(padding: EdgeInsets.all(27)),
  //             Checkbox(value: isChecked,
  //               onChanged: (value){
  //                 setState(()=> isChecked = value!);
  //               },
  //             ),
  //             Text("개인정보 수집 및 이용 동의 (필수)"),
  //           ],
  //         ),
  //         Padding(padding: EdgeInsets.all(5)),
  //         FlatButton(onPressed: isChecked==true?
  //               (){
  //                 setState(() => isButtonActive = false);
  //                 controller.clear();
  //           }
  //           :null
  //             , child: Text("회원가입"),
  //           color: Colors.lightBlueAccent,
  //           height: 50,
  //           shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8)
  //          ),),
  //       ],
  //     ),
  //   );
  // }

  // TextFormField _passwordTextFormField(String hintText,
  //     TextEditingController controller) {
  //   return TextFormField(
  //     cursorColor: Colors.white,
  //     controller: controller,
  //     validator: (text) {
  //       if (text == null || text.isEmpty) {
  //         return "다시 확인해주세요";
  //       }
  //       return null;
  //     },
  //     style: TextStyle(color: Colors.white),
  //     keyboardType: TextInputType.name,
  //     obscureText: true,
  //     decoration: InputDecoration(
  //         hintText: hintText,
  //         filled: true,
  //         fillColor: Colors.black45,
  //         border: _border,
  //         enabledBorder: _border,
  //         focusedBorder: _border,
  //         hintStyle: TextStyle(color: Colors.white)),
  //   );
  // }
  //
  // TextFormField _buildTextFormField(String hintText,
  //     TextEditingController controller) {
  //   return TextFormField(
  //     cursorColor: Colors.white,
  //     controller: controller,
  //     validator: (text) {
  //       if (text == null || text.isEmpty) {
  //         return "다시 확인해주세요";
  //       }
  //       return null;
  //     },

      //#유저가 입력하면 값을 얻어옴
    //   style: TextStyle(color: Colors.white),
    //   keyboardType: TextInputType.name,
    //   decoration: InputDecoration(
    //       hintText: hintText,
    //       filled: true,
    //       fillColor: Colors.black45,
    //       border: _border,
    //       enabledBorder: _border,
    //       focusedBorder: _border,
    //       hintStyle: TextStyle(color: Colors.white)),
    // );
  }
}
