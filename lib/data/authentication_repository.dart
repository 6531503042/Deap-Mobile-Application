// import 'package:dentist_appointment/screens/AuthPage.dart';
// import 'package:dentist_appointment/screens/home_page.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   final _deviceStorage = GetStorage();

//   // Called from main.dart on app launcher
//   Future<void> screenRedirect() async {
//     debugPrint("== Get Storage Auth Repo ==");

//     _deviceStorage.writeIfNull('IsFirstTime', false);

//     final isFirstTime = _deviceStorage.read('IsFirstTime');

//     if (isFirstTime ?? true) {
//       await Get.offAll(() => const AuthPage());
//     } else {
//       await Get.offAll(() => HomePage());
//     }
//   }
// }
