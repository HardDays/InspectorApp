
import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

abstract class ObjectDBService {

  ObjectDB db;

  Future initNamed(String name) async {
    if (db == null) {
      final appDocDir = await getApplicationDocumentsDirectory();

      final dbFilePath = [appDocDir.path, name].join('/');
      db = ObjectDB(dbFilePath);
      await db.open();
    }
  }
}
