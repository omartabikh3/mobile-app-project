import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart'; // Ensure correct import for HomePage
import 'package:sportcenter/Privatesessions.dart';
import 'package:sportcenter/Services.dart';
import 'package:sportcenter/Resrvation.dart';
import 'package:sportcenter/Pageservice1.dart';
import 'package:sportcenter/Pageservice2.dart';
import 'package:sportcenter/classes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(), // Directly point to FPage
    );
  }
}

class FPage extends StatefulWidget {
  const FPage({Key? key}) : super(key: key);

  @override
  _FPageState createState() => _FPageState();
}

class _FPageState extends State<FPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          'LOGO',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
