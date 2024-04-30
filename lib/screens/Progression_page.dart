import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Regression_Page extends StatefulWidget {
  const Regression_Page({Key? key}) : super(key: key);

  @override
  State<Regression_Page> createState() => _Regression_PageState();
}

class _Regression_PageState extends State<Regression_Page>
    with SingleTickerProviderStateMixin {
  DateTime selectedDate = DateTime.now();
  late AnimationController _controller;
  late Animation<double> _animation;
  int _numReloads = 100; // Change this to adjust the number of reloads
  String description = ''; // Holds the description data
  String dentist = '';
  String statusImage = '';
  String no = '';

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 0.0),
          weight: 50,
        ),
      ],
    ).animate(_controller);

    // Start the animation loop
    _startAnimationLoop();
  }

  // Function to start the animation loop
  void _startAnimationLoop() {
    _controller.forward().then((_) {
      // After animation completes, check if there are more reloads, then restart the animation
      if (_numReloads > 0) {
        // Delay the restart of the animation
        Future.delayed(const Duration(milliseconds: 500), () {
          _controller.reset();
          _startAnimationLoop(); // Recursive call to restart the animation
          setState(() {
            _numReloads--; // Decrement the reload counter
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to update description based on selected date
  void updateDescription(DateTime newDate) {
    // You can replace this logic with your own logic to fetch description data
    setState(() {
      if (newDate.day == 1) {
        description = 'Appointments 1st time to Oral examination';
        dentist = 'Dr. Marc M';
        no = '#5644';
      } else if (newDate.day == 8) {
        description = 'Appointments 2nd time to Oral examination';
        dentist = 'Dr. Praa';
        no = '#5652';
      } else if (newDate.day == 15) {
        description = 'Appointments to play game with dentist';
        dentist = 'Dr. Mensah T';
        no = '#5666';
      } else if (newDate.day == 20) {
        description = 'Appointments to only talk with dentist';
        dentist = 'Dr. Bellamy R';
        no = '#6000';
      } else {
        description = 'No appointments';
        dentist = 'No appointments';
        no = '#XXXX';
      }
    });
  }

  void updateStatusImage(DateTime newDate) {
    // You can replace this logic with your own logic to fetch description data
    setState(() {
      if (newDate.day == 1) {
        statusImage = 'assets/Badge.png';
      } else if (newDate.day == 8) {
        statusImage = 'assets/Badge.png';
      } else if (newDate.day == 15) {
        statusImage = 'assets/Badge.png';
      } else if (newDate.day == 20) {
        statusImage = 'assets/Badge.png';
      } else {
        statusImage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 300, top: 30),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Text(
              "Progression",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 30,
                  percent: 1,
                  progressColor: const Color.fromRGBO(40, 195, 176, 1),
                  backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                  circularStrokeCap: CircularStrokeCap.butt,
                  center: Image.asset(
                    'assets/check.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return LinearPercentIndicator(
                      width: 70,
                      lineHeight: 7,
                      percent: _animation.value,
                      progressColor: const Color.fromRGBO(40, 195, 176, 1),
                      backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                    );
                  },
                ),
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 5,
                  percent: 0.0,
                  progressColor: const Color.fromRGBO(40, 195, 176, 1),
                  backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                  circularStrokeCap: CircularStrokeCap.butt,
                  center: Image.asset(
                    'assets/2.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                LinearPercentIndicator(
                  width: 70,
                  lineHeight: 7,
                  percent: 0.0,
                  progressColor: const Color.fromRGBO(40, 195, 176, 1),
                  backgroundColor: const Color.fromARGB(64, 158, 158, 158),
                ),
                CircularPercentIndicator(
                  radius: 30,
                  lineWidth: 5,
                  percent: 0,
                  progressColor: const Color.fromRGBO(40, 195, 176, 1),
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
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Approvement",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                        color: const Color.fromARGB(50, 178, 178, 178)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            no,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            dentist,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 131, 131, 131)),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                      if (statusImage.isNotEmpty)
                        Image.asset(
                          statusImage,
                          width: 100,
                          height: 20,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Appointment Date",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),

                  // Calendar widget to select date
                  Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Color.fromRGBO(
                            40, 195, 176, 1), // Color of the selected date
                      ),
                    ),
                    child: CalendarDatePicker(
                      firstDate: DateTime.now(),
                      initialDate: selectedDate,
                      onDateChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                          updateDescription(
                              newDate); // Update data when date changes
                          updateStatusImage(newDate);
                        });
                      },
                      lastDate: DateTime.now().add(const Duration(
                          days:
                              30)), // Adjust here for the number of days in advance
                    ),
                  ),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 30),
                    child: Text(
                      description, // Display the description
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
