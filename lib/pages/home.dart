import 'package:flutter/material.dart';

import 'booking.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b1615),
        body: Container(
            margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola,",
                        style: TextStyle(
                            color: Color.fromARGB(197, 255, 255, 255),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500)),
                    Text("Kitian De Las Mujeres",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("images/boy.jpg",
                      height: 60, width: 60, fit: BoxFit.cover),
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
                  SizedBox(width: 20.0),
                  Flexible(
                    fit: FlexFit.tight,
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
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
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
                  SizedBox(width: 20.0),
                  Flexible(
                    fit: FlexFit.tight,
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
                ],
              )
            ])));
  }
}
