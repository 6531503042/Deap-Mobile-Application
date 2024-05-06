import 'package:dentist_appointment/components/OrLoginWithTap.dart';
import 'package:dentist_appointment/screens/RegSuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegEmailForm extends StatefulWidget {
  const RegEmailForm({super.key});

  @override
  State<RegEmailForm> createState() => _RegEmailFormState();
}

class _RegEmailFormState extends State<RegEmailForm>
    with SingleTickerProviderStateMixin {
  late bool _passwordVisible;
  late bool _passwordVisible1;

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible1 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //Go to do your Form Key Brooo
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'E-mail Address',
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
              keyboardType: TextInputType.emailAddress,
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
                hintText: 'E-mail Address',
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
                'First Name',
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
                hintText: 'First Name',
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
                'Last Name',
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
                hintText: 'Last Name',
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
                'Citizen ID or Passport No.',
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
                hintText: 'Enter Citizen ID or Passport No.',
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
              obscureText: !_passwordVisible,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
              enableInteractiveSelection: false,
              cursorColor: const Color.fromRGBO(40, 195, 176, 1),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(_passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                fillColor: const Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Password',
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
              obscureText: !_passwordVisible1,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
              enableInteractiveSelection: false,
              cursorColor: const Color.fromRGBO(40, 195, 176, 1),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible1 = !_passwordVisible1;
                    });
                  },
                  child: Icon(_passwordVisible1
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
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
      ),
    );
  }
}
