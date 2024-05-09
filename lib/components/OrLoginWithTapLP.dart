import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:dentist_appointment/screens/RegisterPage.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:dentist_appointment/service/google_sign_in_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherloginTapLp extends StatelessWidget {
  OtherloginTapLp({Key? key}) : super(key: key);

  final GoogleSignInService _googleSignInService = GoogleSignInService();
  ValueNotifier userCredential = ValueNotifier('');

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
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: const Divider(
                    color: Color.fromRGBO(232, 236, 244, 1),
                    height: 30,
                  )),
            ),
            const Text("Or Login with"),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: const Divider(
                    color: Color.fromRGBO(232, 236, 244, 1),
                    height: 30,
                  )),
            ),
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
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
                    child: Image.asset('assets/Vector01.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    String? token =
                        await _googleSignInService.signInWithGoogle();
                    if (token != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      print('Google token: $token');
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
                    child: Image.asset('assets/google_ic.png'),
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
                    child: Image.asset('assets/cib_apple.png'),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
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
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Login Now',
                      style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(7, 181, 255, 1),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
