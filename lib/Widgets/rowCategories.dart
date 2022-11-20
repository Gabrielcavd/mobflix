import 'package:flutter/material.dart';
import 'categorie.dart';

class rowCategories extends StatelessWidget {
  rowCategories({Key? key}) : super(key: key);

  final List<categories> categoriesList =  [
    categories(texto: 'Ação', cor: Colors.purpleAccent),
    categories(texto: 'Aventura', cor: Colors.redAccent),
    categories(texto: 'Romance', cor: Colors.blueAccent),
    categories(texto: 'Ficção', cor: Colors.green),
    categories(texto: 'Terror', cor: Colors.blueGrey),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoriesList,
        ),
      ),
    );
  }
}
