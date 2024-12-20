import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart';
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/forgetpass.dart';
import 'package:sportcenter/signup.dart';

class signin extends StatefulWidget {
  signin({Key ?key}) : super(key: key);

  @override
  _signinState createState() {
    return _signinState();
  }
}

class _signinState extends State<signin> {
  @override
  TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  bool isObs = true;

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hi! Welcome back, you\'ve beeen missed'),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                controller: emailcontroller,
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: isObs,
                decoration: InputDecoration(
                  hintText: 'Enter your password',

                  suffixIcon: IconButton(
                    icon: Icon(
                      isObs ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isObs = !isObs;
                      });
                    },),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                controller: passwordcontroller,
              ),
            ),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => forgetpass()),);
              }, child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                  Text('Forget Password!', style: TextStyle(fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                      color: Colors.grey),),
                ),
              ],
            ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery
                      .of(context)
                      .size
                      .width * 0.7, 50), // Button width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.grey[500],
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text('___________________________________________________'),
            SizedBox(height: 34,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery
                      .of(context)
                      .size
                      .width * 0.7, 50,
                  ), // Button width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.grey[500],
                ),
                child:Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/google.jpeg', height: 30, width: 30,),
                      SizedBox(width: 10),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Don\'t have an account!', style: TextStyle(fontSize: 16),),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()),);
                }, child: Text('Sign up', style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.lightBlue, color: Colors.lightBlue, fontSize: 16),))

              ],
            ),
          ],
        ),
      ),
    );
  }
}