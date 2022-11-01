import 'package:flutter/material.dart';
import 'categorie.dart';

class videoCard extends StatelessWidget {
  final String url;
  final categories categorie;
  const videoCard({Key? key, required this.url, required this.categorie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categorie,
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(url),
            ),
          ),
        ],
      ),
    );
  }
}
