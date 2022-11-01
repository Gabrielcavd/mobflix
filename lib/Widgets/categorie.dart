import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  final String texto;
  final Color cor;

  const categories({Key? key, required this.texto, required this.cor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 2),
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10)),
      child: Text(texto),
    );
  }
}



