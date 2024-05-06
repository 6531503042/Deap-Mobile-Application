import 'package:dentist_appointment/screens/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegSuccessPage extends StatefulWidget {
  const RegSuccessPage({super.key});

  @override
  State<RegSuccessPage> createState() => _RegSuccessPageState();
}

class _RegSuccessPageState extends State<RegSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                child: Lottie.network(
                  "https://lottie.host/503a0a5e-7442-4daf-b64b-d7832a13d320/Z6eNJa88RT.json",
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                child: Text(
                  style: GoogleFonts.urbanist(
                      fontSize: 22, fontWeight: FontWeight.w700),
                  "Your account successfully created!",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    style: GoogleFonts.urbanist(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(221, 145, 145, 145),
                    ),
                    textAlign: TextAlign.center,
                    "Welcome to Your Ultimate Doctor Appointment: Your Account is Created, Unieash the Joy of Seamless Doctor Appointments."),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(40, 195, 176, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.urbanist(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(221, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
