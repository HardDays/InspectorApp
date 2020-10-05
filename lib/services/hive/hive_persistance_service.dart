import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';
import 'package:inspector/services/persistance_service.dart';

class HivePersistanceService extends PersistanceService {
  Box __cached;

  Future<Box> get _cached async {
    if (__cached == null) {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(HiveTypeId.UserId))
        Hive.registerAdapter(UserAdapter());
      __cached = await Hive.openBox('cached');
    }
    return __cached;
  }

  @override
  Future<bool> getDataSendingState() async {
    return (await _cached).get('dataSending');
  }

  @override
  Future<bool> getFingerprintState() async {
    return (await _cached).get('useFingerprint');
  }

  @override
  Future<String> getPin() async {
    return (await _cached).get('pin');
  }

  @override
  Future<User> getUser() async {
    return (await _cached).get('user');
  }

  @override
  Future<void> saveDataSendingState(bool state) async {
    (await _cached).put('dataSending', state);
  }

  @override
  Future<void> saveFingerprintState(bool state) async {
    (await _cached).put('useFingerprint', state);
  }

  @override
  Future<void> savePin(String pin) async {
    (await _cached).put('pin', pin);
  }

  @override
  Future<void> saveUser(User user) async {
    (await _cached).put('user', user);
  }
}