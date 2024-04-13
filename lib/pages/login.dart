import 'package:flutter/material.dart';

import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Gmail",
                style: TextStyle(
                    color: Color(0xFFB91635),
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500)),
            TextField(
                decoration: InputDecoration(
                    hintText: 'Gmail', prefixIcon: Icon(Icons.email_outlined))),
            SizedBox(height: 40.0),
            Text("Password",
                style: TextStyle(
                    color: Color(0xFFB91635),
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500)),
            TextField(
                decoration: InputDecoration(
                  hintText: 'password',
                  prefixIcon: Icon(Icons.password_outlined),
                ),
                obscureText: true),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?",
                    style: TextStyle(
                        color: Color(0xFF311937),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 60.0),
            Container(
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
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)))),
    ]));
  }
}
