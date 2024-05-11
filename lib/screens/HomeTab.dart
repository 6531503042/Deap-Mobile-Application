import 'dart:ui';

import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth *
            0.8; // Use 80% of available width for the container
        double cardWidth = constraints.maxWidth *
            0.45; // Use 45% of available width for each card
        double imageSize =
            cardWidth * 0.4; // Use 40% of card width for image size

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/Banner Animate.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: containerWidth,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                        color: const Color.fromARGB(255, 178, 178, 178)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
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
                          icon: const Icon(Icons.arrow_forward,
                              color: Color.fromARGB(255, 203, 203, 203)),
                          onPressed: () {
                            // Add functionality for the arrow button
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Popular dentist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  _buildDoctorCard(
                      'Dr. Praa', 4.5, 'assets/doctor1.png', imageSize),
                  _buildDoctorCard(
                      'Dr. Bellamy R', 4.5, 'assets/doctor8.png', imageSize),
                  _buildDoctorCard(
                      'Dr. Klimisch J', 4.5, 'assets/doctor3.png', imageSize),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDoctorCard(
      String name, double rating, String imagePath, double imageSize) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          // Add functionality for viewing doctor's profile
        },
        child: Container(
          width: imageSize * 3, // Assuming 3 images for each doctor
          height: imageSize,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Use a ListView.builder to cycle through images
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3, // Assuming 3 images for each doctor
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.asset(
                        imagePath, // Use the provided imagePath
                        width: imageSize,
                        height: imageSize,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${rating.toStringAsFixed(1)} (135 reviews)',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
