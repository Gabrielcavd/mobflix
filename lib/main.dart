import 'package:flutter/material.dart';
import 'Widgets/categorie.dart';
import 'Widgets/highlight.dart';
import 'Widgets/videoCard.dart';

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
      home: Scaffold(
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
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        categories(texto: 'Ação', cor: Colors.purpleAccent),
                        categories(texto: 'Aventura', cor: Colors.redAccent),
                        categories(texto: 'Romance', cor: Colors.blueAccent),
                        categories(texto: 'Ficção', cor: Colors.green),
                        categories(texto: 'Terror', cor: Colors.yellow),
                      ],
                    ),
                  ),
                ),
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
      ),
    );
  }
}
