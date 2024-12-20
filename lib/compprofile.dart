import 'package:flutter/material.dart';
import 'package:sportcenter/signin.dart';

class compprofile extends StatefulWidget {
  compprofile({Key ?key}) : super(key: key);

  @override
  _compprofileState createState() {
    return _compprofileState();
  }
}

class _compprofileState extends State<compprofile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();

  String age = '';

  final List<String> genderop = ['Choose Gender', 'Male', 'Female'];
  String? selectedg;

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
        title: Text('Complete Your Profile',
          style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: IconButton(onPressed: (){
              
            }, icon: Image.network(
              'assets/pp.png',
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.left,
              controller: namecontroller,
            ),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),

              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              controller: phonecontroller,
            ),
          ),
          Padding(

            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30.0),
            child:Row(
              children: [
                Expanded(
                  flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your BirthDay',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      controller: daycontroller,
                    ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your BirthMonth',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      controller: monthcontroller,
                    ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your BirthYear',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),

                      ),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left,
                      controller: yearcontroller,
                    ),
                ),
              ],
            ), 
            
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButton<String>(
                    value: selectedg,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Select Your Gender"),
                    items: [
                      DropdownMenuItem(value: 'Male', child: Text('Male')),
                      DropdownMenuItem(value: 'Female', child: Text('Female')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedg = value;
                      });
                    },
                  ),
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  age = '${daycontroller.text}/${monthcontroller.text}/${yearcontroller.text}';
                });
                print(age);
                Navigator.push(context,MaterialPageRoute(builder: (context) => signin()),);
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
                'Complete Profile',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}