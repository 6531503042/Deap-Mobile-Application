import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';

class PopupTest extends StatefulWidget {
  const PopupTest({super.key});

  @override
  State<PopupTest> createState() => _PopupTestState();
}

class _PopupTestState extends State<PopupTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Center(child: Text('Test')),
          ),
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: Color.fromARGB(255, 173, 57, 61), width: 5)),
                content: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color.fromARGB(255, 255, 110, 115),
                              Color.fromARGB(255, 173, 57, 61),
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                            tileMode: TileMode.mirror,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromARGB(0, 219, 219, 219),
                                      Color.fromARGB(0, 250, 241, 241),
                                      Color.fromARGB(0, 248, 229, 229),
                                      Color.fromARGB(0, 252, 211, 211),
                                      // Color.fromARGB(255, 255, 110, 115),
                                      // Color.fromARGB(255, 173, 57, 61),
                                    ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                  ),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: GradientIcon(
                                  icon: Icons.close_rounded,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 255, 255, 255),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  size: 120,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 151, 145, 145),
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(200, 30),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Booking Failed",
                            style: GoogleFonts.urbanist(
                                fontSize: 20, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "This Time Have Been Appointments",
                            style: GoogleFonts.urbanist(
                              color: Color(0xff665c5d),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 255, 110, 115),
                                    Color.fromARGB(255, 173, 57, 61),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  'Learn More',
                                  style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
