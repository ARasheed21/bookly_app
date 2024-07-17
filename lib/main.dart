import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy8_bookly/features/splash/presentation/screens/SplashScreen.dart';
import 'constants.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor),
      home: const SplashScreen(),
    );
  }
}
