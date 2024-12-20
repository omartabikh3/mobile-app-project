import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart';
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/Resrvation.dart';
import 'package:sportcenter/Services.dart';
import 'package:sportcenter/bookings.dart';
import 'package:sportcenter/classes.dart';
import 'package:sportcenter/profile.dart';

import 'package:sportcenter/eg.dart';


class pageservice1 extends StatefulWidget {
  pageservice1({Key ?key}) : super(key: key);

  @override
  _pageservice1State createState() {
    return _pageservice1State();
  }
}

class _pageservice1State extends State<pageservice1> {
  @override
  void initState() {
    super.initState();
  }

  void _navigateToPage(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => home()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bookings()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => profile()),
      );
    }
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
        title: Text('Service',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 30.0),
              child: TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reservation()),
                );
              }, child: Text('Reservation',style: TextStyle(color: Colors.black),),
                style: TextButton.styleFrom(
                  side: BorderSide(width: 2),
                  fixedSize: Size(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  textStyle: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03, // Text size responsive
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 15, horizontal: 30.0),
              child: TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Classes()),);
              }, child: Text('Classes',style: TextStyle(color: Colors.black),),
                style: TextButton.styleFrom(
                  side: BorderSide(width: 2),
                  fixedSize: Size(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.5,
                    MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  textStyle: TextStyle(
                    fontSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.03, // Text size responsive
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _navigateToPage(index);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout')
        ],
      ),
    );
  }
}