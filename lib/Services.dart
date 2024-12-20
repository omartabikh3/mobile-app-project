import 'package:flutter/material.dart';
import 'package:sportcenter/Home.dart';// Import Home page
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/Pageservice2.dart';
import 'package:sportcenter/Privatesessions.dart';
import 'package:sportcenter/bookings.dart'; // Import Bookings page
import 'package:sportcenter/profile.dart'; // Import Profile page
import 'package:sportcenter/Pageservice1.dart';
class services extends StatefulWidget {
  services({Key? key}) : super(key: key);

  @override
  _servicesState createState() {
    return _servicesState();
  }
}

class _servicesState extends State<services> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ElevatedButton costumEB({
    required Image image,
    required String text,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.3, // 40% of screen width
          MediaQuery.of(context).size.height * 0.2, // 20% of screen height
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08, // Image height (8% of screen height)
            child: image,
          ),
          SizedBox(height: 10), // Adjust spacing between image and text
          Text(
            text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.02, // Responsive text size
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  costumEB(
                    image: Image.network('assets/soccer.jpeg', fit: BoxFit.contain),
                    text: 'Soccer',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageservice1()),);

                    },
                    context: context,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  costumEB(
                    image: Image.network('assets/basketball.png', fit: BoxFit.contain),
                    text: 'Basketball',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageservice1()),);
                    },
                    context: context,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  costumEB(
                    image: Image.network('assets/padel.jpeg', fit: BoxFit.contain),
                    text: 'Padel',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageservice1()),);
                    },
                    context: context,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  costumEB(
                    image: Image.network('assets/pool.jpeg', fit: BoxFit.contain),
                    text: 'Pool',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageservice2()),);
                    },
                    context: context,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  costumEB(
                    image: Image.network('assets/gym.jpeg', fit: BoxFit.contain),
                    text: 'Gym',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pageservice2()),);
                    },
                    context: context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _navigateToPage(index);
        },
        currentIndex: 0,
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
