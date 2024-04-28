import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentConfirmationPage extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;
  final String selectedDoctor; // Add doctor name variable

  const AppointmentConfirmationPage({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display selected date
            Text(
              'Selected Date: ${DateFormat.yMd().format(selectedDate)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Display selected time
            Text(
              'Selected Time: $selectedTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Display selected doctor
            Text(
              'Selected Doctor: $selectedDoctor',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Write your problem condition',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Congratulations!'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add image (logo) here
                          Image.asset(
                            'assets/', // Replace 'logo.png' with your image path
                            height: 100, // Adjust height as needed
                          ),
                          SizedBox(height: 16),
                          Text('Your appointment with $selectedDoctor is confirmed for'),
                          Text(
                            '${DateFormat.MMMM().format(selectedDate)} ${selectedDate.day}, ${selectedDate.year}, at $selectedTime .',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      actions: [
                        Center( // Center the button
                          child: TextButton(
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
                            onPressed: () {
                              // TODO: Implement appointment confirmation logic.
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Confirm Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
