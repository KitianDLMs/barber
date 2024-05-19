import 'package:barber/pages/home.dart';
import 'package:barber/pages/signin.dart';
import 'package:barber/services/database.dart';
import 'package:barber/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../widgets/boton_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height:  MediaQuery.of(context).size.height * 0.9,                  
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(),
                  _Form(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                        (Route<dynamic> route) => false,
                      );                    
                    },
                    child: Labels(
                        titulo: '¿Ya tienes una cuenta?',
                        subtitulo: '¡Ingresa aqui!'),
                  ),
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
  String? name, mail, password;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail!, password: password!);
        String id = randomAlphaNumeric(10);
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserEmail(emailcontroller.text);
        await SharedpreferenceHelper().saveUserImage("https://cdn-icons-png.freepik.com/512/147/147142.png");
        await SharedpreferenceHelper().saveUserId(id);
        Map<String, dynamic> userInfoMap = {
          "username": namecontroller.text,
          "Email": emailcontroller.text, 
          "Id ": id,
          "Image": "https://cdn-icons-png.freepik.com/512/147/147142.png"
        };
        await DatabaseMethods().addUserDetails(userInfoMap , id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registrado correctamente', style: TextStyle(fontSize: 20.0))));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('La contraseña es muy corta', style: TextStyle(fontSize: 20.0))));
        } else if(e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ya existe esa cuenta', style: TextStyle(fontSize: 20.0))));
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
              icon: Icons.person_outline,
              placeholder: 'Nombre',
              textController: namecontroller,
            ),
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
            ),
           
            BotonAzul(
                text: 'Registrar',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      mail = emailcontroller.text;
                      name = namecontroller.text;
                      password = passwordcontroller.text;
                    });
                  } else {
                  }
                  registration();
                })
          ],
        ),
      ),
    );
  }
}