import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController =  new TextEditingController();
  TextEditingController emailTextEditingController =  new TextEditingController();
  TextEditingController passwordTextEditingController =  new TextEditingController();

  AuthService authService = new AuthService();



  signMeUp() async{
    if(formKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(

                        controller: userNameTextEditingController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Display name must have a value.";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "username",
                          hintStyle: TextStyle(
                            color: Colors.pink,

                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pink
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: emailTextEditingController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Email must have a value.";
                          } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/="
                          "?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "Email in the wrong format.";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "email",
                          hintStyle: TextStyle(
                            color: Colors.pink,

                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pink
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: passwordTextEditingController,
                        validator: (String? value){
                          if(value == null){
                            return "Password cannot be empty";
                          }else if (value.length < 8){
                            return "Your password must be 8 characters or longer";
                          }else{
                            return "Password acceped";
                          }
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(
                            color: Colors.pink,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.pink
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.pink, fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: (){
                          signMeUp();
                        }
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xDBF1136C),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text("Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ", style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          ),
                          Text("Sign in now", style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ],

                  ),
              ),
            ],

    ),
    ),
      )
    );
  }
}
