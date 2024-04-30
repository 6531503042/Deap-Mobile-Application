import 'package:dentist_appointment/screens/NewPasswordForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
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
                  width: 330,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.urbanist(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Don't worry! It occurs. Please enter the email address linked with your account.",
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(131, 145, 161, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                decoration: InputDecoration(
                    hintText: 'Enter your email',
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
            ),
            const SizedBox(
              height: 180,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPasswordForm()),
                  );
                }, //Fuction That Will Use After Press This Button
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(40, 195, 176, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Send Renew Password',
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  )),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have problem with mail sender?',
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Problem Solving',
                          style: GoogleFonts.urbanist(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(7, 181, 255, 1),
                          ),
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
