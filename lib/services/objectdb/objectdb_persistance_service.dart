import 'package:inspector/model/user.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:intl/intl.dart';

class ObjectDbPersistanceService extends ObjectDBService implements PersistanceService {

  String get name => 'persistance.db';

  Future _saveKeyValue(String key, dynamic value) async {
    await init();
    try {
      await db.remove({
        'key': key,
      });
      await db.insert({
        'key': key,
        'value': value
      });
      await db.tidy();
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> _getKeyValue(String key) async {
    await init();
    try {
      final data = await db.find({
        'key': key,
      });
      if (data.isNotEmpty) {
        return data.first['value'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _removeKeyValue(String key) async {
    await init();
    await db.remove({'key': key});
  }

  @override
  Future<void> clearAllData() async {
    await init();
    await db.remove({});
    await db.tidy();
  }

  @override
  Future<void> clearUserData() async {
    await init();
    await _removeKeyValue('user');
    await _removeKeyValue('pin');
    await _removeKeyValue('token');
    await db.tidy();
  }

  @override
  Future<List<Instruction>> getAll() async {
    final instructions = await _getKeyValue('instructions');
    return instructions == null ? List<Instruction>() : instructions.map((e) => Instruction.fromJson(e));
  }

  @override
  Future<bool> getDataSendingState() async {
    return await _getKeyValue('dataSendingState');
  }

  @override
  Future<bool> getFingerprintState() async {
    return await _getKeyValue('fingerPrintState');
  }

  @override
  Future<String> getInstructionsDate() async {
    return await _getKeyValue('instructionDate');
  }

  @override
  Future<String> getInstructionsSort() async {
    return await _getKeyValue('instructionSort');
  }

  @override
  Future<DateTime> getLastDataSendingDate() async {
    final dateTime = await _getKeyValue('lastDataSendingDate');
    return dateTime == null ? null : DateTime.fromMillisecondsSinceEpoch(dateTime);
  }

  @override
  Future<String> getPin() async {
    return await _getKeyValue('pin');
  }

  @override
  Future<User> getPreviousUser() async {
    final user = await _getKeyValue('previousUser');
    return user == null ? null : User.fromJson(await _getKeyValue('previousUser'));
  }

  @override
  Future<String> getToken() async {
    return await _getKeyValue('token');
  }

  @override
  Future<User> getUser() async {
    final user = await _getKeyValue('user');
    return user == null ? null : User.fromJson(await _getKeyValue('user'));
  }

  @override
  Future<void> save(List<Instruction> instructions) async {
    await _saveKeyValue('instructions', instructions.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> saveDataSendingState(bool state) async {
    await _saveKeyValue('dataSendingState', state);
  }

  @override
  Future<void> saveFingerprintState(bool state) async {
    await _saveKeyValue('fingerprintState', state);
  }

  @override
  Future<void> saveInstructionSort(String value) async {
    await _saveKeyValue('instructionSort', value);
  }

  @override
  Future<void> saveInstructionsDate() async {
    await _saveKeyValue('instructionDate', DateFormat('dd.MM.yyyy hh:mm').format(DateTime.now()));
  }
  
  Future saveInstructionFilters(InstructionFilters value) async {
    await _saveKeyValue('instructionFilters', value.toJson());
  }

  Future<InstructionFilters> getInstructionFilters() async {
    return InstructionFilters.fromJson(await _getKeyValue('instructionFilters') ?? {});
  }
  
  @override
  Future<void> saveLastDataSendingDate(DateTime dateTime) async {
    await _saveKeyValue('lastDataSendingDate', dateTime.millisecondsSinceEpoch);
  }

  @override
  Future<void> savePin(String pin) async {
    await _saveKeyValue('pin', pin);
  }

  @override
  Future<void> savePreviousUser(User user) async {
    await _saveKeyValue('previousUser', user.toJson());
  }

  @override
  Future<void> saveUser(User user) async {
    await _saveKeyValue('user', user.toJson());
  }

  @override
  Future<void> setToken(String token) async {
    await _saveKeyValue('token', token);
  }

}
