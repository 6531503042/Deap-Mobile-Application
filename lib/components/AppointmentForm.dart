import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  DateTime? selectedDate;
  String selectedTime = "";
  String problemDescription = "";
  final _formKey = GlobalKey<FormState>();

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
    "05:30 PM"
  ];

  late final FirebaseFirestore _firestore;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
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
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.0005,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CalendarDatePicker(
                      firstDate: DateTime.now(),
                      initialDate: selectedDate ?? DateTime.now(),
                      onDateChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                        });
                      },
                      lastDate: DateTime.now().add(const Duration(days: 30)),
                    ),
                  ),
                  if (selectedDate == null)
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 8),
                      child: Text(
                        'Please select a date',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Available Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: List.generate(
                (availableTimes.length / 3).ceil(),
                (index) {
                  final start = index * 3;
                  final end = (index + 1) * 3;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: availableTimes.sublist(start, end).map((time) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        width: 110,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: selectedTime == time
                                ? Colors.white
                                : const Color.fromRGBO(107, 119, 154, 1),
                            backgroundColor: selectedTime == time
                                ? const Color.fromARGB(255, 60, 242, 203)
                                : const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            time,
                            style: GoogleFonts.urbanist(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Write your problem condition',
                style: GoogleFonts.urbanist(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(107, 119, 154, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a problem description';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 40.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        selectedDate != null &&
                        selectedTime.isNotEmpty) {
                      await _firestore.collection('appointments').add({
                        'date': selectedDate.toString(),
                        'time': selectedTime,
                        'problemDescription': problemDescription,
                      });

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
                                const SizedBox(height: 20),
                                const Text(
                                  'Congratulations!',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 16),
                                const Text('Your appointment is confirmed for'),
                                Text(
                                  '${DateFormat.MMMM().format(selectedDate!)} ${selectedDate!.day}, ${selectedDate!.year}, at $selectedTime.',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                const Text('Problem Description:'),
                                Text(
                                  problemDescription.isNotEmpty
                                      ? problemDescription
                                      : 'Not provided',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            actions: [
                              Center(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    width: 240,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 71, 202, 167),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
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
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 71, 202, 167),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: 400,
                    child: const Text(
                      'Book Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

