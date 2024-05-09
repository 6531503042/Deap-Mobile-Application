import 'package:dentist_appointment/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<User?> registerWithEmail(
  String email,
  String firstName,
  String lastName,
  String citizenId,
  String password,
  String confirmPassword,
) async {
  try {
    if (password != confirmPassword) {
      throw FirebaseAuthException(
        code: 'passwords-not-matching',
        message: 'Passwords do not match',
      );
    }

    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Create user model here
    UserModel user = UserModel(
      id: userCredential.user!.uid,
      email: email,
      firstName: firstName,
      lastName: lastName,
      citizenId: citizenId,
      password: password,
    );

    // Save user data to Firestore or your database
    // For example:
    // await FirebaseFirestore.instance.collection('users').doc(user.id).set(user.toMap());

    return userCredential.user;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return null;
  }
}
