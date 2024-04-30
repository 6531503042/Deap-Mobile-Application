import 'package:dentist_appointment/screens/AppointmentTab.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorDetailWithAppointmentPage extends StatelessWidget {
  final String name;
  final double rating;
  final String imagePath;
  final String description;

  const DoctorDetailWithAppointmentPage({
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(imagePath),
                  const SizedBox(height: 10),
                  Text(
                    name,
                    style: GoogleFonts.urbanist(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(34, 43, 69, 1)),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Dentist',
                    style: GoogleFonts.urbanist(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(107, 119, 154, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10), // Keeping SizedBox
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox('Patients', Image.asset('assets/GroupPatients.png'),
                      '1000+'),
                  const SizedBox(width: 20),
                  _buildBox('Experience',
                      Image.asset('assets/GroupExperience.png'), '10+ years'),
                  const SizedBox(width: 20),
                  _buildBox('Ratings', Image.asset('assets/GroupRatings.png'),
                      '$rating'),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Doctor',
                    style: GoogleFonts.urbanist(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(34, 43, 69, 1)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.urbanist(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(107, 119, 154, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Working time',
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(34, 43, 69, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Mon - Sat (08:30 AM - 09:00 PM)',
                    style: GoogleFonts.urbanist(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(107, 119, 154, 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30), // Align to the left
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(31, 42, 55, 1)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to see all reviews page
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.urbanist(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(107, 114, 128, 1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
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
            const SizedBox(height: 60),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppointmentTab()),
                  );
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(40, 195, 176, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title, Image image, String subtitle) {
    return Container(
      width: 95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.0005,
            blurRadius: 8,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          image,
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: GoogleFonts.urbanist(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(0, 0, 0, 1)),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.urbanist(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(107, 119, 154, 1)),
          ),
          const SizedBox(height: 10),
        ],
      ),
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
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(55, 65, 81, 1)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(107, 114, 128, 1)),
                    ),
                    const SizedBox(width: 10),
                    buildStarRating(rating),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review,
          style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(107, 114, 128, 1)),
        ),
      ],
    );
  }
}

Widget buildStarRating(double rating) {
  List<Widget> stars = [];
  int numberOfFullStars = rating.floor();
  double remainder = rating - numberOfFullStars;

  // Add full stars
  for (int i = 0; i < numberOfFullStars; i++) {
    stars.add(const Icon(
      Icons.star,
      color: Colors.amber,
      size: 15,
    ));
  }

  // Add half star if remainder is greater than 0
  if (remainder > 0) {
    stars.add(const Icon(
      Icons.star_half,
      color: Colors.amber,
      size: 15,
    ));
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: stars,
  );
}