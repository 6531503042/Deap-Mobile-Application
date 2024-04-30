import 'package:dentist_appointment/main_layout.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
// import 'package:dentist_appointment/screens/auth_page.dart' show AuthPage;
import 'package:dentist_appointment/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dentist_appointment/utils/config.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // Pushing navigator
//   static final navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey,
//       title: 'Flutter Doctor Appointment Application',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         inputDecorationTheme: const InputDecorationTheme(
//           focusColor: Config.primaryColor,
//           border: Config.outlinedBorder,
//           focusedBorder: Config.focusBorder,
//           errorBorder: Config.errorBorder,
//           enabledBorder: Config.outlinedBorder,
//           floatingLabelStyle: TextStyle(color: Config.primaryColor),
//           prefixIconColor: Colors.black38,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           backgroundColor: Config.primaryColor,
//           selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
//           showSelectedLabels: true,
//           showUnselectedLabels: false,
//           unselectedItemColor: Colors.grey,
//           elevation: 10,
//           type: BottomNavigationBarType.fixed, // Corrected typo here
//         ),
//       ),
//       initialRoute: '/',
//       routes: {
//         // Initial route for application
//         // Auth Page (Login // Register)
//         '/': (context) => const AuthPage(),

//         // For Main Layout after Login
//         'main': (context) => const MainLayout(),

//         // //Appointment Page
//         // 'appointments': (context) => const AppointmentPage(),

//         // //Sucessful Appointment Leading Page

//         // 'success-lead': (context) => const AppointmentBooked(),
//       },
//     );
//   }
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
    );
  }
}
