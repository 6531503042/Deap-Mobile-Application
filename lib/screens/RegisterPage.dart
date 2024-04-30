import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:dentist_appointment/screens/RequestOTP.dart';
import 'package:flutter/cupertino.dart';
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
  // final Future<FirebaseApp> firebase = Firebase.initializeApp();
  late TabController _tabController;

  var _isObcureText = true;
  var _isObcureText1 = true;

  @override
  void initState() {
    _isObcureText = true;
    _isObcureText1 = true;
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
                    border:
                        Border.all(color: const Color.fromRGBO(0, 0, 0, 0.2))),
                child: Center(child: Image.asset('assets/back_arrow.png')),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                width: 320,
                child: Text(
                  'Hello! Register to get started',
                  style: GoogleFonts.urbanist(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Please select your preferred channel for registration.',
                  style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(40, 195, 176, 1)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // height: 65,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 248, 249, 1),
                    border: Border.all(
                        color: const Color.fromRGBO(232, 236, 244, 1)),
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          labelStyle: GoogleFonts.urbanist(
                              fontSize: 15, fontWeight: FontWeight.w500),
                          controller: _tabController,
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
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 950,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Telephone No',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(40, 195, 176, 1)),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your Telephone No',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Citizen ID or Passport No.',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(40, 195, 176, 1)),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Citizen ID or Passport No.',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 120,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RequstOtpPage()),
                                );
                              }, //Fuction That Will Use After Press This Button
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  'Request OTP',
                                  style: GoogleFonts.urbanist(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1)),
                                )),
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: new Container(
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    )),
                                    Expanded(
                                      child: new Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:
                                          Image.asset('assets/Vector01.png'),
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
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'assets/google_ic.png'),
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
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'assets/cib_apple.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                          );
                                        },
                                        child: Text(
                                          'Login Now',
                                          style: GoogleFonts.urbanist(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  7, 181, 255, 1)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'E-mail Address',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your E-mail Address.',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'First Name',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Your First Name.',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Last Name',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your Last Name.',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Citizen ID or Passport No.',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Citizen ID or Passport No.',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Password',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            obscureText: _isObcureText,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                hintText: 'Enter your password',
                                suffixIcon: IconButton(
                                  icon: _isObcureText
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(
                                          Icons.remove_red_eye_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _isObcureText = !_isObcureText;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 236, 244, 1),
                                      width: 1.0,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 236, 244, 1),
                                      width: 1.0,
                                    ))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Confirm Password',
                                style: GoogleFonts.urbanist(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            obscureText: _isObcureText1,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  icon: _isObcureText1
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(
                                          Icons.remove_red_eye_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _isObcureText1 = !_isObcureText1;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(247, 248, 249, 1),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 236, 244, 1),
                                      width: 1.0,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Color.fromRGBO(232, 236, 244, 1),
                                      width: 1.0,
                                    ))),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RequstOtpPage()),
                                );
                              }, //Fuction That Will Use After Press This Button
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(40, 195, 176, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Text(
                                  'Request OTP',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: new Container(
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    )),
                                    Expanded(
                                      child: new Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 80,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:
                                          Image.asset('assets/Vector01.png'),
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
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'assets/google_ic.png'),
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
                                          color:
                                              const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'assets/cib_apple.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: GoogleFonts.urbanist(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                          );
                                        },
                                        child: Text(
                                          'Login Now',
                                          style: GoogleFonts.urbanist(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  7, 181, 255, 1)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
