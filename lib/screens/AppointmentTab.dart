import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({Key? key}) : super(key: key);

  @override
  _AppointmentTabState createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = "";
  String problemDescription = "";

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
        centerTitle: true,
        title: Text(
          'Booking Appointments',
          style:
              GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
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
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Date',
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.0005,
                          blurRadius: 8,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CalendarDatePicker(
                      firstDate: DateTime.now(),
                      initialDate: selectedDate,
                      onDateChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                      lastDate: DateTime.now().add(Duration(days: 30)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Available Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              children: List.generate(
                (availableTimes.length / 3).ceil(), // Calculate number of rows
                (index) {
                  final start = index * 3;
                  final end = (index + 1) * 3;
                  return Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // Adjust as needed
                    children: availableTimes.sublist(start, end).map((time) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        width: 110, // <-- Your width
                        height: 40, // <-- Your height
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                          child: Text(
                            time,
                            style: GoogleFonts.urbanist(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: selectedTime == time
                                ? Color.fromARGB(255, 255, 255, 255)
                                : Color.fromRGBO(107, 119, 154, 1),
                            backgroundColor: selectedTime == time
                                ? Color.fromARGB(255, 60, 242, 203)
                                : Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Write your problem condition',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(107, 119, 154, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                style: GoogleFonts.urbanist(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (value) {
                  setState(() {
                    problemDescription = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Write your problem here...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                maxLines: 4,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
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
                                SizedBox(height: 16),
                                Text('Problem Description:'),
                                Text(
                                  problemDescription.isNotEmpty
                                      ? problemDescription
                                      : 'Not provided',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            actions: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    width: 240,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}