import 'dart:ui';

import 'package:flutter/material.dart';

class DoctorTab extends StatefulWidget {
  @override
  _DentistPageState createState() => _DentistPageState();
}

class _DentistPageState extends State<DoctorTab> {
  final List<Map<String, dynamic>> _dentists = [
    {
      'name': 'Dr. Praa',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'assets' : 'assets/doctor1.png'
    },
    {
      'name': 'Dr. Mensah T',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'assets' : 'assets/doctor2.png'
    },
    {
      'name': 'Dr. Klimisch J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'assets' : 'assets/doctor3.png'
    },
    {
      'name': 'Dr. Martinez K',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'assets' : 'assets/doctor4.png'
    },
    {
      'name': 'Dr. Marc M',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'assets' : 'assets/doctor5.png'
    },
    {
      'name': 'Dr. O\'Boyle J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'assets' : 'assets/doctor6.png'
    },
    {
      'name': 'Dr. Bellamy R',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'assets' : "assets/doctor8.png"
    },
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back), // Example of using an icon as leading widget
          onPressed: () {
            // Add functionality for the leading icon/button
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Enter a dentist name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: _dentists.map((dentist) {
                final name = dentist['name'];
                final rating = dentist['rating'];
                final type = dentist['type'];

                return _buildDoctorCard(name, rating, type);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDoctorCard(String name, double rating, String assets) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        // Add functionality for viewing doctor's profile
      },
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              assets, // Use the correct asset path
              width: 50,
              height: 50,
            ),
            SizedBox(height: 8),
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

