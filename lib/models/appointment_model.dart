import 'package:intl/intl.dart';

class Appointment {
  final String userId; // Foreign key
  final DateTime date;
  final String time;
  final String problemDescription;

  Appointment({
    required this.userId,
    required this.date,
    required this.time,
    required this.problemDescription,
  });

  factory Appointment.fromFirestore(Map<String, dynamic> json) {
    return Appointment(
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      problemDescription: json['problemDescription'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'date': DateFormat('yyyy-MM-dd').format(date),
      'time': time,
      'problemDescription': problemDescription,
    };
  }
}
