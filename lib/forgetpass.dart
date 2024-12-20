import 'package:flutter/material.dart';
import 'package:sportcenter/newpass.dart';
import 'package:sportcenter/signin.dart';

class forgetpass extends StatefulWidget {
  forgetpass({Key ?key}) : super(key: key);

  @override
  _forgetpassState createState() {
    return _forgetpassState();
  }
}

class _forgetpassState extends State<forgetpass> {
  @override
  final List<String> code = ["", "", "", ""];

  void updateCode(int index, String value) {
    setState(() {
      code[index] = value;
    });
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

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
        title: Text('Verify Code',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Please enter the code we just sent to the\nemail: Example@email.com',
              textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onChanged: (value) => updateCode(index, value),
                ),
                );
              }),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: () {

            },
                child: Text(
                  'Resend Code', style: TextStyle(color: Colors.grey,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey),)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => newpass()),);
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
                  'Verify',
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
