import 'dart:ui';

import 'package:dentist_appointment/screens/Doctor_detailWithAppointment.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorTabInAppointment extends StatefulWidget {
  @override
  _DentistPageState createState() => _DentistPageState();
}

class _DentistPageState extends State<DoctorTabInAppointment> {
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

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Doctors',
          style: GoogleFonts.urbanist(
              fontSize: 18,
              fontWeight: FontWeight.w600,),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            try {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } catch (e) {
              if (kDebugMode) {
                print("Error navigating back: $e");
              }
            }
          },
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add padding to create space from edge
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
                  cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                  style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(107, 119, 154, 1)),
                  controller: _searchController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Search for doctors',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ), // Remove the border line and do the shape
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (1 / 1.17),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
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
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      // Add elevation for a shadow effect
      child: InkWell(
        splashColor: Colors.green.shade200.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailWithAppointmentPage(
                name: name,
                rating: rating,
                imagePath: imagePath, // Add this line
                description:
                    'This is a description of the dentist.', // Add this line
              ),
            ),
          );
        },
        child: Container(
          width: 160,
          height: 160,
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Image
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  imagePath, // Use the provided imagePath
                  width: 70,
                  height: 70,
                ),
              ),
              // Doctor's name
              Text(
                name,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              //Which job of that doctor
              Text(
                'Dentist',
                style: GoogleFonts.urbanist(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(107, 119, 154, 1)),
              ),
              const SizedBox(height: 5),
              // Star rating sentence
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Image.asset(
                        imagePath2, // Use the provided imagePath2 for the star image
                        width: 15,
                        height: 15,
                      ),
                    ),
                    TextSpan(
                      text: '${rating.toStringAsFixed(1)} (135 reviews)',
                      style: GoogleFonts.urbanist(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(107, 119, 154, 1)),
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