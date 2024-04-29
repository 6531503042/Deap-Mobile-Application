import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final String name;
  final double rating;
  final String imagePath;
  

  const DoctorDetailPage({
    Key? key,
    required this.name,
    required this.rating,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath), 
            Text(name),
            Text('Rating: $rating'),
            
            // Add more details or widgets as needed
          ],
        ),
      ),
    );
  }
}
