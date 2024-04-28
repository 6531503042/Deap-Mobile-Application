import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/Banner Animate.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 320, // Set the width here
              height: 64,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 233, 233),
                border: Border.all(color: Color.fromARGB(255, 183, 183, 183)),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STI Problems?',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Find suitable specialists here',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward, color: Colors.black),
                      onPressed: () {
                        // Add functionality for the arrow button
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Popular dentist',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    ));
  }
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