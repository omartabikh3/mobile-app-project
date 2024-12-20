import 'package:flutter/material.dart';
import 'package:sportcenter/signin.dart';

class newpass extends StatefulWidget {
  newpass({Key ?key}) : super(key: key);

  @override
  _newpassState createState() {
    return _newpassState();
  }
}

class _newpassState extends State<newpass> {
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController cnewpasscontroller = TextEditingController();
  String errorMessage = '';
  bool isObs = true;
  bool isObs1 = true;

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text('New Password', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 30, horizontal: 20.0),
              child: TextField(
                obscureText: isObs,
                decoration: InputDecoration(
                  hintText: 'Enter New Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObs ? Icons.visibility : Icons.visibility_off,
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
                controller: newpasscontroller,
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: isObs1,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isObs1 ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isObs1 = !isObs1;
                      });
                    },),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.left,
                controller: cnewpasscontroller,
              ),
            ),
            SizedBox(height: 30,),
            if(errorMessage != null)
              Text(errorMessage!, style: TextStyle(color: Colors.red),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (newpasscontroller.text == cnewpasscontroller.text) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signin()),);
                  } else {
                    setState(() {
                      errorMessage =
                      'Passwords do not match. Please try again.';
                      newpasscontroller.clear();
                      cnewpasscontroller.clear();
                    });
                  }
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
                  'Create New Password',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}