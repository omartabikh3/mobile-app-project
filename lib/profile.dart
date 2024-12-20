import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart';
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/Resrvation.dart';
import 'package:sportcenter/Services.dart';
import 'package:sportcenter/bookings.dart';
import 'package:sportcenter/classes.dart';
import 'package:sportcenter/profile.dart';
import 'package:sportcenter/signin.dart';
import 'package:sportcenter/Home.dart';


class profile extends StatefulWidget {
  profile({Key ?key}) : super(key: key);

  @override
  _profileState createState() {
    return _profileState();
  }
}

class _profileState extends State<profile> {
  @override

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
    } else if(index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => signin()),
      );
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
        title: Text('Profile', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _navigateToPage(index);
        },
        currentIndex: 2,
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