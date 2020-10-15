
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';

class ObjectDbCollectionService<T> extends ObjectDBService {

  final String _name;
  final Function(Map<String, dynamic>) _fromJson;

  ObjectDbCollectionService(this._name, this._fromJson);

  @override
  String get name => _name;

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
      await db.tidy();
    } catch (ex) {
      print(ex);
    }
  }

  Future append(List<dynamic> value) async {
    await init();
    try {
      await db.insertMany(List<Map<dynamic, dynamic>>.from(value.map((e) => e.toJson())));
    } catch (ex) {
      print(ex);
    }
  }

  Future tidy() async {
    await db.tidy();
  }

  Future clear() async {
    await init();
    await db.remove({});
  }
}
