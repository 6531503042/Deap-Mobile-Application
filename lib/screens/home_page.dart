import 'package:flutter/material.dart';
import 'package:dentist_appointment/screens/AppointmentTab.dart';
import 'package:dentist_appointment/screens/DoctorTab.dart';
import 'package:dentist_appointment/screens/ProfileTab.dart';

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
      AppointmentTab(),
      DoctorTab(),
      ProfileTab(),
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
              title: Text(
                'Welcome,Username',
                style: TextStyle(fontSize: 18),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    // Add functionality for notifications
                  },
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    // Add functionality for calendar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Add functionality for settings
                  },
                ),
              ],
            )
          : null,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 110, 197, 238),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
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
              width: 320, // Set the width here
              height: 64,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 233, 233),
                border: Border.all(color: Color.fromARGB(255, 183, 183, 183)),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      icon: Icon(Icons.arrow_forward, color: Colors.black),
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
        SizedBox(height: 8),
        Text(
          'Popular dentist',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: <Widget>[
            _buildDoctorCard('Dr. Praa', 4.5, 'assets/doctor1.png'),
            _buildDoctorCard('Dr. Bellamy R', 4.5,'assets/doctor8.png'),
            _buildDoctorCard('Dr. Klimisch J', 4.5,'assets/doctor3.png'),
          ],
        ),
      ],
    ));
  }
}

Widget _buildDoctorCard(String name, double rating, String imagePath) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        // Add functionality for viewing doctor's profile
      },
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Use a ListView.builder to cycle through images
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
  );
}
