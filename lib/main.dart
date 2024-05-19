import 'dart:io';

import 'package:barber/pages/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid 
  ?
    await Firebase.initializeApp(
        options: FirebaseOptions(
        apiKey: 'AIzaSyBSBCKHtNx6HJLyhx3hmwEZJZuL8RXgFuo',
        appId: '1:320550566678:android:70eb209919b9294f02ae37',
        messagingSenderId: 'sendid',
        projectId: 'barber-8b2b2',
        storageBucket: 'myapp-b9yt18.appspot.com',
      )
    ) 
  :
    await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignIn(),      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/my_bg.png')),
            ),
            child: const Column(children: [Center(child: Text('Ok'))])));
  }
}
