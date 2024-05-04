import 'package:dentist_appointment/models/setting_item.dart';
import 'package:dentist_appointment/screens/ProfileTab.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:dentist_appointment/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    Image.asset("assets/reviewer1.png", width: 60, height: 60),
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
                        SizedBox(height: 5),
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
                    ForwardButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileTab(),
                          ),
                        );
                      },
                    )
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
                bgColor: Color.fromRGBO(40, 195, 177, 0.233),
                iconColor: Color.fromRGBO(40, 195, 176, 1),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Regression_Page(),
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
                      builder: (context) => SettingsPage(),
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
