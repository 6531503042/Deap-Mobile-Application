import 'package:dentist_appointment/screens/RegisterPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherloginTapLp extends StatelessWidget {
  const OtherloginTapLp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(children: <Widget>[
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: const Divider(
                    color: const Color.fromRGBO(232, 236, 244, 1),
                    height: 30,
                  )),
            ),
            const Text("Or Login with"),
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: const Divider(
                    color: const Color.fromRGBO(232, 236, 244, 1),
                    height: 30,
                  )),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('Login with facebook');
                    }
                  },
                  child: Container(
                    width: 85,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(232, 236, 244, 1),
                      ),
                    ),
                    child: Image.asset('lib/Assests/Facebook_ic.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('Login with google');
                    }
                  },
                  child: Container(
                    width: 85,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(232, 236, 244, 1),
                      ),
                    ),
                    child: Image.asset('lib/Assests/google_ic.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('Login with apples');
                    }
                  },
                  child: Container(
                    width: 85,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(232, 236, 244, 1),
                      ),
                    ),
                    child: Image.asset('lib/Assests/Apple_ic.png'),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(30, 35, 44, 1),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register Now',
                        style: GoogleFonts.urbanist(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(7, 181, 255, 1),
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
