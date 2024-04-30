import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:dentist_appointment/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_countdown/slide_countdown.dart';

class RequstOtpPage extends StatefulWidget {
  const RequstOtpPage({super.key});

  @override
  State<RequstOtpPage> createState() => _RequstOtpPageState();
}

class _RequstOtpPageState extends State<RequstOtpPage> {
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: Container(
                  width: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text(
                          'OTP Verification',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text("We have sent an OTP to",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(131, 145, 161, 1))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                            "6531503042@lamduan.mfu.ac.th. Please enter the OTP in the boxes below.",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(131, 145, 161, 1))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Enter your OTP Here',
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Ref code: 42dv',
                          style: TextStyle(fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }, //Fuction That Will Use After Press This Button
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 195, 176, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SlideCountdownSeparated(
                          onDone: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthPage()),
                            );
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: BoxDecoration(color: Colors.transparent),
                          duration: const Duration(minutes: 5),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Do you have problem with OTP sender?'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Problem Solving',
                            style: TextStyle(
                                color: Color.fromRGBO(7, 181, 255, 1)),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
