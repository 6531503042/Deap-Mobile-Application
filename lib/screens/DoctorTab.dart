import 'dart:ui';

import 'package:dentist_appointment/screens/Doctor_detail.dart';
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
      'imagePath': 'assets/doctor1.png'
    },
    {
      'name': 'Dr. Mensah T',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor2.png'
    },
    {
      'name': 'Dr. Klimisch J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': 'assets/doctor3.png'
    },
    {
      'name': 'Dr. Martinez K',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor4.png'
    },
    {
      'name': 'Dr. Marc M',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor5.png'
    },
    {
      'name': 'Dr. O\'Boyle J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': 'assets/doctor6.png'
    },
    {
      'name': 'Dr. Bellamy R',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': "assets/doctor8.png"
    },
  ];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            try {
              Navigator.pop(context);
            } catch (e) {
              print("Error navigating back: $e");
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to create space from edge
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust border radius as needed
                  color: Colors.grey[200], // Background color of box
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search for doctors',
                    hintText: 'Enter a dentist name',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none, // Remove the border line
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20, // Add this line
                crossAxisSpacing: 20, // Add this line
                children: _dentists.map((dentist) {
                  final name = dentist['name'];
                  final rating = dentist['rating'];
                  final type = dentist['type'];
                  final imagePath =
                      dentist['imagePath']; // Corrected access to imagePath

                  return _buildDoctorCard(name, rating, type, imagePath);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(
      String name, double rating, String type, String imagePath) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorDetailPage(
                  name: name,
                  rating: rating,
                  imagePath: imagePath,
                ),
              ),
            ); // Add functionality for viewing doctor's profile
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 3, // Blur radius
                  offset: Offset(0, 3), // Offset
                ),
              ],
            ),
            width: 150,
            height: 150,
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1, // Assuming 3 images for each doctor
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.asset(
                          imagePath, // Use the provided imagePath
                          width: 50,
                          height: 50,
                        ),
                      );
                    },
                  ),
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
      ),
    );
  }
}
