import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';

class InstructionRequestService extends ObjectDBService {
  @override
  String get name => 'instruction_request_service';

  static final _instance = InstructionRequestService._internal();

  factory InstructionRequestService() {
    return _instance;
  }

  InstructionRequestService._internal();

  Future<void> save(int id, InstructionStatus status) async {
    await _saveKeyValue(id, status.toJson());
  }

  Future<Map<int, InstructionStatus>> all() async {
    final Map<int, InstructionStatus> resultMap = Map<int, InstructionStatus>();
    (await db.find({})).forEach((element) {
      resultMap[element['key']] = InstructionStatus.fromJson(element['value']);
    });
    return resultMap;
  }

  Future<void> remove(int id) async {
    await _removeKeyValue(id);
  }

  Future _saveKeyValue(int key, dynamic value) async {
    await init();
    try {
      await db.remove({
        'key': key,
      });
      await db.insert({'key': key, 'value': value});
      await db.tidy();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeKeyValue(int key) async {
    await init();
    await db.remove({'key': key});
  }
}
