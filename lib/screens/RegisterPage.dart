import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:dentist_appointment/screens/RequestOTP.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
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
    Tab(
      text: 'Telephone No.',
    ),
    Tab(
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
                margin: EdgeInsets.only(top: 15, left: 15),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.2))),
                child: Center(child: Image.asset('lib/Photo/back_arrow.png')),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                width: 320,
                child: Text(
                  'Hello! Register to get started',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Please select your preferred channel for registration.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(40, 195, 176, 1)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: 65,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(247, 248, 249, 1),
                    border: Border.all(color: Color.fromRGBO(232, 236, 244, 1)),
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                          controller: _tabController,
                          unselectedLabelColor:
                              Color.fromRGBO(131, 145, 161, 1),
                          labelColor: Color.fromRGBO(255, 255, 255, 1),
                          indicator: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              color: Color.fromRGBO(40, 195, 176, 1),
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
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Telephone No',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your Telephone No',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Citizen ID or Passport No.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Citizen ID or Passport No.',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 240,
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
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(40, 195, 176, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
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
                              margin: EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 20.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 20,
                                          )),
                                    ),
                                    Center(child: Text('Or Login with')),
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 20.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 20,
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
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
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:
                                          Image.asset('lib/Photo/Vector.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'lib/Photo/google_ic.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'lib/Photo/cib_apple.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?'),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                          );
                                        },
                                        child: Text(
                                          'Login Now',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
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
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'E-mail Address',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your E-mail Address.',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Your First Name.',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Last Name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter your Last Name.',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Citizen ID or Passport No.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
                            cursorColor: Colors.greenAccent,
                            decoration: InputDecoration(
                                hintText: 'Enter Citizen ID or Passport No.',
                                filled: true,
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
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
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Text(
                                'Confirm Password',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(40, 195, 176, 1)),
                              )),
                          TextFormField(
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
                                fillColor: Color.fromRGBO(247, 248, 249, 1),
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
                          SizedBox(
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
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                width: MediaQuery.of(context).size.width,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(40, 195, 176, 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
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
                              margin: EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 20.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 20,
                                          )),
                                    ),
                                    Center(child: Text('Or Login with')),
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 20.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 20,
                                          )),
                                    ),
                                  ],
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 20),
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
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child:
                                          Image.asset('lib/Photo/Vector.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'lib/Photo/google_ic.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                              color: Color.fromRGBO(
                                                  232, 236, 244, 1)),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.asset(
                                          'lib/Photo/cib_apple.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Already have an account?'),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                          );
                                        },
                                        child: Text(
                                          'Login Now',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
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
