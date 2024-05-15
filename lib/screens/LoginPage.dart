import 'dart:ui';

import 'package:dentist_appointment/components/LoginEmailForm.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_icon/gradient_icon.dart';

import '../components/LoginTelephone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AuthPage()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(
                color: const Color.fromRGBO(232, 236, 244, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 290,
                child: Text(
                  'Welcome back! Glad to see you, Again!',
                  style: GoogleFonts.urbanist(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  'Please select your preferred channel for registration.',
                  style: GoogleFonts.urbanist(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(40, 195, 176, 1),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.height,
                height: 60,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 248, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(232, 236, 244, 1))),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(40, 195, 176, 1),
                        ),
                        child: Center(
                          child: Text(
                            'Email',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                              margin:
                                                  const EdgeInsets.only(
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
                                        color:
                                            Color.fromARGB(255, 151, 145, 145),
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
                                                    fontWeight:
                                                        FontWeight.w700),
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
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(30, 0, 0, 0),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: Text(
                                    'Telephone No',
                                    style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                child: Center(
                                    child: Icon(
                                  Icons.lock,
                                  size: 30,
                                  color: Color.fromARGB(150, 0, 0, 0),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // --------------------  Disable the Tabs Bar For Maintain  --------------------------------------
                  // child: TabBar(
                  //     controller: _tabController,
                  //     dividerColor: Colors.transparent,
                  //     labelColor: Colors.white,
                  //     unselectedLabelColor: Color.fromRGBO(131, 145, 161, 1),
                  //     indicatorSize: TabBarIndicatorSize.tab,
                  //     indicator: BoxDecoration(
                  //         color: const Color.fromRGBO(40, 195, 176, 1),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     tabs: [
                  //       Tab(
                  //         child: Text(
                  //           'Email',
                  //           style: GoogleFonts.urbanist(
                  //               fontSize: 15, fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       Tab(
                  //         child: Text(
                  //           'Telephone No',
                  //           style: GoogleFonts.urbanist(
                  //               fontSize: 15, fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //     ]),
                ),
              ),
              Container(
                height: 556,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    const LoginEmailForm(),
                    const LoginTelephoneForm()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
