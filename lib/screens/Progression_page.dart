// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:den_app_test/data/appointment_detils.dart';

// class CheckAppointmentProcess extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Use Provider to access the appointment details
//     final appointmentDetails = Provider.of<AppointmentDetails>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Process'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Selected Date: ${appointmentDetails.selectedDate?.toIso8601String() ?? 'Not selected'}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Selected Time: ${appointmentDetails.selectedTime ?? 'Not selected'}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Problem Condition: ${appointmentDetails.problemCondition ?? 'Not provided'}',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
