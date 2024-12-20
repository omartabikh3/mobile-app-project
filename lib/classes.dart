

import 'package:flutter/material.dart';
import 'package:sportcenter/Services.dart';
import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart';
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/Resrvation.dart';
import 'package:sportcenter/Services.dart';
import 'package:sportcenter/bookings.dart';
import 'package:sportcenter/classes.dart';
import 'package:sportcenter/profile.dart';
import 'package:sportcenter/signin.dart';

class Classes extends StatefulWidget {
  Classes({Key? key}) : super(key: key);

  @override
  _ClassesState createState() {
    return _ClassesState();
  }
}

class _ClassesState extends State<Classes> {
  List<DateTimeContainer> dateTimeList = [
    DateTimeContainer(date: '2024-12-20', time: '12:00 PM'),
    DateTimeContainer(date: '2024-12-21', time: '3:00 PM'),
    DateTimeContainer(date: '2024-12-22', time: '6:00 PM'),
  ];

  int? selectedIndex;

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

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = null;
      } else {
        selectedIndex = index;
      }
    });
  }

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget displayDateTimeList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dateTimeList.length,
      itemBuilder: (context, index) {
        return dateTimeList[index].buildContainer(
          isSelected: selectedIndex == index,
          onTap: () => toggleSelection(index),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Classes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              displayDateTimeList(),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => services()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.grey[500],
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
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

class DateTimeContainer {
  final String date;
  final String time;

  DateTimeContainer({required this.date, required this.time});

  Widget buildContainer({
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: onTap, // Toggle selection
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                isSelected ? Colors.blue[100] : null,
              ),
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
              alignment: Alignment.center,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Date: $date',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Time: $time',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Classes(),
  ));
}
