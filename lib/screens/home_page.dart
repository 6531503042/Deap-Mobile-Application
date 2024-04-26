import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dental Appointment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome,${widget.userName}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Clinic Dentist',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add functionality for booking an appointment
              },
              child: Text('Book your appointment'),
            ),
            SizedBox(height: 16),
            Text(
              'STI Problems?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Find suitable specialists here',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: <Widget>[
                _buildDoctorCard('Dr. Praa', 4.5),
                _buildDoctorCard('Dr. Bellamy R', 4.5),
                _buildDoctorCard('Dr. Klimisch J', 4.5),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(String name, double rating) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          // Add functionality for viewing doctor's profile
        },
        child: Container(
          width: 150,
          height: 100,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${rating.toStringAsFixed(1)} (135 reviews)',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
