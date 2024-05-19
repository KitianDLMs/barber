import 'dart:io';

import 'package:barber/admin/admin_login.dart';
import 'package:barber/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/boton_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import 'forgot_password.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(),
                  _Form(),                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPassword()),                        
                      );
                    },
                    child: Labels(titulo: '', subtitulo: 'Recuperar contraseña')),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Labels(titulo: '', subtitulo: 'Registrate')),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AdminLogin()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Labels(titulo: '', subtitulo: 'Admin')),
                  Text(
                    'echnelapp',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  bool obscurePassword = true;

  String? mail, password;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  userLogin() async {
    if (password != null && mail != null) {
      try {
        var log = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
        print(log);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false,
          );
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

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomInput(
              icon: Icons.mail_outline,
              placeholder: 'Correo',
              keyboardType: TextInputType.emailAddress,
              textController: emailcontroller,
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              isPassword: true,
              textController: passwordcontroller,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              obscureText: obscurePassword,
            ),
            BotonAzul(
                text: 'Ingresar',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      mail = emailcontroller.text;
                      password = passwordcontroller.text;
                    });
                  }
                  userLogin();
                })
          ],
        ),
      ),
    );
  }
}