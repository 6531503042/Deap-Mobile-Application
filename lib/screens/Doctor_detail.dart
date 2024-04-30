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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
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
                ],
              ),
            ),
            SizedBox(height: 10), // Keeping SizedBox
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
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20.0), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Doctor',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20.0), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Working time',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mon - Sat (08:30 AM - 09:00 PM)',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 40.0), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to see all reviews page
                        },
                        child: Text('See All'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ReviewItem(
                          username: 'Phumiphat Wongsathit',
                          rating: 4.5,
                          review: 'Great experience!',
                          avatarImage: 'assets/reviewer1.png',
                        ),
                        SizedBox(width: 10),
                        // Add more ReviewItems as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 60,
                width: 360, // Set width of the button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle booking appointment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(40, 195, 176, 100), // Set background color
                  ),
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1)), // Set font size
                  ),
                ),
              ),
            ),
          ],
        ),
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

class ReviewItem extends StatelessWidget {
  final String username;
  final double rating;
  final String review;
  final String avatarImage;

  const ReviewItem({
    Key? key,
    required this.username,
    required this.rating,
    required this.review,
    required this.avatarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30, // Increased radius for larger image size
              backgroundImage: AssetImage(avatarImage),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(rating.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(review),
      ],
    );
  }
}
