import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dentist_appointment/components/OrLoginWithTap.dart';
import 'package:dentist_appointment/screens/RegSuccessPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegEmailForm extends StatefulWidget {
  const RegEmailForm({Key? key}) : super(key: key);

  @override
  State<RegEmailForm> createState() => _RegEmailFormState();
}

class _RegEmailFormState extends State<RegEmailForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _citizenController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late bool _passwordVisible;
  late bool _passwordVisible1;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible1 = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _citizenController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Email Address TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'E-mail Address',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'E-mail Address',
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
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // First Name TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'First Name',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'First Name',
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
              controller: _firstNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Last Name TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Last Name',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'Last Name',
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
              controller: _lastNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Citizen ID TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Citizen ID',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'Citizen ID',
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
              controller: _citizenController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your citizen ID';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Password TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Password',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'Password',
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
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_passwordVisible,
              controller: _passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Confirm Password TextFormField
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                'Confirm Password',
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(40, 195, 176, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  decorationThickness: 0,
                  fontWeight: FontWeight.w400),
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
                hintText: 'Confirm Password',
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
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromRGBO(131, 145, 161, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible1 = !_passwordVisible1;
                    });
                  },
                ),
              ),
              obscureText: !_passwordVisible1,
              controller: _confirmPasswordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            // Register Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(40, 195, 176, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text);

                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(userCredential.user!.uid)
                          .set({
                        'email': _emailController.text,
                        'firstName': _firstNameController.text,
                        'lastName': _lastNameController.text,
                        'citizenID': _citizenController.text,
                        'password': _passwordController.text,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegSuccessPage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('The password provided is too weak.'),
                          ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'The account already exists for that email.'),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('An error occurred. Please try again.'),
                        ),
                      );
                    }
                  }
                },
                child: Center(
                  child: Text(
                    'Register',
                    style: GoogleFonts.urbanist(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const OtherloginTap(),
          ],
        ),
      ),
    );
  }
}
