import 'package:cloud_firestore/cloud_firestore.dart';
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

Future<void> queryAppointments(String userId) async {
  // Get the appointments collection
  CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');

  // Query the appointments collection to get appointments for the current user
  QuerySnapshot querySnapshot =
      await appointments.where('userId', isEqualTo: userId).get();

  // Process the query results
  querySnapshot.docs.forEach((doc) {
    // Explicitly cast appointmentData to Map<String, dynamic>
    var appointmentData = doc.data() as Map<String, dynamic>;
    if (appointmentData != null) {
      // Process the appointment data as needed
      if (appointmentData.containsKey('date')) {
        if (kDebugMode) {
          print('Date: ${appointmentData['date']}');
        }
      }
      if (appointmentData.containsKey('time')) {
        if (kDebugMode) {
          print('Time: ${appointmentData['time']}');
        }
      }
    }
  });
}
