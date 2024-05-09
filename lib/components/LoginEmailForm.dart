import 'package:dentist_appointment/components/OrLoginWithTap.dart';
import 'package:dentist_appointment/components/OrLoginWithTapLP.dart';
import 'package:dentist_appointment/screens/ForgetPassPage.dart';
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginEmailForm extends StatefulWidget {
  const LoginEmailForm({Key? key}) : super(key: key);

  @override
  State<LoginEmailForm> createState() => _LoginEmailFormState();
}

class _LoginEmailFormState extends State<LoginEmailForm> {
  late bool _passwordVisible;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
                enableInteractiveSelection: false,
                cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  filled: true,
                  labelStyle: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(40, 195, 176, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
                enableInteractiveSelection: false,
                cursorColor: const Color.fromRGBO(40, 195, 176, 1),
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    child: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  fillColor: const Color.fromRGBO(247, 248, 249, 1),
                  filled: true,
                  labelStyle: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.urbanist(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(40, 195, 176, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(232, 236, 244, 1),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
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
                          builder: (context) => const ForgetPassPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(right: 15),
                    ),
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(40, 195, 176, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No user found for that email.'),
                            ),
                          );
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Wrong password provided for that user.'),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to sign in'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(40, 195, 176, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const OtherloginTap(),
            ],
          ),
        ),
      ),
    );
  }
}
