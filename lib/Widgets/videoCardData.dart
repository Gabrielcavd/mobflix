/*import 'package:challange_mobile_alura/Widgets/rowCategories.dart';
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
        categories(categorieName: 'Terror', categorieColor: Colors.blueGrey)),
    videoCard(
        url:
        'i6avfCqKcQo',
        categorie:
        categories(categorieName: 'Ficção', categorieColor: Colors.green)),
    videoCard(
        url:
        'i6avfCqKcQo',
        categorie:
        categories(categorieName: 'Ficção', categorieColor: Colors.green)),
     videoCard(
         url:
         'dD264ZjfKlk',
         categorie:
         categories(categorieName: 'Terror', categorieColor: Colors.blueGrey))
  ];

  videoCard addVideo(String url, String categorieName){
    categories categorie = categories(categorieName: '', categorieColor: Colors.black);

    for(int i = 0; i<rowCategories().categoriesList.length; i++){
      if(categorieName == rowCategories().categoriesList[i].categorieName){
        categorie.categorieName = rowCategories().categoriesList[i].categorieName;
        categorie.categorieColor = rowCategories().categoriesList[i].categorieColor;
      }
    }

    return videoCard(url: url, categorie: categorie);
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
}*/

