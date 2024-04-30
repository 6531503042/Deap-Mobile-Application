import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
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
                          'Enter your new password',
                          style: GoogleFonts.urbanist(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 280,
                        child: Text(
                          "This is the last step in recovering your password.",
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
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(131, 145, 161, 1)),
                cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                decoration: InputDecoration(
                    hintText: 'Password',
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
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(131, 145, 161, 1),
                ),
                cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                decoration: InputDecoration(
                    hintText: 'Confirm password',
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
              height: 100,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }, //Fuction That Will Use After Press This Button
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 80),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(40, 195, 176, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
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
                        'Do you have any problem with re-set password?',
                        style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Contract Admin',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(7, 181, 255, 1),
                            ),
                          ))
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
