import 'package:inspector/model/user.dart';
import 'package:inspector/services/persistance_service.dart';

class MockPersistanceService extends PersistanceService {
  bool _sendData = false;
  bool _useFingerprint = true;
  User _user;
  String _pin;
  DateTime _dateTime;
  String _token;

  @override
  Future<bool> getDataSendingState() async {
    return _sendData;
  }

  @override
  Future<bool> getFingerprintState() async {
    return _useFingerprint;
  }

  @override
  Future<String> getPin() async {
    return _pin;
  }

  @override
  Future<User> getUser() async {
    return _user;
  }

  @override
  Future<void> saveDataSendingState(bool state) async {
    _sendData = state;
  }

  @override
  Future<void> saveFingerprintState(bool state) async {
    _useFingerprint = state;
  }

  @override
  Future<void> savePin(String pin) {
    _pin = pin;
  }

  @override
  Future<void> saveUser(User user) {
    _user = user;
  }

  @override
  Future<DateTime> getLastDataSendingDate() async {
    return _dateTime;
  }

  @override
  Future<void> saveLastDataSendingDate(DateTime dateTime) async {
    _dateTime = dateTime;
  }

  @override
  Future<String> getToken() async {
    return _token;
  }

  @override
  Future<void> setToken(String token) async {
    _token = token;
  }
  
}
