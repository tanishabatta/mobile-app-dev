import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;


  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;





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
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: emailEditingController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Email must have a value" ;
                  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/="
                  "?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Email in the wrong format" ;
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
                controller: passwordEditingController,

                obscureText: true,
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
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xDBF1136C),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Sign in",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  ),
                  Text("Register now", style: TextStyle(
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
      ),
    );
  }
}

