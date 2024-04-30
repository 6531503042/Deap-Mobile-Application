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
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Regression_Page extends StatefulWidget {
  const Regression_Page({super.key});

  @override
  State<Regression_Page> createState() => _Regression_PageState();
}

class _Regression_PageState extends State<Regression_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Progression',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back), // Example of using an icon as leading widget
          onPressed: () {
            // Add functionality for the leading icon/button
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 30,
                percent: 1,
                progressColor: Colors.green.shade300,
                backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                circularStrokeCap: CircularStrokeCap.butt,
                center: Image.asset(
                  'assets/Vector.png',
                  width: 40,
                  height: 40,
                ),

              ),
              LinearPercentIndicator(
                width: 60,
                lineHeight: 7,
                percent: 0.5,
                progressColor: Colors.green.shade300,
                backgroundColor: const Color.fromARGB(64, 158, 158, 158),
              ),
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 5,
                percent: 0.0,
                progressColor: Colors.green.shade300,
                backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                circularStrokeCap: CircularStrokeCap.butt,
                center: Image.asset(
                  'assets/2.png',
                  width: 40,
                  height: 40,
                ),
              ),
              LinearPercentIndicator(
                width: 60,
                lineHeight: 7,
                percent: 0.0,
                progressColor: Colors.blue,
                backgroundColor: const Color.fromARGB(64, 158, 158, 158),
              ),
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 5,
                percent: 0,
                progressColor: Colors.green.shade300,
                backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                circularStrokeCap: CircularStrokeCap.butt,
                center: Image.asset(
                  'assets/3.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
