import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  String texto;
  Color cor;

  categories({Key? key, required this.texto, required this.cor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 2),
      padding: const EdgeInsets.symmetric(
          vertical: 8, horizontal: 17),
      decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(texto, style: const TextStyle(color: Colors.white),),
    );
  }
}



