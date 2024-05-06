import 'package:dentist_appointment/components/RegEmailForm.dart';
import 'package:dentist_appointment/components/RegTelephoneForm.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(
      length: 2,
      vsync: this,
      // animationDuration: Duration.zero,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            margin: const EdgeInsets.all(8),
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
                  'Hello! Register to get started',
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
                  child: TabBar(
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor:
                          const Color.fromRGBO(131, 145, 161, 1),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: const Color.fromRGBO(40, 195, 176, 1),
                          borderRadius: BorderRadius.circular(10)),
                      tabs: [
                        Tab(
                          child: Text(
                            'Telephone',
                            style: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Email',
                            style: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height + 172,
                child: TabBarView(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [const TelephoneForm(), const RegEmailForm()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
