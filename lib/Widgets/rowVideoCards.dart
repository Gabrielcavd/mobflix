import 'package:challange_mobile_alura/Widgets/videoCard.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';

class rowVideoCard extends StatelessWidget {
  const rowVideoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children:  const[
          videoCard(
              url:
              'https://img.youtube.com/vi/dD264ZjfKlk/maxresdefault.jpg',
              categorie:
              categories(texto: 'Terror', cor: Colors.blueGrey)),
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
    );
  }
}
