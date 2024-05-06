import 'package:dentist_appointment/components/AppointmentForm.dart';
import 'package:flutter/material.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentTab extends StatefulWidget {
  const AppointmentTab({super.key});

  @override
  _AppointmentTabState createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<AppointmentTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Booking Appointments',
          style:
              GoogleFonts.urbanist(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const AppointmentForm(),
    );
  }
}