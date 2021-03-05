
import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

abstract class ObjectDBService {

  ObjectDB db;

  String get name;

  Future<ObjectDB> init() async {
    if (db == null) {
      final appDocDir = await getApplicationDocumentsDirectory();

      final dbFilePath = [appDocDir.path, name].join('/');
      db = ObjectDB(dbFilePath);
      await db.open();
    }
    return db;
  }
}
