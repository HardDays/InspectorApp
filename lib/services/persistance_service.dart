import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/user.dart';

abstract class PersistanceService {
  Future<void> savePin(String pin);
  Future<void> saveUser(User user);
  Future<String> getPin();
  Future<User> getUser();
  Future<void> saveFingerprintState(bool state);
  Future<void> saveDataSendingState(bool state);
  Future<bool> getFingerprintState();
  Future<bool> getDataSendingState();
  Future<void> saveLastDataSendingDate(DateTime dateTime);
  Future<DateTime> getLastDataSendingDate();
}