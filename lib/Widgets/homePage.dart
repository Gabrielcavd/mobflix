import 'package:flutter/material.dart';
import 'highlight.dart';
import 'videoCard.dart';
import 'categorie.dart';
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
            children: [
              const highlight(
                  url:
                      'https://img.youtube.com/vi/DotnJ7tTA34/maxresdefault.jpg'),
              const rowCategories(),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: const [
                    videoCard(
                        url:
                            'https://img.youtube.com/vi/dD264ZjfKlk/maxresdefault.jpg',
                        categorie:
                            categories(texto: 'Terror', cor: Colors.yellow)),
                    videoCard(
                        url:
                            'https://img.youtube.com/vi/i6avfCqKcQo/maxresdefault.jpg',
                        categorie:
                            categories(texto: 'Ficção', cor: Colors.green)),
                    videoCard(
                        url:
                            'https://img.youtube.com/vi/i6avfCqKcQo/maxresdefault.jpg',
                        categorie:
                            categories(texto: 'Ficção', cor: Colors.green))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
