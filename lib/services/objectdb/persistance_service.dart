
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:intl/intl.dart';

class ObjectDBPersistanceService extends ObjectDBService {

  Future init() async {
    return await initNamed('percistance.db');
  }

  Future _saveKeyValue(String key, dynamic value) async {
    try {
      await db.remove({
        'key': key,
      });
      await db.insert({
        'key': key,
        'value': value
      });
      await db.tidy();
    } catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> _getKeyValue(String key) async {
    final data = await db.find({
      'key': key,
    });
    if (data.isNotEmpty) {
      return data.first['value'];
    }
  }

  Future saveInstructionsDate() async {
    await _saveKeyValue('instructionDate', DateFormat('dd.MM.yyyy hh:mm').format(DateTime.now()));
  }

  Future<String> getInstructionsDate() async {
    return await _getKeyValue('instructionDate');
  }

  Future saveInstructionSort(String value) async {
    await _saveKeyValue('instructionSort', value);
  }

  Future<String> getInstructionsSort() async {
    return await _getKeyValue('instructionSort');
  }

  Future saveInstructionFilters(InstructionFilters value) async {
    await _saveKeyValue('instructionFilters', value.toJson());
  }

  Future<InstructionFilters> getInstructionFilters() async {
    return InstructionFilters.fromJson(await _getKeyValue('instructionFilters') ?? {});
  }

  Future saveToken(String value) async {
    await _saveKeyValue('token', value);
  }

  Future<String> getToken() async {
    return await _getKeyValue('token');
  }

}
