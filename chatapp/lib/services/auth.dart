import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class AuthService {

  void snackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _display = TextEditingController();


  void signUp(BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword
        (email: _email.text, password: _password.text);
      ScaffoldMessenger.of(context).clearSnackBars();
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "A user with that email already exists, if it is yo please try logging in")));
      } else if (e.code == 'weak password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("This password is too insecure to be used.")));
      }
      return;
    }

    try {
      await _db
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set({"display_name": _display.text, "email": _email.text});
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Unknown error has occured")));
    }
  }


  void signIn(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword
        (email: _email.text, password: _password.text);
      ScaffoldMessenger.of(context).clearSnackBars();
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                "Email/Password combination is incorrect")));
      }
      return;
    }


  }

  void forgotPassword(BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: _email.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Resent email sent"),
        ));
    } on FirebaseAuthException catch (e) {
      snackBar(context, e.message ?? "Authentication error.");
    } catch (e) {
      snackBar(context, e.toString());
    }
  }



}








