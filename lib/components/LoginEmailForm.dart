import 'package:dentist_appointment/components/OrLoginWithTapLP.dart';
import 'package:dentist_appointment/screens/ForgetPassPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginEmailForm extends StatefulWidget {
  const LoginEmailForm({super.key});

  @override
  State<LoginEmailForm> createState() => _LoginEmailFormState();
}

class _LoginEmailFormState extends State<LoginEmailForm>
    with SingleTickerProviderStateMixin {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
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
                fillColor: Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Enter your Email',
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(232, 236, 244, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                fillColor: Color.fromRGBO(247, 248, 249, 1),
                filled: true,
                labelStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                hintText: 'Enter your password',
                hintStyle: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: const Color.fromRGBO(232, 236, 244, 1),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassPage()),
                      );
                    }, //Fuction That Will Use After Press This Text
                    style: TextButton.styleFrom(
                        foregroundColor:
                            const Color.fromRGBO(106, 112, 124, 1)),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            // tap button for register
            Container(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const RegSuccessPage()),
                        // );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(40, 195, 176, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Login",
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
                  OtherloginTapLp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
