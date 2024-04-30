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
      'imagePath': 'assets/doctor1.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. Mensah T',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor2.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. Klimisch J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': 'assets/doctor3.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. Martinez K',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor4.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. Marc M',
      'rating': 4.3,
      'reviews': 130,
      'type': 'Dentist',
      'imagePath': 'assets/doctor5.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. O\'Boyle J',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': 'assets/doctor6.png',
      'imagePath2': 'assets/star.png'
    },
    {
      'name': 'Dr. Bellamy R',
      'rating': 4.5,
      'reviews': 135,
      'type': 'Dentist',
      'imagePath': "assets/doctor8.png",
      'imagePath2': 'assets/star.png'
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
                  final imagePath = dentist['imagePath'];
                  final imagePath2 = dentist['imagePath2'];

                  return _buildDoctorCard(
                      context, name, rating, imagePath, imagePath2);
                }).toList(),

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, String name, double rating,
      String imagePath, String imagePath2) {
    return Card(
      elevation: 2, // Add elevation for a shadow effect
      child: InkWell(
        splashColor: Colors.green.shade200.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailPage(
                name: name,
                rating: rating,
                imagePath: imagePath,                // Add this line
                description:
                    'This is a description of the dentist.', // Add this line
              ),
            ),
          );
        },
        child: Container(
          width: 160,
          height: 160,
          padding: EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  imagePath, // Use the provided imagePath
                  width: 80,
                  height: 80,
                ),
              ),

              // Doctor's name
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              // Star rating sentence
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                        imagePath2, // Use the provided imagePath2 for the star image
                        width: 16,
                        height: 16,
                      ),
                    ),
                    TextSpan(
                      text: '${rating.toStringAsFixed(1)} (135 reviews)',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 143, 139, 139)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
