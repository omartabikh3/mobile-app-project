import 'package:flutter/material.dart';
import 'package:sportcenter/HomePage.dart';
import 'package:sportcenter/Services.dart';

class Reservation extends StatefulWidget {
  Reservation({Key? key}) : super(key: key);

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<String> hrs = [
    '1:00',
    '2:00',
    '3:00',
    '4:00',
    '5:00',
    '6:00',
    '7:00',
    '8:00',
    '9:00',
    '10:00',
    '11:00',
    '12:00',
  ];

  final List<String> minutes = List.generate(60, (index) {
    return index.toString().padLeft(2, '0');
  });

  final List<String> dn = ['AM', 'PM'];

  String? selectedMonth;
  int? selectedDay;
  String? selectedHour;
  String? selectedMinute;
  String? selectedPeriod; // AM/PM

  List<int> days = [];
  bool showDateDropdown = false;
  bool showTimeDropdown = false;

  double container1h = 0.06;
  double container2h = 0.06;

  void changeContainer1Size() {
    setState(() {
      if (container1h == 0.06) {
        container1h = 0.15;
      } else {
        container1h = 0.06;
      }
    });
  }

  void changeContainer2Size() {
    setState(() {
      if (container2h == 0.06) {
        container2h = 0.15;
      } else {
        container2h = 0.06;
      }
    });
  }

  void updateDays(String? month) {
    if (month == null) return;

    int daysInMonth;
    switch (month) {
      case 'February':
        daysInMonth = 28;
        break;
      case 'April':
      case 'June':
      case 'September':
      case 'November':
        daysInMonth = 30;
        break;
      default:
        daysInMonth = 31;
    }

    setState(() {
      selectedMonth = month;
      selectedDay = null;
      days = List.generate(daysInMonth, (index) => index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reservation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // Container 1 - Date selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * container1h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          changeContainer1Size();
                          showDateDropdown = !showDateDropdown;
                        });
                      },
                      child: Text(
                        showDateDropdown ? 'Date' : 'Date',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.05,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    // Date dropdown visibility toggle
                    Visibility(
                      visible: showDateDropdown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          // Month dropdown
                          Material(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButton<String>(
                                style: TextStyle(fontSize: 15),
                                value: selectedMonth,
                                hint: Text("Month", style: TextStyle(fontWeight: FontWeight.bold),),
                                underline: SizedBox(),
                                items: _months.map((String month) {
                                  return DropdownMenuItem<String>(
                                    value: month,
                                    child: Text(month),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  updateDays(newValue);
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          // Day dropdown
                          Material(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButton<int>(
                                style: TextStyle(fontSize: 15),
                                value: selectedDay,
                                hint: Text("Day", style: TextStyle(fontWeight: FontWeight.bold),),
                                underline: SizedBox(),
                                items: days.map((int day) {
                                  return DropdownMenuItem<int>(
                                    value: day,
                                    child: Text(day.toString()),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  setState(() {
                                    selectedDay = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container 2 - Time selection
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * container2h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          changeContainer2Size();
                          showTimeDropdown = !showTimeDropdown;
                        });
                      },
                      child: Text(
                        showTimeDropdown ? 'Time' : 'Time',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.05,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    // Time dropdown visibility toggle
                    Visibility(
                      visible: showTimeDropdown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          // Hour dropdown
                          Material(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButton<String>(
                                style: TextStyle(fontSize: 15),
                                value: selectedHour,
                                hint: Text("Hour", style: TextStyle(fontWeight: FontWeight.bold),),
                                underline: SizedBox(),
                                items: hrs.map((String hour) {
                                  return DropdownMenuItem<String>(
                                    value: hour,
                                    child: Text(hour),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedHour = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20), // Space between Hour and Minute

                          SizedBox(width: 20), // Space between Minute and AM/PM

                          // AM/PM dropdown
                          Material(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: DropdownButton<String>(
                                style: TextStyle(fontSize: 15),
                                value: selectedPeriod,
                                hint: Text("AM", style: TextStyle(fontWeight: FontWeight.bold),),
                                underline: SizedBox(),
                                items: dn.map((String period) {
                                  return DropdownMenuItem<String>(
                                    value: period,
                                    child: Text(period),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedPeriod = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => services()),);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                      MediaQuery
                      .of(context)
                      .size
                      .width * 0.4, 50), // Button width and height
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Reservation(),
  ));
}
