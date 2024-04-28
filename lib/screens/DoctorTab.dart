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
    },
    {
      'name': 'Dr. Mensah T',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
    },
    {
      'name': 'Dr. Klimisch J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
    },
    {
      'name': 'Dr. Martinez K',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
    },
    {
      'name': 'Dr. Marc M',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
    },
    {
      'name': 'Dr. O\'Boyle J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
    },
    {
      'name': 'Dr. Bellamy R',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
    },
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        
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

Widget _buildDoctorCard(String name, double rating, String type) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        // Add functionality for viewing doctor's profile
      },
      child: Container(
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
            Text(
              type,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    ),
  );
}
