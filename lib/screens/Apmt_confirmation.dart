
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentConfirmationPage extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedTime;

  const AppointmentConfirmationPage({
    Key? key,
    required this.selectedDate,
    required this.selectedTime,
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
            Text(
              'Selected Date: ${DateFormat.yMd().format(selectedDate)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Selected Time: $selectedTime',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Additional Notes',
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
                      title: Text('Appointment Confirmation'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Are you sure you want to confirm this appointment?'),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Confirmation Code',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: null,
                          ),
                        ],
                      ),
                      actions: [
                        
                        TextButton(
                          child: Text('Done'),
                          onPressed: () {
                            // TODO: Implement appointment confirmation logic.
                            Navigator.of(context).pop();
                          },
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