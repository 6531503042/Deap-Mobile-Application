class Appointment {
  int id;
  String drName;
  String time;
  String date;
  String condition;
  String status;

  Appointment(
      {required this.id,
      required this.drName,
      required this.time,
      required this.date,
      required this.condition,
      required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'drName': drName,
      'time': time,
      'date': date,
      'condition': condition,
      'status': status
    };
  }

  static Appointment fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      drName: map['drName'] as String,
      time: map['time'] as String,
      date: map['date'] as String,
      condition: map['condition'] as String,
      status: map['status'] as String? ?? "Pending", // Default value is
      // set to Pending if no status provided
    );
  }
}
