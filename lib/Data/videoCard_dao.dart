import  'package:challange_mobile_alura/Components/videoCard.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';

class videoCardDao{
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_url TEXT, '
      '$_categorieName TEXT, '
      '$_colorCategorie INTEGER)';

  static const String _tablename = 'videoTable';
  static const String _url = 'url';
  static const String _categorieName = 'categorieName';
  static const String _colorCategorie = 'colorCategorie';

  save(videoCard video) async{
    print('Acessando o save: ');
    final Database dataBaseLocal = await getDatabase();
    var itemExists = await find(video.url);
    final Map<String, dynamic> videoCardsMap = toMap(video);

    if(itemExists.isEmpty){
      print('O video não existia');
      return await dataBaseLocal.insert(_tablename, videoCardsMap);
    } else{
      print('O video já existia');
      return await dataBaseLocal.update(_tablename, videoCardsMap, where: '$_url = ?', whereArgs: [video.url]);
    }
  }

  Future<List<videoCard>> findAll() async{
    print('Acessando o findAll: ');

    final Database dataBaseLocal = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBaseLocal.query(_tablename);

    print('Entrado: $result');
    return toList(result);
  }

  Future<List<videoCard>> find(String url) async{
    print('Acessando find: ');

    final Database dataBaseLocal = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBaseLocal.query(_tablename, where: '$_url = ?', whereArgs: [url]);

    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  Future<List<videoCard>> findCategorie(String categorieName) async{
    print('Acessando findCategorie');

    final Database dataBaseLocal = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBaseLocal.query(_tablename, where: '$_categorieName = ?', whereArgs: [categorieName]);

    print('Categoria encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String url) async{
    print('Deletando video');

    final Database dataBaseLocal = await getDatabase();
    return dataBaseLocal.delete(_tablename, where: '$_url = ?', whereArgs: [url]);

  }

  List<videoCard> toList(List<Map<String, dynamic>> dataBaseList) {
    print('Convertendo lista');
    final List<videoCard> videoCardsList = [];
    for (Map<String, dynamic> row in dataBaseList){
      final videoCard video = videoCard(url: row[_url], categorieName: row[_categorieName], categorieColor: row[_colorCategorie]);
      videoCardsList.add(video);
    }
    print('Lista: $videoCardsList');
    return videoCardsList;
  }

  Map<String, dynamic> toMap(videoCard video){
    print('Convertendo video em map');
    final Map<String, dynamic> videoCardsMap = {};

    videoCardsMap[_url] = video.url;
    videoCardsMap[_categorieName] = video.categorieName;
    videoCardsMap[_colorCategorie] = video.categorieColor;
    print('Mapa: $videoCardsMap');

    return videoCardsMap;
  }

}