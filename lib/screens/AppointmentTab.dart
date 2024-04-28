import 'package:flutter/material.dart';
import 'package:dentist_appointment/screens/Apmt_confirmation.dart'; // Importing the appointment_confirmation_page.dart file

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({super.key});

  @override
  _AppointmentTabState createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";

  final List<String> availableTimes = [
    "09:00 AM",
    "09:30 AM",
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "01:00 PM",
    "01:30 PM",
    "02:00 PM",
    "02:30 PM",
    "03:00 PM",
    "03:30 PM",
    "04:00 PM",
    "04:30 PM",
    "05:00 PM",
    "05:30 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Calendar'),
       leading: IconButton(
          icon: Icon(Icons.arrow_back), // Example of using an icon as leading widget
          onPressed: () {
            // Add functionality for the leading icon/button
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar widget to select date
            CalendarDatePicker(
              firstDate: DateTime.now(),
              initialDate: selectedDate,
              onDateChanged: (DateTime newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
              lastDate: DateTime.now().add(Duration(days: 30)), // Adjust here for the number of days in advance
            ),
            // Text to display selected date
            Text(
              'Selected Date: ${selectedDate.toIso8601String()}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            // List of available times
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
            // Button to confirm booking
            ElevatedButton(
              onPressed: () {
                if (selectedTime.isNotEmpty) {
                  // Navigate to the AppointmentConfirmationPage with selected date and time
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentConfirmationPage(
                        selectedDate: selectedDate,
                        selectedTime: selectedTime,
                      ),
                    ),
                  );
                } else {
                  // Show a message if no time is selected
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
