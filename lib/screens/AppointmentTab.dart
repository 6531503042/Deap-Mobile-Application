import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({Key? key}) : super(key: key);

  @override
  _AppointmentTabState createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  final List<String> availableTimes = [
    "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
    "12:00 PM", "12:30 PM", "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM",
    "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Calendar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CalendarDatePicker(
              firstDate: DateTime.now(),
              initialDate: selectedDate,
              onDateChanged: (DateTime newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
              lastDate: DateTime.now().add(Duration(days: 30)),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 103, 223, 213),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 10.0),
                  Text(
                    '${DateFormat.yMMMMd().format(selectedDate)}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 10.0,
              children: availableTimes.map((time) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Text(time),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedTime == time
                        ? Color.fromARGB(255, 142, 142, 142)
                        : Color.fromARGB(255, 60, 242, 203),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (selectedTime.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/verify.png',
                              height: 100,
                            ),
                            SizedBox(height: 16),
                            Text('Your appointment is confirmed for'),
                            Text(
                              '${DateFormat.MMMM().format(selectedDate)} ${selectedDate.day}, ${selectedDate.year}, at $selectedTime .',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 71, 202, 167),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Done',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please select a time slot'),
                    ),
                  );
                }
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
