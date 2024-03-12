import 'package:flutter/material.dart';
import 'package:food/Dessert_screen.dart';
import 'package:food/MainCourse_screen.dart';
import 'package:food/login_screen.dart'; // Import login_screen.dart
import 'package:food/main_screen.dart';
import 'package:food/starter_screen.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/starter', page: () => StarterScreen()),
        GetPage(name: '/main_course', page: () => MainCourseScreen()),
        GetPage(name: '/dessert', page: () => DessertScreen()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        primaryColor: Colors.red,
        useMaterial3: true,
      ),
    );
  }
}
