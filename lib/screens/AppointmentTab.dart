// import 'package:flutter/material.dart';

// class BookingCalendar extends StatefulWidget {
//   @override
//   _BookingCalendarState createState() => _BookingCalendarState();
// }

// class _BookingCalendarState extends State<BookingCalendar> {
//   DateTime selectedDate = DateTime.now();
//   String selectedTime = "";

//   final List<String> availableTimes = [
//     "09:00 AM",
//     "09:30 AM",
//     "10:00 AM",
//     "10:30 AM",
//     "11:00 AM",
//     "11:30 AM",
//     "12:00 PM",
//     "12:30 PM",
//     "01:00 PM",
//     "01:30 PM",
//     "02:00 PM",
//     "02:30 PM",
//     "03:00 PM",
//     "03:30 PM",
//     "04:00 PM",
//     "04:30 PM",
//     "05:00 PM",
//     "05:30 PM",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Booking Calendar'),
//       ),
//       body: Column(
//         children: [
//           // Calendar widget to select date
//           CalendarDatePicker(
//             initialDate: selectedDate,
//             onDateChanged: (DateTime newDate) {
//               setState(() {
//                 selectedDate = newDate;
//               });
//             },
//           ),
//           // Text to display selected date
//           Text(
//             'Selected Date: ${selectedDate.toIso8601String()}',
//             style: TextStyle(fontSize: 16.0),
//           ),
//           SizedBox(height: 10.0),
//           // List of available times
//           Wrap(
//             spacing: 10.0,
//             children: availableTimes.map((time) {
//               return ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedTime = time;
//                   });
//                 },
//                 child: Text(time),
//                 style: ElevatedButton.styleFrom(
//                   primary: selectedTime == time
//                       ? Color.fromARGB(255, 60, 242, 203)
//                       : Colors.grey,
//                 ),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 10.0),
//           // Button to confirm booking (replace with your booking logic)
//           ElevatedButton(
//             onPressed: () {
//               if (selectedTime.isNotEmpty) {
//                 // Handle booking logic here
//                 print(
//                     'Booking confirmed for ${selectedDate.toIso8601String()} at $selectedTime');
//               } else {
//                 // Show a message if no time is selected
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Please select a time slot'),
//                   ),
//                 );
//               }
//             },
//             child: Text('Book Appointment'),
//           ),
//         ],
//       ),
//     );
//   }
// }