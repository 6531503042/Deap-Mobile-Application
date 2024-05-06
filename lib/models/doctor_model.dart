import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final double rating;
  final int reviews;
  final String type;
  final String imagePath;
  final String imagePath2;

  Doctor({
    required this.name,
    required this.rating,
    required this.reviews,
    required this.type,
    required this.imagePath,
    required this.imagePath2,
  });
}

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('doctors').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Doctor> doctors = snapshot.data!.docs.map((doc) {
            var data = doc.data() as Map<String, dynamic>;
            return Doctor(
              name: data['name'],
              rating: data['rating'].toDouble(),
              reviews: data['reviews'],
              type: data['type'],
              imagePath: data['imagePath'],
              imagePath2: data['imagePath2'],
            );
          }).toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return _buildDoctorCard(context, doctors[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            doctor.imagePath,
            width: 100,
            height: 100,
          ),
          Text(doctor.name),
          Text('Rating: ${doctor.rating.toStringAsFixed(1)}'),
          Text('${doctor.reviews} reviews'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Doctor App',
    home: DoctorScreen(),
  ));
}
