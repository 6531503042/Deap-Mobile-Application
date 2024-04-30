import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class RequstOtpPage extends StatefulWidget {
  const RequstOtpPage({super.key});

  @override
  State<RequstOtpPage> createState() => _RequstOtpPageState();
}

class _RequstOtpPageState extends State<RequstOtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SafeArea(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 15),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2))),
                child: Center(child: Image.asset('assets/back_arrow.png')),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Container(
                  width: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'OTP Verification',
                          style: GoogleFonts.urbanist(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "We have sent an OTP to",
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(131, 145, 161, 1)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          "6531503042@lamduan.mfu.ac.th. Please enter the OTP in the boxes below.",
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(131, 145, 161, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(131, 145, 161, 1)),
                    decoration: InputDecoration(
                        hintText: 'Enter your OTP Here',
                        filled: true,
                        fillColor: const Color.fromRGBO(247, 248, 249, 1),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(232, 236, 244, 1),
                              width: 1.0,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(232, 236, 244, 1),
                              width: 1.0,
                            ))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Ref code: 42dv',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(131, 145, 161, 1)),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        print('Your Verification Passed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()),
                        );
                      }, //Fuction That Will Use After Press This Button
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(40, 195, 176, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Verify',
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SlideCountdownSeparated(
                          onDone: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthPage()),
                            );
                          },
                          textStyle: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          duration: const Duration(minutes: 5),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have problem with OTP sender?',
                        style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Problem Solving',
                          style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(7, 181, 255, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
