import 'package:challange_mobile_alura/Data/videoCard_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'video.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(videoCardDao.tableSql);
  }, version: 1);
}
