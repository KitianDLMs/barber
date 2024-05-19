import 'package:barber/pages/login.dart';
import 'package:barber/pages/signin.dart';
import 'package:barber/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'booking.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> _signOut() async {
    try {
      await _auth.signOut();      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SignIn()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hasta pronto', style: TextStyle(fontSize: 20.0))));
    } catch (e) {
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error al hacer logout', style: TextStyle(fontSize: 20.0))));      
    }
  }

  String? name, image;

  getthedatafromsharedpref() async {    
    String email = _auth.currentUser!.email.toString();
    String firstPart = email.split('@')[0];
    
    name = firstPart;

    image = await SharedpreferenceHelper().getUserImage();
    setState(() {
      
    });
  }

  getontheload() async {
    await getthedatafromsharedpref();
    setState(() {
      
    });
  }

  @override
  void initState() {
    
    getontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b1615),
        body: Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child:
                SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hola,",
                          style: TextStyle(
                              color: Color.fromARGB(197, 255, 255, 255),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500)),
                      Text(name == null ? 'NAN' : name!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: image != null ? Image.network(image!,
                        height: 60, width: 60, fit: BoxFit.cover) 
                        : Image.asset('images/notimageprofile.png', height: 60, width: 60, fit: BoxFit.cover)
                  )
                                ]),
                                SizedBox(height: 20.0),
                                Divider(color: Colors.white30),
                                SizedBox(height: 20.0),
                                Text("Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20.0),
                                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Classic Shaving")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/shaving.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Classic Shaving",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Hair Washing")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/hair.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Hair Washing",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ],
                                ),
                                SizedBox(height: 30.0),
                                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Hair cutting")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/cutting.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Hair cutting",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Beard Trimming")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/beard.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Beard Trimming",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                  ],
                                ),
                                SizedBox(height: 30.0),
                                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Facials")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/facials.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Facials",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Booking(service: "Kids HairCutting")));
                        },
                        child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFFe29452),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/kids.png",
                                    height: 80, width: 80, fit: BoxFit.cover),
                                SizedBox(height: 10.0),
                                Text("Kids HairCutting",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                
                              ],                            
                            )),
                      ),
                    ),
                    
                  ],
                                ),   
                                SizedBox(height: 30.0),
                                Row(
                  children: [                
                    SizedBox(width: 20.0),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: () {
                          _signOut();
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),                            
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 241, 15, 26),                              
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: Colors.white,),                              
                                Text("Salir",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold)),
                                
                              ],                            
                            )),
                      ),
                    ),
                    
                  ],
                                ),              
                              ]),
                )));
  }
}
