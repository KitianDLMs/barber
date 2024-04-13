import 'package:flutter/material.dart';

import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b1615),
        body: Container(
          margin: const EdgeInsets.only(top: 90.0),
          child: Column(children: [
            Image.asset("images/barber.png"),
            SizedBox(height: 50.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFdf711a),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("Get a stylish haircut",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold))),
            )
          ]),
        ));
  }
}
