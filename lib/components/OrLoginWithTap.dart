import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherloginTap extends StatelessWidget {
  const OtherloginTap({super.key});

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
          Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Login with facebook');
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
                  onTap: () {
                    print('Login with google');
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
                    print('Login with apples');
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
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(30, 35, 44, 1),
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
                          color: Color.fromRGBO(7, 181, 255, 1),
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
