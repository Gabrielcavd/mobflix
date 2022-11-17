import 'package:challange_mobile_alura/Widgets/homePage.dart';
import 'package:challange_mobile_alura/Widgets/videoCardData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobflix',
      home: videoCardInherited(child: const homePage()),
    );
  }
}
