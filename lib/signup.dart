import 'package:flutter/material.dart';
import 'package:sportcenter/compprofile.dart';
import 'package:sportcenter/signin.dart';

class signup extends StatefulWidget {
  signup({Key ?key}) : super(key: key);

  @override
  _signupState createState() {
    return _signupState();
  }
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isObs = true;
  @override
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
        title: Text('Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Fill your information below or register\nwith your social account',
              textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30.0),
              child: TextField(
                obscureText: isObs,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => compprofile()),);
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
                  'Sign Up',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            Text('___________________________________________________'),
            SizedBox(height: 34,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signin()),);
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
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Already have an account!', style: TextStyle(fontSize: 16),),
                TextButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signin()),);
                }, child: Text('Sign in', style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.lightBlue, color: Colors.lightBlue, fontSize: 16),))

              ],
            )
          ],
        ),
      ),
    );
  }
}