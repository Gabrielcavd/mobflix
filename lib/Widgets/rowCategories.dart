import 'package:challange_mobile_alura/Data/categoriesData.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';

class rowCategories extends StatefulWidget {
  rowCategories({Key? key}) : super(key: key);

  @override
  State<rowCategories> createState() => _rowCategoriesState();
}

class _rowCategoriesState extends State<rowCategories> {
  List<categories> categorieList = [];

  void getCategories() {
    List<dynamic> responseData = categoryData;
    List<categories> itemsList = [];
    responseData.forEach((categorie) {
      itemsList.add(categories(categorieName: categorie["categorieName"], categorieColor: categorie["colorInt"],));
    });
    setState(() {
      categorieList = itemsList;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categorieList,
        ),
      ),
    );
  }
}
