
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';

class ObjectDbCollectionService<T> extends ObjectDBService {

  static final Map<String, ObjectDbCollectionService> _instances =  {

  };

  factory ObjectDbCollectionService(String name, Function(Map<String, dynamic>) fromJson) {
    if (_instances[name] == null) {
      _instances[name] = ObjectDbCollectionService<T>._internal(name, fromJson);
    } 
    return _instances[name];
  }

  ObjectDbCollectionService._internal(this._name, this._fromJson);

  final String _name;
  final Function(Map<String, dynamic>) _fromJson;

  @override
  String get name => _name;

  Future<List<T>> all({Map<dynamic, dynamic> query = const {}}) async {
    await init();
    try {
      final data = await db.find(query);
      final t = 0;
      return List<T>.from(data.map((e) => _fromJson(e)));
    } catch (ex) {
      throw ParseException();
    }
  }

  Future saveAll(List<dynamic> value) async {
    await init();
    try {
      await db.remove({});
      await db.insertMany(List<Map<dynamic, dynamic>>.from(value.map((e) => e.toJson())));
      await db.tidy();
    } catch (ex) {
      print(ex);
    }
  }

  Future save(Map<dynamic, dynamic> query, dynamic value) async {
    await init();
    try {
      await db.remove(query);
      await db.insert(value.toJson());
      await db.tidy();
    } catch (ex) {
      print(ex);
    }
  }

  Future remove(Map<dynamic, dynamic> query) async {
    await init();
    try {
      await db.remove(query);
      await db.tidy();
    } catch (ex) {
      print(ex);
    }
  }

  // Future append(List<dynamic> value) async {
  //   await init();
  //   try {
  //     await db.insertMany(List<Map<dynamic, dynamic>>.from(value.map((e) => e.toJson())));
  //   } catch (ex) {
  //     print(ex);
  //   }
  // }

  // Future tidy() async {
  //   await db.tidy();
  // }

  Future clear() async {
    await init();
    await db.remove({});
  }
}
