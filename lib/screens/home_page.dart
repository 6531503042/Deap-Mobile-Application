import 'package:dentist_appointment/screens/DoctorTabInAppointment.dart';
import 'package:dentist_appointment/screens/Doctor_detail.dart';
import 'package:dentist_appointment/screens/Progression_page.dart';
import 'package:dentist_appointment/screens/setting_screen.dart';
import 'package:dentist_appointment/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:dentist_appointment/screens/DoctorTab.dart';
import 'package:dentist_appointment/screens/ProfileTab.dart';
import 'package:dentist_appointment/screens/notification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _showHeader = true;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeTab(showHeader: _showHeader),
      DoctorTabInAppointment(),
      DoctorTab(),
      AccountScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showHeader = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showHeader
          ? AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Text(
                    'Welcome, ',
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ), // Must be user model not set name to display
                  ),
                  Text(
                    'Nimit', // Must be user model not set name to display
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications_active_outlined),
                  onPressed: () {
                    // Navigate to notifications page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()),
                    );
                  },
                ),
              ],
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(146, 165, 253, 1),
        unselectedItemColor: const Color.fromRGBO(152, 163, 179, 1),
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.calendar_alt), label: 'Appointment'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.user_md), label: 'Doctors'),
          BottomNavigationBarItem(
              icon: Icon(UniconsLine.user), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  final bool showHeader;

  const HomeTab({Key? key, required this.showHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (showHeader) Image.asset('assets/Banner Animate.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 320,
                height: 80,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(100, 100, 100, 0.05),
                  border: Border.all(
                      color: const Color.fromRGBO(100, 100, 100, 0.05)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STI Problems?',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Find suitable specialists here',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(107, 119, 154, 1),
                          ),
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
                            color: Colors.black),
                        onPressed: () {
                          // Add functionality for the arrow button
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                'Popular dentist',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 8),
                _buildDoctorCard(context, 'Dr. Praa', 4.5, 'assets/doctor1.png',
                    'assets/star.png'),
                _buildDoctorCard(context, 'Dr. Bellamy R', 4.5,
                    'assets/doctor8.png', 'assets/star.png'),
                _buildDoctorCard(context, 'Dr. Klimisch J', 4.5,
                    'assets/doctor3.png', 'assets/star.png'),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const SizedBox(height: 18)
        ],
      ),
    );
  }
}

Widget _buildDoctorCard(BuildContext context, String name, double rating,
    String imagePath, String imagePath2) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    width: 120,
    height: 140,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(247, 248, 250, 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: InkWell(
      splashColor: Colors.green.shade200.withAlpha(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(
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
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Image
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                imagePath, // Use the provided imagePath
                width: 40,
                height: 40,
              ),
            ),

            // Doctor's name
            Text(
              name,
              style: GoogleFonts.urbanist(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            const SizedBox(height: 10),
            // Star rating sentence
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Image.asset(
                      imagePath2, // Use the provided imagePath2 for the star image
                      width: 14,
                      height: 14,
                    ),
                  ),
                  TextSpan(
                    text: '${rating.toStringAsFixed(1)} (135 reviews)',
                    style: GoogleFonts.urbanist(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(107, 119, 154, 1),
                    ),
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
