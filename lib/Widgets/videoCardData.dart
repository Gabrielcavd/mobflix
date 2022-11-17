import 'package:challange_mobile_alura/Widgets/videoCard.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';

class videoCardInherited extends InheritedWidget {
   videoCardInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<videoCard> videoList = const[
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
  ];

  void addVideo(String url, categories categorie){
    videoList.add(videoCard(url: url, categorie: categorie));
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
