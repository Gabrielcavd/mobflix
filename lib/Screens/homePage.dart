import 'package:challange_mobile_alura/Widgets/rowVideoCards.dart';
import 'package:flutter/material.dart';
import '../Widgets/highlight.dart';
import 'videoRegistrationScreen.dart';
import '../Widgets/rowCategories.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextBuilder) =>
                  registrationScreen(),
            ),
          ).then((value) => setState(() {
                print('reconstruindo tela');
              }));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'MOBFLIX',
          style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
             highlight(
                 url:
                     'DotnJ7tTA34'),
            rowCategories(),
            Expanded(
              child: rowVideoCard(),
            ),
          ],
        ),
      ),
    );
  }
}