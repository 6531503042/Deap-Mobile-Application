import 'dart:ui';

import 'package:dentist_appointment/components/OrLoginWithTap.dart';
import 'package:dentist_appointment/screens/RegSuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TelephoneForm extends StatelessWidget {
  const TelephoneForm({Key? key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Telephone No',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
              enableInteractiveSelection: false,
              cursorColor: const Color.fromRGBO(40, 195, 176, 1),
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Telephone No',
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(232, 236, 244, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Password',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
              enableInteractiveSelection: false,
              cursorColor: const Color.fromRGBO(40, 195, 176, 1),
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Enter Password',
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(232, 236, 244, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Confirm Password',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
              enableInteractiveSelection: false,
              cursorColor: const Color.fromRGBO(40, 195, 176, 1),
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Confirm Password',
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(232, 236, 244, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // tap button for register
            Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegSuccessPage()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(40, 195, 176, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(221, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const OtherloginTap(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
