import 'package:flutter/material.dart';
import 'package:sportcenter/Pageservice1.dart';

void main() {
  runApp(MaterialApp(home: ReservationWidget()));
}

class ReservationWidget extends StatefulWidget {
  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  // List of months
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

  // Selected values
  String? _selectedMonth;
  int? _selectedDay;

  // List of days (dynamically updated based on the month)
  List<int> _days = [];

  // Function to update days based on the selected month
  void _updateDays(String? month) {
    if (month == null) return;

    int daysInMonth;
    switch (month) {
      case 'February':
        daysInMonth = 28; // Assuming non-leap year
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
      _selectedMonth = month;
      _selectedDay = null; // Reset selected day
      _days = List.generate(daysInMonth, (index) => index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Reservation Title
            Text(
              'Reservation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Date Title
            Text(
              'Date',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Month and Day Dropdowns
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Month Dropdown
                DropdownButton<String>(
                  value: _selectedMonth,
                  hint: Text("Month"),
                  items: _months.map((String month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Text(month),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _updateDays(newValue);
                  },
                ),

                SizedBox(width: 20),

                // Day Dropdown
                DropdownButton<int>(
                  value: _selectedDay,
                  hint: Text("Day"),
                  items: _days.map((int day) {
                    return DropdownMenuItem<int>(
                      value: day,
                      child: Text(day.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedDay = newValue;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            // Display Selected Date
            if (_selectedMonth != null && _selectedDay != null)
              Text(
                'Selected Date: $_selectedDay $_selectedMonth',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
