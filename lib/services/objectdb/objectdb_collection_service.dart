
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';

abstract class ObjectDbCollectionService<T> extends ObjectDBService {

  final Function(Map<String, dynamic>) _fromJson;

  ObjectDbCollectionService(this._fromJson);

  Future<List<T>> all() async {
    await init();
    try {
      final data = await db.find({});
      return List<T>.from(data.map((e) => _fromJson(e)));
    } catch (ex) {
      throw ParseException();
    }
  }

  Future save(List<dynamic> value) async {
    await init();
    try {
      await db.remove({});
      await db.insertMany(List<Map<dynamic, dynamic>>.from(value.map((e) => e.toJson())));
    } catch (ex) {
      print(ex);
    }
  }
}
