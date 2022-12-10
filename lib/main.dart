import 'package:challange_mobile_alura/Screens/homePage.dart';
import 'package:challange_mobile_alura/Screens/videoRegistrationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: "/homePage",
      routes: {
        "/homePage": (context) => homePage(),
        "/videoRegistrationScreen": (context) => registrationScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Mobflix',

    );
  }
}
