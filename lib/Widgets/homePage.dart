import 'package:challange_mobile_alura/Widgets/rowVideoCards.dart';
import 'package:flutter/material.dart';
import 'highlight.dart';
import 'videoRegistrationScreen.dart';
import 'rowCategories.dart';


class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const registrationScreen()
            ),
          );
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
        child: SingleChildScrollView(
          child: Column(
            children: const [
              highlight(
                  url:
                      'https://img.youtube.com/vi/DotnJ7tTA34/maxresdefault.jpg'),
              rowCategories(),
              //Divider(height: 30, color: Colors.white,),
              rowVideoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
