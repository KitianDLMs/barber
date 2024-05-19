import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(image: AssetImage('images/barba.png'), fit: BoxFit.cover,),
            SizedBox(height: 10),
            Text("Barber Mobile", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}