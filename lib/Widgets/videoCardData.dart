import 'package:challange_mobile_alura/Widgets/rowCategories.dart';
import 'package:challange_mobile_alura/Widgets/videoCard.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';

class videoCardInherited extends InheritedWidget {
   videoCardInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

   List<videoCard> videoList = [
    videoCard(
        url:
        'dD264ZjfKlk',
        categorie:
        categories(texto: 'Terror', cor: Colors.blueGrey)),
    videoCard(
        url:
        'i6avfCqKcQo',
        categorie:
        categories(texto: 'Ficção', cor: Colors.green)),
    videoCard(
        url:
        'i6avfCqKcQo',
        categorie:
        categories(texto: 'Ficção', cor: Colors.green)),
     videoCard(
         url:
         'dD264ZjfKlk',
         categorie:
         categories(texto: 'Terror', cor: Colors.blueGrey))
  ];

  void addVideo(String url, String categorieName){
    categories categorie = categories(texto: '', cor: Colors.black);

    for(int i = 0; i<rowCategories().categoriesList.length; i++){
      if(categorieName == rowCategories().categoriesList[i].texto){
        categorie.texto = rowCategories().categoriesList[i].texto;
        categorie.cor = rowCategories().categoriesList[i].cor;
      }
    }
    print(videoList.last.url);
    videoList.add(videoCard(url: url, categorie: categorie));
    print(videoList.last.url);
  }

  static videoCardInherited of(BuildContext context) {
    final videoCardInherited? result = context.dependOnInheritedWidgetOfExactType<videoCardInherited>();
    assert(result != null, 'No rowVideoCards found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(videoCardInherited old) {
    return old.videoList.length != videoList.length;
  }
}

