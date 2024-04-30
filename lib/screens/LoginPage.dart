import 'package:dentist_appointment/screens/ForgetPassPage.dart';
import 'package:dentist_appointment/screens/RegisterPage.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  var _isObscureText = true;
  var _isObscureText1 = true;

  @override
  void initState() {
    _isObscureText = true;
    _isObscureText1 = true;
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Tab> _tabs = [
    const Tab(
      text: 'Telephone No.',
    ),
    const Tab(
      text: 'Email',
    )
  ];

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
                      border: Border.all(
                          color: const Color.fromRGBO(0, 0, 0, 0.2))),
                  child: Center(child: Image.asset('assets/back_arrow.png')),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  width: 300,
                  child: Text(
                    'Welcome back! Glad to see you, Again!',
                    style: GoogleFonts.urbanist(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                  child: Text(
                    'Please select your preferred channel for registration.',
                    style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(40, 195, 176, 1)),
                  ),
                ),
                Container(
                  // height: 65,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 248, 249, 1),
                      border:
                          Border.all(
                          color: const Color.fromRGBO(232, 236, 244, 1)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          controller: _tabController,
                          labelStyle: GoogleFonts.urbanist(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          unselectedLabelColor:
                              const Color.fromRGBO(131, 145, 161, 1),
                          labelColor: const Color.fromRGBO(255, 255, 255, 1),
                          indicator: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              color: const Color.fromRGBO(40, 195, 176, 1),
                              borderRadius: BorderRadius.circular(20)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.transparent,
                          tabs: _tabs,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 65),
                    width: double.maxFinite,
                    height: 300,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              TextFormField(
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                cursorColor:
                                    const Color.fromRGBO(40, 195, 176, 1),
                                decoration: InputDecoration(
                                    hintText: 'Enter your telephone number',
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(247, 248, 249, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                cursorColor:
                                    const Color.fromRGBO(40, 195, 176, 1),
                                obscureText: _isObscureText,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    suffixIcon: IconButton(
                                      icon: _isObscureText
                                          ? const Icon(Icons.remove_red_eye)
                                          : const Icon(
                                              Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isObscureText = !_isObscureText;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(247, 248, 249, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        ))),
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
                                              builder: (context) =>
                                                  const ForgetPassPage()),
                                        );
                                      }, //Fuction That Will Use After Press This Text
                                      style: TextButton.styleFrom(
                                          foregroundColor:
                                              const Color.fromRGBO(
                                              106, 112, 124, 1)),
                                      child: Text(
                                        'Forgot Password?',
                                        style: GoogleFonts.urbanist(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  }, //Fuction That Will Use After Press This Button
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    width: MediaQuery.of(context).size.width,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            40, 195, 176, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: GoogleFonts.urbanist(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              TextFormField(
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                cursorColor:
                                    const Color.fromRGBO(40, 195, 176, 1),
                                decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(247, 248, 249, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        ))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: GoogleFonts.urbanist(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                cursorColor:
                                    const Color.fromRGBO(40, 195, 176, 1),
                                obscureText: _isObscureText1,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    suffixIcon: IconButton(
                                      icon: _isObscureText1
                                          ? const Icon(Icons.remove_red_eye)
                                          : const Icon(
                                              Icons.remove_red_eye_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isObscureText1 = !_isObscureText1;
                                        });
                                      },
                                    ),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(247, 248, 249, 1),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: const BorderSide(
                                          color:
                                              Color.fromRGBO(232, 236, 244, 1),
                                          width: 1.0,
                                        ))),
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
                                              builder: (context) =>
                                                  const ForgetPassPage()),
                                        );
                                      }, //Fuction That Will Use After Press This Text
                                      style: TextButton.styleFrom(
                                          foregroundColor:
                                              const Color.fromRGBO(
                                              106, 112, 124, 1)),
                                      child: Text(
                                        'Forgot Password?',
                                        style: GoogleFonts.urbanist(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  }, //Fuction That Will Use After Press This Button
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    width: MediaQuery.of(context).size.width,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            40, 195, 176, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      'Login',
                                      style: GoogleFonts.urbanist(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 20,
                                )),
                          ),
                          Center(
                              child: Text(
                            'Or Login with',
                            style: GoogleFonts.urbanist(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 20,
                                )),
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(232, 236, 244, 1)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset('assets/Vector01.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(232, 236, 244, 1)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset('assets/google_ic.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(232, 236, 244, 1)),
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset('assets/cib_apple.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: GoogleFonts.urbanist(
                                fontSize: 15, fontWeight: FontWeight.w500),
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
                                  color: const Color.fromRGBO(7, 181, 255, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
