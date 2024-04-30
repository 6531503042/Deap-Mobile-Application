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
        title: Text('Booking Appointments'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Select Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Available Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        ? Color.fromARGB(255, 60, 242, 203)
                        : Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Adjust the roundness here
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedTime.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/verify.png',
                                height: 100,
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Congratulations!',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 16),
                              Text('Your appointment is confirmed for'),
                              Text(
                                '${DateFormat.MMMM().format(selectedDate)} ${selectedDate.day}, ${selectedDate.year}, at $selectedTime .',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            Center( // Center the button
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  width: 240, // Set the width of the container
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 71, 202, 167),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Done',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
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
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: 400,
                  child: Text(
                    'Book Appointment',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 71, 202, 167),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Adjust the roundness here
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
