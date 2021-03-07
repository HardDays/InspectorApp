import 'package:inspector/model/user.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:inspector/services/persistance_service.dart';

class ObjectDbPersistanceService extends ObjectDBService
    implements PersistanceService {
  static final _instance = ObjectDbPersistanceService._internal();

  factory ObjectDbPersistanceService() {
    return _instance;
  }

  ObjectDbPersistanceService._internal();

  String get name => 'persistance.db';

  Future _saveKeyValue(String key, dynamic value) async {
    await init();
    try {
      await db.remove({
        'key': key,
      });
      await db.insert({'key': key, 'value': value});
      //await db.tidy();
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
    //await db.tidy();
  }

  @override
  Future<void> clearUserData() async {
    await init();
    await _removeKeyValue('user');
    await _removeKeyValue('pin');
    await _removeKeyValue('token');
    await _removeKeyValue('usePin');
    await _removeKeyValue('dateForNextTry');
    //await db.tidy();
  }

  @override
  Future<bool> getDataSendingState() async {
    return (await _getKeyValue('dataSendingState')) ?? true;
  }

  @override
  Future<bool> getFingerprintState() async {
    return await _getKeyValue('fingerPrintState') ?? false;
  }

  Future<DateTime> getInstructionsDate() async {
    final dateTime = await _getKeyValue('instructionsDate');
    return dateTime == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(dateTime);
  }

  Future<String> getInstructionsSort() async {
    return await _getKeyValue('instructionSort');
  }

   Future<String> getInstructionSortOrder() async {
    return await _getKeyValue('instructionSortOrder');
  }

  @override
  Future<DateTime> getLastDataSendingDate() async {
    final dateTime = await _getKeyValue('lastDataSendingDate');
    return dateTime == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(dateTime);
  }

  @override
  Future<String> getPin() async {
    return await _getKeyValue('pin');
  }

  @override
  Future<User> getPreviousUser() async {
    final user = await _getKeyValue('previousUser');
    return user == null
        ? null
        : User.fromJson(await _getKeyValue('previousUser'));
  }

  @override
  Future<String> getToken() async {
    return await _getKeyValue('token');
  }

  @override
  Future<String> getRefreshToken() async {
    return await _getKeyValue('refresh_token');
  }

  @override
  Future<String> getUrl() async {
    return await _getKeyValue('url');
  }

  @override
  Future<User> getUser() async {
    final user = await _getKeyValue('user');
    return user == null ? null : User.fromJson(await _getKeyValue('user'));
  }

  Future<InstructionFilters> getInstructionFilters() async {
    return InstructionFilters.fromJson(await _getKeyValue('instructionFilters') ?? {});
  }

  Future<DateTime> getInstructionReportDate(int instructionId) async {
    final dateTime = await _getKeyValue('instructionReportDate$instructionId');
    return dateTime == null ? null : DateTime.fromMillisecondsSinceEpoch(dateTime);
  }

  Future<int> getReportNumber() async {
    return await _getKeyValue('lastReportNumber') ?? 1;
  }

  @override
  Future<void> saveDataSendingState(bool state) async {
    await _saveKeyValue('dataSendingState', state);
  }

  @override
  Future<void> saveFingerprintState(bool state) async {
    await _saveKeyValue('fingerPrintState', state);
  }

  Future<void> saveInstructionSort(String value) async {
    await _saveKeyValue('instructionSort', value);
  }

  Future<void> saveInstructionSortOrder(String value) async {
    await _saveKeyValue('instructionSortOrder', value);
  }

  Future<void> saveInstructionsDate() async {
    await _saveKeyValue(
        'instructionsDate', DateTime.now().millisecondsSinceEpoch);
  }

  Future saveInstructionFilters(InstructionFilters value) async {
    await _saveKeyValue('instructionFilters', value.toJson());
  }

  Future<void> saveInstructionsReportDate(int instructionId, {DateTime date}) async {
    date = date ?? DateTime.now();
    await _saveKeyValue('instructionReportDate$instructionId', date.millisecondsSinceEpoch);
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

  @override
  Future<void> setRefreshToken(String token) async {
    await _saveKeyValue('refresh_token', token);
  }

  @override
  Future<void> setUrl(String url) async {
    await _saveKeyValue('url', url);
  }

  @override
  Future<DateTime> getDateForNextTry() async {
    String dateString = await _getKeyValue('dateForNextTry');
    return dateString == null ? null : DateTime.parse(dateString);
  }

  @override
  Future<void> setDateForNextTry(DateTime dateTime) async {
    await _saveKeyValue('dateForNextTry', dateTime.toIso8601String());
  }

  @override
  Future<bool> getUsePinState() async {
    return (await _getKeyValue('usePin')) ?? true;
  }

  @override
  Future<void> saveUsePinState(bool state) async {
    await _saveKeyValue('usePin', state);
  }

  @override
  Future<bool> useWebVersionOfVK() async {
    return (await _getKeyValue('useWebVersionOfVK')) ?? true;
  }

  @override
  Future<void> setUseWebVersionOfVk(bool state) async {
    await _saveKeyValue('useWebVersionOfVK', state);
  }

   Future setReportNumber(int number) async {
    return await _saveKeyValue('lastReportNumber', number);
  }

  // @override
  // Future<void> saveInstructionForSending(Instruction instruction) async {
  //   List<Instruction> instructions = await getInstructionsForSending();
  //   instructions.add(instruction);
  //   await saveInstructionsForSending(instructions);
  // }

  // @override
  // Future<void> saveReportForSending(Report report) {
  //   // TODO: implement saveReportForSending
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Iterable<Instruction>> getInstructionsForSending() async {
  //   return (await _getKeyValue('instructionsForSending')).map((e) => Instruction.fromJson(e)).cast<Instruction>().toList();
  // }

  // @override
  // Future<Iterable<Report>> getReportsForSending() {
  //   // TODO: implement getReportsForSending
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> saveInstructionsForSending(
  //     Iterable<Instruction> instructions) async {
  //   await _saveKeyValue(
  //       'instructionsForSending', instructions.map((e) => e.toJson()).toList());
  // }

  // @override
  // Future<void> saveReportsForSending(Iterable<Report> reports) async {
  //   // TODO: implement saveReportsForSending
  //   throw UnimplementedError();
  // }
}
