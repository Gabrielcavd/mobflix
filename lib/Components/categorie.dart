import 'package:challange_mobile_alura/Screens/filterScreen.dart';
import 'package:flutter/material.dart';

class categories extends StatelessWidget {
  String categorieName;
  int categorieColor;

  categories({Key? key, required this.categorieName, required this.categorieColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          primary: Color(categorieColor),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (contextNew) {
            return filterScreen(categorieName: categorieName, categorieColor: categorieColor);
          }));
        },
        child: Text(categorieName),
      ),
    );
  }
}



