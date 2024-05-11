import 'package:dentist_appointment/models/setting_item.dart';
import 'package:dentist_appointment/screens/ProfileTab.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:dentist_appointment/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';
import 'package:ionicons/ionicons.dart';

import '../models/forward_button.dart';
import 'Progression_page.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: GoogleFonts.urbanist(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            try {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } catch (e) {
              print("Error navigating back: $e");
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: GoogleFonts.urbanist(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset("assets/default_user.png",
                        width: 60, height: 60),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User",
                          style: GoogleFonts.urbanist(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Detail of your account",
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 173, 57, 61),
                                    width: 5)),
                            content: Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 30),
                              height: 450,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 130,
                                          width: 130,
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: <Color>[
                                                  Color.fromARGB(
                                                      0, 219, 219, 219),
                                                  Color.fromARGB(
                                                      0, 250, 241, 241),
                                                  Color.fromARGB(
                                                      0, 248, 229, 229),
                                                  Color.fromARGB(
                                                      0, 252, 211, 211),
                                                  // Color.fromARGB(255, 255, 110, 115),
                                                  // Color.fromARGB(255, 173, 57, 61),
                                                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: const GradientIcon(
                                              icon: Icons.close_rounded,
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  Color.fromARGB(
                                                      255, 255, 255, 255),
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
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 151, 145, 145),
                                      borderRadius: BorderRadius.all(
                                        Radius.elliptical(200, 30),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Feature Unavailable",
                                        style: GoogleFonts.urbanist(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "This feature is not yet available in this version. Stay tuned for updates!",
                                        style: GoogleFonts.urbanist(
                                          color: const Color(0xff665c5d),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    255, 255, 110, 115),
                                                Color.fromARGB(
                                                    255, 173, 57, 61),
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Close',
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
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "General",
                style: GoogleFonts.urbanist(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Progression",
                icon: Icons.calendar_today,
                bgColor: const Color.fromRGBO(40, 195, 177, 0.233),
                iconColor: const Color.fromRGBO(40, 195, 176, 1),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Regression_Page(),
                    ),
                  );
                },
                titleTextStyle: const TextStyle(
                  // Add titleTextStyle with GoogleFonts.urbanist
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 17),
              SettingItem(
                title: "Setting",
                icon: Ionicons.settings,
                bgColor: Colors.grey.shade300,
                iconColor: Colors.grey.shade800,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
                titleTextStyle: const TextStyle(
                  // Add titleTextStyle with GoogleFonts.urbanist
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
