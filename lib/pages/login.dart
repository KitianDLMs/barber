import 'package:barber/pages/forgot_password.dart';
import 'package:barber/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? mail, password;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userLogin() async {    
    if (password != null && mail != null) {
      try {
        var log = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);        
        print('LOG -> $log');
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => Home()),
        //     (Route<dynamic> route) => false,
        //   );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {        
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Problemas con sus credenciales", style: TextStyle(fontSize: 18.0, color: Colors.white),)));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Problemas con sus credenciales", style: TextStyle(fontSize: 18.0, color: Colors.white),)));
        } else if (e.code == 'network-request-failed') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Problemas con su conexión a internet", style: TextStyle(fontSize: 18.0, color: Colors.white),)));
        }
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          // margin: EdgeInsets.only(top: 40, left: 20),
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFB91635),
            Color(0xff621d3c),
            Color(0xFF311937)
          ])),
          child: Container(
            padding: EdgeInsets.only(top: 50.0, left: 30),
            child: Text("Hello\nSign in!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold)),
          )),
      Container(
          padding:
              EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
          child:
              Form(
                key: _formKey  ,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text("Gmail",
                  style: TextStyle(
                      color: Color(0xFFB91635),
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500)),
                            TextFormField(
                              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Porfavor ingrese su email';
                  }
                  return null;
                },
                controller: emailcontroller,
                  decoration: InputDecoration(
                      hintText: 'Gmail', prefixIcon: Icon(Icons.email_outlined))),
                            SizedBox(height: 40.0),
                            Text("Password",
                  style: TextStyle(
                      color: Color(0xFFB91635),
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500)),
                            TextFormField(
                              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Porfavor ingrese su contraseña';
                  }
                  return null;
                },
                controller: passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  obscureText: true),
                            SizedBox(height: 30.0),
                            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),                        
                      );
                    },
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            color: Color(0xFF311937),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
                            ),
                            SizedBox(height: 60.0),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    mail = emailcontroller.text;
                                    password = passwordcontroller.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                                width: MediaQuery.of(context).size.width,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    Color(0xFFB91635),
                                                    Color(0xff621d3c),
                                                    Color(0xFF311937)
                                                  ]),
                                                  borderRadius: BorderRadius.circular(30),
                                                ),
                                                child: Center(
                                                    child: Text("SIGN IN",
                                                        style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)))),
                            ),
                            Spacer(),
                            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have account?",
                      style: TextStyle(
                          color: Color(0xFF311937),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500)),
                ],
                            ),
                            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sign up",
                        style: TextStyle(
                            color: Color(0xFF311937),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                            )
                          ]),
              )),
    ]));
  }
}
