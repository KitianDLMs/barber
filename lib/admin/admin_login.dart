import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/signin.dart';
import 'booking_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String? name, mail, password;

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
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
            child: Text("Admin\nPanel",
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
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [                                                      
                            Text("Username",
                  style: TextStyle(
                      color: Color(0xFFB91635),
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500)),
                            TextFormField(                
                controller: usernamecontroller,
                  decoration: InputDecoration(
                      hintText: 'Username', prefixIcon: Icon(Icons.email_outlined))),
                            SizedBox(height: 40.0),
                            Text("Password",
                  style: TextStyle(
                      color: Color(0xFFB91635),
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500)),
                            TextFormField(                
                controller: userpasswordcontroller,
                  decoration: InputDecoration(
                    hintText: 'password',
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  obscureText: true),
                            SizedBox(height: 60.0),
                            GestureDetector(
                              onTap: () {
                                print('login');
                                loginAdmin();
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
                                                    child: Text("LOG IN",
                                                        style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold)))),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Center(child: TextButton(
                                  onPressed: (){
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignIn()),
                                      (Route<dynamic> route) => false,
                                    );    
                                  },
                                  child: Text('Volver')
                                )
                              ),
                            )
                          ]),
              )),
    ]));
  }

  loginAdmin() {
    print('loginadmin');
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) =>  {
      snapshot.docs.forEach((result) {
        var usrController = usernamecontroller.text.trim();        
        var rslt = result.data()['id'];
        print(usrController);
        print(rslt);
        if (usrController == rslt) {
          print('==');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BookingAdmin()),
            (Route<dynamic> route) => false,
          );
        } else if (result.data()['id'].trim() != usernamecontroller.text.trim()) { 
          
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tu id no es correcto', style: TextStyle(fontSize: 20.0))));
        } else if (result.data()['password'].trim() != userpasswordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tu id no es correcto', style: TextStyle(fontSize: 20.0))));
        } else  {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BookingAdmin()),
            (Route<dynamic> route) => false,
          );
        }
      })
    });
  }
}