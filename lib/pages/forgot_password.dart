import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  String? email;
  TextEditingController emailcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password reset email has been sent!', style: TextStyle(fontSize: 20.0))));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for the email', style: TextStyle(fontSize: 20.0))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70.0,),
            Container(
              alignment: Alignment.topCenter,
              child: Text("Password recovery", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10.0,),
            Text("Enter your email", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
            SizedBox(height: 30.0,),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.only(left: 30.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 2.0), borderRadius: BorderRadius.circular(30)
                ),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 18.0, color: Colors.white
                    ),
                    prefixIcon: Icon(Icons.mail_outline, color: Colors.white60, size: 30.0,)
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Color(0xFFdf711a), borderRadius: BorderRadius.circular(10)),
                        child: Text("Send email", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}