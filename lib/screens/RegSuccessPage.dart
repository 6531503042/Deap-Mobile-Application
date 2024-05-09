// RegSuccessPage.dart

import 'package:dentist_appointment/components/LoginEmailForm.dart';
import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegSuccessPage extends StatefulWidget {
  const RegSuccessPage({super.key});

  @override
  _RegSuccessPageState createState() => _RegSuccessPageState();
}

class _RegSuccessPageState extends State<RegSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _SuccessContainer(),
      ),
    );
  }
}

class _SuccessContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _LottieAnimation(),
          const SizedBox(height: 70),
          _SuccessTitle(),
          const SizedBox(height: 10),
          _SuccessDescription(),
          const SizedBox(height: 30),
          _ContinueButton(),
        ],
      ),
    );
  }
}

class _LottieAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Lottie.network(
        "https://lottie.host/503a0a5e-7442-4daf-b64b-d7832a13d320/Z6eNJa88RT.json",
      ),
    );
  }
}

class _SuccessTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Your account successfully created!",
      textAlign: TextAlign.center,
      style: GoogleFonts.urbanist(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _SuccessDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to Your Ultimate Doctor Appointment: Your Account is Created, Unieash the Joy of Seamless Doctor Appointments.",
      textAlign: TextAlign.center,
      style: GoogleFonts.urbanist(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(221, 145, 145, 145),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(40, 195, 176, 1),
          borderRadius: BorderRadius.circular(15),
        ),
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
    );
  }
}
