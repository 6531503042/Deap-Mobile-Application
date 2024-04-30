import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String name;
  final double rating;
  final String imagePath;
  final String description;

  const DoctorDetailPage({
    Key? key,
    required this.name,
    required this.rating,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
          Image.asset(imagePath),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Dentist',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBox('Patients', Icons.group, '1000+'),
              SizedBox(width: 20),
              _buildBox('Experience', Icons.work, '10+ years'),
              SizedBox(width: 20),
              _buildBox('Ratings', Icons.star, '$rating'),
            ],
          ),
          // Add more details or widgets as needed
        ],
      ),
    );
  }

  Widget _buildBox(String title, IconData iconData, String subtitle) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 24,
          color: Colors.grey,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          subtitle,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
