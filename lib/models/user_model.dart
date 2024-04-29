import 'package:dentist_appointment/models/appointment_model.dart';

class User {
  int id;
  String name;
  String email;
  String password;
  String phoneNumber;
  String image;
  List<Appointment> myAppointments;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.image,
    required this.myAppointments,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'image': image,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      image: map['image'] as String,
      myAppointments: [], // You may need to load appointments from another table
    );
  }
}
